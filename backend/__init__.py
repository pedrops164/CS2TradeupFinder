from backend.app import create_app
from backend.app.models import db
from sqlalchemy.exc import IntegrityError

app = create_app()

with app.app_context():
    db.create_all()