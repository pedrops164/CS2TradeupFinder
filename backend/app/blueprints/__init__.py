from .temporary import temp_bp

def register_blueprints(app):
    app.register_blueprint(temp_bp)