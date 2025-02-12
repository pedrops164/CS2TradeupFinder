from .insert import bp_insert
from .retrieve import bp_retrieve
from .authentication import bp_auth
from .tokens import bp_tokens
from .users import bp_users


def register_blueprints(app):
    app.register_blueprint(bp_insert, url_prefix='/api')
    app.register_blueprint(bp_retrieve, url_prefix='/api')
    app.register_blueprint(bp_auth, url_prefix='/api')
    app.register_blueprint(bp_tokens, url_prefix='/api')
    app.register_blueprint(bp_users, url_prefix='/api')