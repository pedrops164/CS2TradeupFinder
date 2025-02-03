from flask import Flask
from .models import db, User
from .blueprints import register_blueprints
from .commands import register_commands
from flask_migrate import Migrate
from flask_login import LoginManager
from backend.config import Config
from .error_handlers import register_error_handlers
from .limiter import limiter
from flask_cors import CORS
from flask_wtf.csrf import CSRFProtect

migrate = Migrate()
login_manager = LoginManager()
login_manager.login_view = 'bp_authentication.login'
# need to define this better later
cors = CORS(origins=["http://localhost:8080"], supports_credentials=True)
csrf = CSRFProtect()

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)
    
    # Initialize plugins
    db.init_app(app)
    migrate.init_app(app, db)
    login_manager.init_app(app)
    #limiter.init_app(app) -> turn on limiter later
    cors.init_app(app)
    #csrf.init_app(app) -> need to do some things with postman. Will active this later

    # Import and register Blueprints
    register_blueprints(app)
    
    # register commands
    register_commands(app)
    
    register_error_handlers(app)

    return app

@login_manager.user_loader
def load_user(id):
    return db.session.get(User, int(id))