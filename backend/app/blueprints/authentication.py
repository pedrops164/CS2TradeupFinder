from flask import Blueprint, redirect, url_for, flash, request, jsonify, session
from urllib.parse import urlsplit
from flask_login import current_user, login_user, logout_user
from backend.app.models import db, User, UserRole
from backend.app.database import add_user
import sqlalchemy as sa

bp_auth = Blueprint('bp_authentication', __name__)

@bp_auth.route('/login', methods=['GET', 'POST'])
def login():
    """
    Authenticate a user and start a session.

    This route handles user authentication. If the user provides valid credentials,
    they are logged in and a session is started. If the user is already authenticated,
    a message indicating this is returned.

    Methods:
        GET: Check if the user is already authenticated.
        POST: Authenticate the user with the provided credentials.

    Request JSON Body:
        {
            "email": str,          # The email address of the user.
            "password": str,       # The password of the user.
            "remember_me": bool    # Optional. Whether to remember the user across sessions.
        }

    Query Parameters:
        next (str): Optional. The URL to redirect to after login. If not provided, redirects to the home page.

    Returns:
        json: A JSON object containing a message and the next page URL.
        - message (str): A success or error message.
        - next_page (str): The URL to redirect to after login.

    Status Codes:
        200 OK: If the login is successful or the user is already authenticated.
        400 Bad Request: If the required data is not provided.
        401 Unauthorized: If the email or password is incorrect.

    Example:
        >>> POST /login
        {
            "email": "user@example.com",
            "password": "password123",
            "remember_me": true
        }
        {
            "message": "Login successful",
            "next_page": "/"
        }
    """
    if current_user.is_authenticated:
        return jsonify({'message': 'Already authenticated'}), 200
    
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400
    
    email = data.get('email')
    password = data.get('password')
    remember_me = data.get('remember_me', False)

    if not email or not password:
        return jsonify({'error': 'Username and password are required'}), 400

    user = db.session.scalar(sa.select(User).where(email == User.email))
    if user is None or not user.check_password(password):
        return jsonify({'error': 'Invalid username or password'}), 401
    
    login_user(user, remember=remember_me)
    next_page = request.args.get('next')
    if not next_page or urlsplit(next_page).netloc != '':
        next_page = '/'

    return jsonify({'message': 'Login successful', 'next_page': next_page}), 200

@bp_auth.route('/register', methods=['POST'])
def register_user():
    """
    Register a new user.

    This route handles user registration. It creates a new user in the database
    if the provided email is not already registered and the passwords match.

    Methods:
        POST: Register a new user with the provided credentials.

    Request JSON Body:
        {
            "email": str,               # The email address of the user.
            "password": str,            # The password of the user.
            "password_repeat": str      # The password confirmation (must match the password).
        }

    Returns:
        json: A JSON object containing a message and the next page URL.
        - message (str): A success or error message.
        - next_page (str): The URL to redirect to after registration.

    Status Codes:
        200 OK: If the registration is successful.
        400 Bad Request: If the required data is not provided, passwords do not match, or the email is already registered.

    Example:
        >>> POST /register
        {
            "email": "newuser@example.com",
            "password": "password123",
            "password_repeat": "password123"
        }
        {
            "message": "Register successful",
            "next_page": "/login"
        }
    """
    if current_user.is_authenticated:
        return jsonify({'message': 'Already authenticated'}), 200
    
    data = request.get_json()
    if not data:
        return jsonify({'error': 'No data provided'}), 400
    
    email = data.get('email')
    password = data.get('password')
    password_repeat = data.get('password_repeat')

    if not email or not password or not password_repeat:
        return jsonify({'error': 'Username and passwords are required'}), 400

    existing_user = User.query.filter_by(email=email).first()
    if existing_user:
        return jsonify({'error': 'Email is already registered'}), 400

    if password != password_repeat:
        return jsonify({'error': 'Passwords must match'}), 400
    
    new_user = User(email=email)
    new_user.set_password(password)
    add_user(new_user)

    # after successful registration, redirects to login page
    next_page = url_for('bp_authentication.login')
    return jsonify({'message': 'Register successful', 'next_page': next_page}), 200

@bp_auth.route('/logout', methods=['POST'])
def logout():
    logout_user()
    return jsonify({'message': 'Logout successful'}), 200

@bp_auth.route('/check-auth')
def check_auth():
    """
    Check if the current user is authenticated.

    This route checks whether the current user is authenticated. It can be used to verify
    if the user is logged in or not.

    Methods:
        GET: Check if the user is authenticated.

    Returns:
        json: A JSON object indicating the authentication status.
        - authenticated (bool): True if the user is authenticated, False otherwise.

    Status Codes:
        200 OK: If the check is successful, regardless of the authentication status.
        400 Bad Request: If there is no current user.
    """
    if not current_user:
        return jsonify({'error': 'No current user'}), 400
    if current_user.is_authenticated:
        return jsonify({'authenticated': True, 'user_role': str(current_user.role.value)}), 200
    else:
        # For unauthenticated users, the default role is 'user'
        return jsonify({'authenticated': False, 'user_role': UserRole.USER.value}), 200