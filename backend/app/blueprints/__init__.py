from .temporary import temp_bp
from .insert import bp_insert
from .retrieve import bp_retrieve
from .authentication import bp_auth

def register_blueprints(app):
    app.register_blueprint(temp_bp)
    app.register_blueprint(bp_insert)
    app.register_blueprint(bp_retrieve)
    app.register_blueprint(bp_auth)