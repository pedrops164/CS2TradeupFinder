from flask import Flask
from .models import db
from .blueprints import register_blueprints
from .commands import register_commands
from flask_migrate import Migrate
from backend.config import Config

migrate = Migrate()

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)
    
    # Initialize plugins
    db.init_app(app)
    migrate.init_app(app, db)
    
    # Import and register Blueprints
    register_blueprints(app)
    
    # register commands
    register_commands(app)
    
    return app