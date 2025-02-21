from flask import Flask
from .models import db
from flask_migrate import Migrate
from backend.config import DevConfig
from flask_cors import CORS
from apifairy import APIFairy
from backend.app.schemas import ma

migrate = Migrate(render_as_batch=True)
# need to define this better later
#cors = CORS(origins=["http://localhost:8080"], supports_credentials=True)
cors = CORS() # define later
apifairy = APIFairy()

from backend.app.logger import configure_logging
configure_logging()

def create_app(config_class=DevConfig):
    app = Flask(__name__)
    app.config.from_object(config_class)
    
    # Initialize plugins
    db.init_app(app)
    migrate.init_app(app, db)
    ma.init_app(app)
    from .limiter import limiter
    if app.config['USE_RATE_LIMITS']:
        limiter.init_app(app)
    if app.config['USE_CORS']:
        cors.init_app(app)
    apifairy.init_app(app)

    from .blueprints import register_blueprints
    register_blueprints(app)
    from .commands import register_commands
    register_commands(app)
    from .error_handlers import register_error_handlers
    register_error_handlers(app)
    from .event_handlers import register_event_handlers
    register_event_handlers(app)

    return app