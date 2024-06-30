from .temporary import temp_bp
from .insert import bp_insert

def register_blueprints(app):
    app.register_blueprint(temp_bp)
    app.register_blueprint(bp_insert)