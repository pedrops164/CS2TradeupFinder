import os
from dotenv import load_dotenv

basedir = os.path.abspath(os.path.dirname(__file__))
load_dotenv(os.path.join(basedir, '.env'))

class Config:
    SQLALCHEMY_DATABASE_URI = os.environ.get('SQLALCHEMY_DATABASE_URI') or 'sqlite:///' + os.path.join(basedir, 'app.db')
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'secret-key-832jDSAI#Rj2q$#8/SJ!D'
    TRADEUPS_PER_PAGE = 5
    SKINS_PER_PAGE = 5

class TestConfig:
    TESTING = True # Enable testing mode
    SQLALCHEMY_DATABASE_URI = "sqlite:///" + os.path.join(basedir, 'tests.db') # Use a separate database for testing
    SECRET_KEY = os.environ.get('SECRET_KEY') or 'secret-key-832jDSAI#Rj2q$#8/SJ!D'
    WTF_CSRF_ENABLED = False # Disable CSRF protection