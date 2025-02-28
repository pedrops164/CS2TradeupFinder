import os
from dotenv import load_dotenv
import sqlalchemy

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

def as_bool(value):
    if value:
        return value.lower() in ['true', 'yes', 'on', '1']
    return False

class BaseConfig:
    SECRET_KEY = os.environ.get('SECRET_KEY')
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
        }
    }
    OAUTH2_REDIRECT_URI = os.environ.get('OAUTH2_REDIRECT_URI')
    ACCESS_TOKEN_MINUTES = int(os.environ.get('ACCESS_TOKEN_MINUTES') or '15')
    REFRESH_TOKEN_DAYS = int(os.environ.get('REFRESH_TOKEN_DAYS') or '7')
    REFRESH_TOKEN_IN_COOKIE = as_bool(os.environ.get('REFRESH_TOKEN_IN_COOKIE') or 'yes')
    REFRESH_TOKEN_IN_BODY = as_bool(os.environ.get('REFRESH_TOKEN_IN_BODY'))
    FRONTEND_URL = os.environ.get('FRONTEND_URL')

from app.connect_connector import getconn
class ProdConfig(BaseConfig):
    DEBUG = False
    DB_DRIVERNAME = os.environ.get('DB_DRIVERNAME')
    DB_USER = os.environ.get('DB_USER')
    DB_PASS = os.environ.get('DB_PASS')
    DB_HOST = os.environ.get('DB_HOST')
    DB_PORT = os.environ.get('DB_PORT')
    DB_NAME = os.environ.get('DB_NAME')
    #SQLALCHEMY_DATABASE_URI=f"{DB_DRIVERNAME}://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"
    SQLALCHEMY_DATABASE_URI=sqlalchemy.engine.url.URL.create(
        drivername=DB_DRIVERNAME,
        username=DB_USER,
        password=DB_PASS,
        host=DB_HOST,
        port=DB_PORT,
        database=DB_NAME,
    )
    SQLALCHEMY_ENGINE_OPTIONS = {"creator": getconn}
    USE_CORS = True
    CORS_SUPPORTS_CREDENTIALS = True
    CORS_HEADERS = 'Content-Type'
    USE_RATE_LIMITS = True

class DevConfig(BaseConfig):
    DEBUG = True
    SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI') or 'sqlite:///' + os.path.join(basedir, 'app.db')
    USE_CORS = False
    USE_RATE_LIMITS = False

class TestConfig(BaseConfig):
    TESTING = True # Enable testing mode
    SQLALCHEMY_DATABASE_URI = "sqlite:///" + os.path.join(basedir, 'tests.db') # Use a separate database for testing
    WTF_CSRF_ENABLED = False # Disable CSRF protection