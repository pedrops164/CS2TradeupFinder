from flask import Blueprint
from apifairy import authenticate, response
from backend.app.auth import token_auth
from ..schemas import UserSchema

bp_users = Blueprint('bp_users', __name__)


@bp_users.route('/me', methods=['GET'])
@authenticate(token_auth)
@response(UserSchema())
def me():
    """Retrieve the authenticated user"""
    return token_auth.current_user()