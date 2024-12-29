from flask import Flask
from .models import db, User
from .blueprints import register_blueprints
from .commands import register_commands
from flask_migrate import Migrate
from flask_login import LoginManager
from backend.config import Config
from .error_handlers import register_error_handlers
from .limiter import limiter

migrate = Migrate()
login_manager = LoginManager()
login_manager.login_view = 'bp_authentication.login'


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)
    
    # Initialize plugins
    db.init_app(app)
    migrate.init_app(app, db)
    login_manager.init_app(app)
    limiter.init_app(app)
    
    # Import and register Blueprints
    register_blueprints(app)
    
    # register commands
    register_commands(app)
    
    register_error_handlers(app)

    return app

@login_manager.user_loader
def load_user(id):
    return db.session.get(User, int(id))