import pytest
from backend.app import create_app, db
from backend.config import TestConfig
from backend.app.models import User, UserRole

from sqlalchemy import text

# def populate_test_db():
#     script_path = os.path.join(basedir, "populate_test_db.sql")
#     with db.engine.connect() as connection:
#         with open(script_path, 'r', encoding="utf8") as file:
#             sql_script = file.read()
#         
#         # Split and execute individual statements
#         statements = sql_script.split(';')
#         for statement in statements:
#             if statement.strip():  # Ignore empty statements
#                 connection.execute(text(statement))
#         print("Database populated successfully!")

@pytest.fixture(scope="function", autouse=True)
def app():
    """Create and configure a new app instance for each test."""
    app = create_app(TestConfig)

    with app.app_context():
        db.create_all()  # Set up the database

        yield app

        # Cleanup: Delete all records from specified tables
        tables_to_clear = ["tradeup", "input_tradeup_entry", "output_tradeup_entry", "private_tradeup_user", "tradeup_collections", "tradeup_purchase"]
        for table in tables_to_clear:
            db.session.execute(text(f"DELETE FROM {table};"))
        db.session.commit()
        
@pytest.fixture
def client(app):
    """A test client for the app."""
    return app.test_client()

class AuthActions:
    def __init__(self, client):
        self._client = client

    def login_user(self):
        return self._login("teste@gmail.com", "password")

    def login_admin(self):
        return self._login("admin@gmail.com", "password")

    def _login(self, email, password):
        self.email = email
        self.password = password
        return self._client.post(
            "/login", json={"email": email, "password": password}
        )

    def logout(self):
        return self._client.post("/logout")
    
    def get_email(self):
        return self.email

@pytest.fixture
def auth(client):
    return AuthActions(client)