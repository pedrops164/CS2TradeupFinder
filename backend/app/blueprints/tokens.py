# https://github.com/miguelgrinberg/microblog-api/blob/main/api/tokens.py
from apifairy import authenticate, body, response, other_responses
from app.auth import token_auth, basic_auth
from app.models import Token, db, User, UserRole
from ..schemas import TokenSchema, EmptySchema, OAuth2Schema, SteamSchema
from flask import Blueprint, current_app, request, url_for, abort, session, redirect
from werkzeug.http import dump_cookie
import secrets
import requests
from urllib.parse import urlencode
import os

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
    current_app.logger.info('oauth2_authorize')
    provider_data = current_app.config['OAUTH2_PROVIDERS'].get(provider)
    if provider_data is None:
        abort(404)
    session['oauth2_state'] = secrets.token_urlsafe(16)
    session.permanent = True
    session.modified = True
    current_app.logger.info('session[oauth2_state]: ' + session.get('oauth2_state'))
    current_app.logger.info('session data - ' + str(dict(session)))
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
    current_app.logger.info('oauth2_new')
    provider_data = current_app.config['OAUTH2_PROVIDERS'].get(provider)
    if provider_data is None:
        abort(404)
    if args['state'] != session.get('oauth2_state'):
        current_app.logger.error('invalid state')
        current_app.logger.info('session data - ' + str(dict(session)))
        current_app.logger.info(f"args['state']: {args['state']}")
        current_app.logger.info(f"session.get('oauth2_state'): {session.get('oauth2_state')}")
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


# https://github.com/fourcube/minimal-steam-openid/blob/master/server.py
# Logging in steam with openid
from urllib.parse import urlencode
from json import dumps

steam_openid_url = 'https://steamcommunity.com/openid/login'

@bp_tokens.route('/tokens/steam', methods=['GET'])
def openid_steam_authorize():
    current_app.logger.info('openid_steam_authorize')
    realm_url = current_app.config['FRONTEND_URL']
    params = {
        'openid.ns': "http://specs.openid.net/auth/2.0",
        'openid.identity': "http://specs.openid.net/auth/2.0/identifier_select",
        'openid.claimed_id': "http://specs.openid.net/auth/2.0/identifier_select",
        'openid.mode': 'checkid_setup',
        'openid.return_to': f'{realm_url}/steam/login',
        #'openid.return_to': 'https://localhost/steam/login',
        #'openid.return_to': 'http://localhost:8080/steam/login',
        'openid.realm': realm_url,
        #'openid.realm': 'https://localhost'
        #'openid.realm': 'http://localhost:8080'
    }

    query_string = urlencode(params)
    auth_url = steam_openid_url + "?" + query_string
    return redirect(auth_url)

@bp_tokens.route('/tokens/steam', methods=['POST'])
@body(SteamSchema())
@response(TokenSchema())
@other_responses({404: 'Unknown Steam id',
                 500: 'Internal server error'})
def openid_steam_new(args):
    current_app.logger.info('openid_steam_new')
    steam_id = args['steam_id']
    
    # Get the API key from the environment variable.
    api_key = os.environ.get("STEAM_API_KEY")
    if not api_key:
        current_app.logger.error("STEAM_API_KEY environment variable not set.")
        abort(500)

    # Prepare the Steam API URL.
    api_url = "https://api.steampowered.com/ISteamUser/GetPlayerSummaries/v2/"
    params = {
        'key': api_key,
        'format': 'json',
        'steamids': steam_id
    }
    
    # Make the API request.
    response = requests.get(api_url, params=params)
    try:
        data = response.json()
    except Exception as e:
        current_app.logger.error("Failed to parse JSON from Steam API: %s", e)
        abort(500)

    # Get player data (we expect one player)
    players = data.get("response", {}).get("players", [])
    if not players:
        current_app.logger.error("No player data found in Steam API response.")
        abort(404)
    player = players[0]

    # Extract the persona name and avatar URL.
    personaname = player.get("personaname")
    avatar_url = player.get("avatar")

    result = {
        "steam_id": steam_id,
        "personaname": personaname,
        "avatar_url": avatar_url
    }
    current_app.logger.info("Steam login successful: %s", result)

    # 3. Check if a user with this steam_id already exists.
    user = User.query.filter_by(steam_id=steam_id).first()
    if user:
        # User exists, update information if necessary.
        user.personaname = personaname
        user.avatar_url = avatar_url
    else:
        # Create a new user with the required steam_id.
        user = User(
            steam_id=steam_id,
            personaname=personaname,
            avatar_url=avatar_url
        )
        db.session.add(user)
    token = user.generate_auth_token()
    db.session.add(token)
    Token.clean()  # keep token table clean of old tokens
    db.session.commit()
    return token_response(token)