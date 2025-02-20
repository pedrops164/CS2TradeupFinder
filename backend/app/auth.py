# https://github.com/miguelgrinberg/microblog-api/blob/main/api/auth.py

from flask import current_app, jsonify
from flask_httpauth import HTTPBasicAuth, HTTPTokenAuth
from werkzeug.exceptions import Unauthorized, Forbidden

from backend.app.models import User, db

basic_auth = HTTPBasicAuth()
token_auth = HTTPTokenAuth()

@basic_auth.verify_password
def verify_password(email, password):
    if email and password:
        print(email, password)
        # user = db.session.scalar(User.select().filter_by(email=email))
        user = db.session.query(User).filter_by(email=email).first()
        if user and user.check_password(password):
            return user


@basic_auth.error_handler
def basic_auth_error(status=401):
    error = (Forbidden if status == 403 else Unauthorized)()
    return {
        'code': error.code,
        'message': error.name,
        'description': error.description,
    }, error.code, {'WWW-Authenticate': 'Form'}


@token_auth.verify_token
def verify_token(access_token):
    if current_app.config['DISABLE_AUTH']:
        user = db.session.get(User, 1)
        user.ping() # not implemented
        return user
    if access_token:
        return User.verify_access_token(access_token)


@token_auth.error_handler
def token_auth_error(status=401):
    error = (Forbidden if status == 403 else Unauthorized)()
    return {
        'code': error.code,
        'message': error.name,
        'description': error.description,
    }, error.code

from functools import wraps
def admin_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        user = token_auth.current_user()  # assumes authentication has already occurred
        if not user.is_admin():
            current_app.logger.error("User %s is not authorized to access this route", user.steam_id)
            return jsonify({'error': 'Insufficient permissions'}), 403
        return f(*args, **kwargs)
    return decorated_function