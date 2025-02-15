import os
from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

def as_bool(value):
    if value:
        return value.lower() in ['true', 'yes', 'on', '1']
    return False

class Config:
    SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI') or 'sqlite:///' + os.path.join(basedir, 'app.db')
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'secret-key-832jDSAI#Rj2q$#8/SJ!D'
    TRADEUPS_PER_PAGE = 5
    SKINS_PER_PAGE = 5
    OAUTH2_PROVIDERS = {
        'google': {
            'client_id': os.environ.get('GOOGLE_CLIENT_ID'),
            'client_secret': os.environ.get('GOOGLE_CLIENT_SECRET'),
            'authorize_url': 'https://accounts.google.com/o/oauth2/auth',
            'access_token_url': 'https://accounts.google.com/o/oauth2/token',
            'get_user': {
                'url': 'https://www.googleapis.com/oauth2/v3/userinfo',
                'email': lambda json: json['email'],
            },
            'scopes': ['https://www.googleapis.com/auth/userinfo.email',
                    'https://www.googleapis.com/auth/userinfo.profile'],
            },
        'steam': {
            'client_id': os.environ.get('STEAM_CLIENT_ID'),
            'client_secret': os.environ.get('STEAM_CLIENT_SECRET'),
            'authorize_url': 'https://steamcommunity.com/oauth/login?response_type=token&client_id={client_id}&state={state}',
            'get_user': {
                'url': 'https://api.steampowered.com/ISteamUserOAuth/GetTokenDetails/v1/?access_token={access_token}',
                'email': lambda json: json['response']['players'][0]['personaname'],
            },
            'scopes': [],
        }
    }
    OAUTH2_REDIRECT_URI = os.environ.get('OAUTH2_REDIRECT_URI')
    ACCESS_TOKEN_MINUTES = int(os.environ.get('ACCESS_TOKEN_MINUTES') or '15')
    REFRESH_TOKEN_DAYS = int(os.environ.get('REFRESH_TOKEN_DAYS') or '7')
    REFRESH_TOKEN_IN_COOKIE = as_bool(os.environ.get('REFRESH_TOKEN_IN_COOKIE') or 'yes')
    REFRESH_TOKEN_IN_BODY = as_bool(os.environ.get('REFRESH_TOKEN_IN_BODY'))
    USE_CORS = as_bool(os.environ.get('USE_CORS') or 'yes')
    CORS_SUPPORTS_CREDENTIALS = True
    DISABLE_AUTH = as_bool(os.environ.get('DISABLE_AUTH'))

class TestConfig:
    TESTING = True # Enable testing mode
    SQLALCHEMY_DATABASE_URI = "sqlite:///" + os.path.join(basedir, 'tests.db') # Use a separate database for testing
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'secret-key-832jDSAI#Rj2q$#8/SJ!D'
    WTF_CSRF_ENABLED = False # Disable CSRF protection