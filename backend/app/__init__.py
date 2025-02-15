from flask import Flask
from .models import db, User
from .commands import register_commands
from flask_migrate import Migrate
from flask_login import LoginManager
from backend.config import Config
from .error_handlers import register_error_handlers
from .limiter import limiter
from flask_cors import CORS
from flask_wtf.csrf import CSRFProtect
from flask_marshmallow import Marshmallow
from apifairy import APIFairy

migrate = Migrate(render_as_batch=True)
login_manager = LoginManager()
login_manager.login_view = 'bp_authentication.login'
# need to define this better later
#cors = CORS(origins=["http://localhost:8080"], supports_credentials=True)
cors = CORS()
csrf = CSRFProtect()
ma = Marshmallow()
apifairy = APIFairy()

def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(config_class)
    
    # Initialize plugins
    db.init_app(app)
    migrate.init_app(app, db)
    ma.init_app(app)
    login_manager.init_app(app)
    #limiter.init_app(app) -> turn on limiter later
    if app.config['USE_CORS']:
        cors.init_app(app)
    apifairy.init_app(app)
    #csrf.init_app(app) -> need to do some things with postman. Will active this later

    # Import and register Blueprints
    from .blueprints import register_blueprints
    register_blueprints(app)
    
    # register commands
    register_commands(app)
    
    register_error_handlers(app)

    return app

@login_manager.user_loader
def load_user(id):
    return db.session.get(User, int(id))