# https://github.com/miguelgrinberg/microblog-api/blob/main/api/tokens.py
from apifairy import authenticate, body, response, other_responses
from backend.app.auth import token_auth, basic_auth
from backend.app.models import Token, db, User, UserRole
from .schemas import TokenSchema, EmptySchema, OAuth2Schema
from flask import Blueprint, current_app, request, url_for, abort, session
from werkzeug.http import dump_cookie
import secrets
import requests
from urllib.parse import urlencode

# Configure logging
import logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

bp_tokens = Blueprint('bp_tokens', __name__)

@bp_tokens.route('/tokens', methods=['POST'])
@authenticate(basic_auth)
@response(TokenSchema())
@other_responses({401: 'Invalid username or password'})
def new():
    """Create new access and refresh tokens

    The refresh token is returned in the body of the request or as a hardened
    cookie, depending on configuration. A cookie should be used when the
    client is running in an insecure environment such as a web browser, and
    cannot adequately protect the refresh token against unauthorized access.
    """
    user = basic_auth.current_user()
    token = user.generate_auth_token()
    db.session.add(token)
    Token.clean()  # keep token table clean of old tokens
    db.session.commit()
    return token_response(token)

def token_response(token):
    headers = {}
    if current_app.config['REFRESH_TOKEN_IN_COOKIE']:
        samesite = 'strict'
        if current_app.config['USE_CORS']:  # pragma: no branch
            samesite = 'none' if not current_app.debug else 'lax'
        headers['Set-Cookie'] = dump_cookie(
            'refresh_token', token.refresh_token,
            path=url_for('bp_tokens.new'), secure=not current_app.debug,
            httponly=True, samesite=samesite)
    return {
        'access_token': token.access_token_jwt,
        'refresh_token': token.refresh_token if current_app.config['REFRESH_TOKEN_IN_BODY'] else None,
    }, 200, headers

@bp_tokens.route('/tokens', methods=['DELETE'])
@authenticate(token_auth)
@response(EmptySchema, status_code=204, description='Token revoked')
@other_responses({401: 'Invalid access token'})
def revoke():
    """Revoke an access token"""
    access_token_jwt = request.headers['Authorization'].split()[1]
    token = Token.from_jwt(access_token_jwt)
    if not token:  # pragma: no cover
        abort(401)
    token.expire()
    db.session.commit()
    return {}

@bp_tokens.route('/tokens', methods=['PUT'])
@body(TokenSchema())
@response(TokenSchema(), description='Newly issued access and refresh tokens')
@other_responses({401: 'Invalid access or refresh token'})
def refresh(args):
    """Refresh an access token

    The client has the option to pass the refresh token in the body of the
    request or in a `refresh_token` cookie. The access token must be passed in
    the body of the request.
    """
    access_token_jwt = args['access_token']
    refresh_token = args.get('refresh_token', request.cookies.get(
        'refresh_token'))
    if not access_token_jwt or not refresh_token:
        abort(401)
    token = User.verify_refresh_token(refresh_token, access_token_jwt)
    if not token:
        abort(401)
    token.expire()
    new_token = token.user.generate_auth_token()
    db.session.add_all([token, new_token])
    db.session.commit()
    return token_response(new_token)


@bp_tokens.route('/tokens/oauth2/<provider>', methods=['GET'])
@response(EmptySchema, status_code=302,
          description="Redirect to OAuth2 provider's authentication page")
@other_responses({404: 'Unknown OAuth2 provider'})
def oauth2_authorize(provider):
    """Initiate OAuth2 authentication with a third-party provider"""
    logger.info('oauth2_authorize')
    provider_data = current_app.config['OAUTH2_PROVIDERS'].get(provider)
    if provider_data is None:
        abort(404)
    session['oauth2_state'] = secrets.token_urlsafe(16)
    session.permanent = True
    session.modified = True
    logger.info('session[oauth2_state]: ' + session.get('oauth2_state'))
    logger.info('session data - ' + str(dict(session)))
    qs = urlencode({
        'client_id': provider_data['client_id'],
        'redirect_uri': current_app.config['OAUTH2_REDIRECT_URI'].format(
            provider=provider),
        'response_type': 'code',
        'scope': ' '.join(provider_data['scopes']),
        'state': session['oauth2_state'],
    })
    return {}, 302, {'Location': provider_data['authorize_url'] + '?' + qs}

@bp_tokens.route('/tokens/oauth2/<provider>', methods=['POST'])
@body(OAuth2Schema())
@response(TokenSchema())
@other_responses({401: 'Invalid code or state',
                  404: 'Unknown OAuth2 provider'})
def oauth2_new(args, provider):
    """Create new access and refresh tokens with OAuth2 authentication

    The refresh token is returned in the body of the request or as a hardened
    cookie, depending on configuration. A cookie should be used when the
    client is running in an insecure environment such as a web browser, and
    cannot adequately protect the refresh token against unauthorized access.
    """
    logger.info('oauth2_new')
    provider_data = current_app.config['OAUTH2_PROVIDERS'].get(provider)
    if provider_data is None:
        abort(404)
    if args['state'] != session.get('oauth2_state'):
        logger.error('invalid state')
        logger.info('session data - ' + str(dict(session)))
        logger.info(f"args['state']: {args['state']}")
        logger.info(f"session.get('oauth2_state'): {session.get('oauth2_state')}")
        abort(401)
    response = requests.post(provider_data['access_token_url'], data={
        'client_id': provider_data['client_id'],
        'client_secret': provider_data['client_secret'],
        'code': args['code'],
        'grant_type': 'authorization_code',
        'redirect_uri': current_app.config['OAUTH2_REDIRECT_URI'].format(
            provider=provider),
    }, headers={'Accept': 'application/json'})
    if response.status_code != 200:
        abort(401)
    oauth2_token = response.json().get('access_token')
    if not oauth2_token:
        abort(401)
    response = requests.get(provider_data['get_user']['url'], headers={
        'Authorization': 'Bearer ' + oauth2_token,
        'Accept': 'application/json',
    })
    if response.status_code != 200:
        abort(401)
    email = provider_data['get_user']['email'](response.json())
    user = db.session.query(User).filter(User.email == email).first()
    if user is None:
        #user = User(email=email, username=email.split('@')[0])
        user = User(email=email, role=UserRole.USER)
        db.session.add(user)
    token = user.generate_auth_token()
    db.session.add(token)
    Token.clean()  # keep token table clean of old tokens
    db.session.commit()
    return token_response(token)