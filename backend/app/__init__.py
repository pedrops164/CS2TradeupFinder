from flask import Flask
from .models import db
from flask_migrate import Migrate
from config import DevConfig
from flask_cors import CORS
from apifairy import APIFairy
from app.schemas import ma
from flask_apscheduler import APScheduler

migrate = Migrate(render_as_batch=True)
# need to define this better later
apifairy = APIFairy()
scheduler = APScheduler()

from app.logger import configure_logging
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
        cors = CORS(app, resources={r"/api/*": {"origins": app.config['FRONTEND_URL'], "supports_credentials": True}})
        app.logger.info(f"CORS enabled for {app.config['FRONTEND_URL']}")
    apifairy.init_app(app)
    scheduler.init_app(app)

    from .blueprints import register_blueprints
    register_blueprints(app)
    from .commands import register_commands
    register_commands(app)
    from .error_handlers import register_error_handlers
    register_error_handlers(app)
    from .event_handlers import register_event_handlers
    register_event_handlers(app)
    from .schedulers import register_schedulers
    register_schedulers(scheduler, app)
    scheduler.start()

    return app