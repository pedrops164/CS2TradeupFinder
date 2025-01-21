from .insert import bp_insert
from .retrieve import bp_retrieve
from .authentication import bp_auth

def register_blueprints(app):
    app.register_blueprint(bp_insert, url_prefix='/api')
    app.register_blueprint(bp_retrieve, url_prefix='/api')
    app.register_blueprint(bp_auth, url_prefix='/api')