from app import create_app
from app.models import db
from config import DevConfig, ProdConfig
import os

if os.environ.get('FLASK_ENV') == 'production':
    app = create_app(ProdConfig)
else:
    app = create_app(DevConfig)

with app.app_context():
    db.create_all()