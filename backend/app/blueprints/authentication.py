from flask import Blueprint, redirect, url_for, flash, request, jsonify
from urllib.parse import urlsplit
from flask_login import current_user, login_user, logout_user
from backend.app.models import db, User
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

@bp_auth.route('/logout', methods=['POST'])
def logout():
    logout_user()
    return jsonify({}), 200