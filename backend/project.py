from app import create_app
from app.models import db
from config import DevConfig, ProdConfig, TestConfig
import os

if os.environ.get('FLASK_ENV') == 'production':
    print("Creating app with ProdConfig")
    app = create_app(ProdConfig)
elif os.environ.get('FLASK_ENV') == 'development':
    print("Creating app with DevConfig")
    app = create_app(DevConfig)
elif os.environ.get('FLASK_ENV') == 'testing':
    print("Creating app with TestConfig")
    app = create_app(TestConfig)

with app.app_context():
    db.create_all()