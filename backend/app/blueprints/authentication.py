from flask import Blueprint, redirect, url_for, flash, request, jsonify, session
from urllib.parse import urlsplit
from flask_login import current_user, login_user, logout_user
from backend.app.models import db, User
from backend.app.database import add_user
import sqlalchemy as sa

bp_auth = Blueprint('bp_authentication', __name__)

@bp_auth.route('/login', methods=['GET', 'POST'])
def login():
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
        next_page = url_for('views.home')

    return jsonify({'message': 'Login successful', 'next_page': next_page}), 200

@bp_auth.route('/register', methods=['POST'])
def register_user():
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
    if not current_user:
        return jsonify({'error': 'No current user'}), 400
    if current_user.is_authenticated:
        return jsonify({'authenticated': True}), 200
    else:
        return jsonify({'authenticated': False}), 200