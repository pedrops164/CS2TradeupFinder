from backend.app.models import db
import os

def register_commands(app):
    @app.cli.command("populate-db")
    def populate_db():
        """Populate the database with initial data."""
        from sqlalchemy import text
        with app.app_context():
            with db.engine.connect() as connection:
                sql_file_path = os.path.join(os.path.dirname(__file__), 'skins_dump.sql')
                with open(sql_file_path, 'r', encoding="utf-8") as file:
                    query = text(file.read())
                    connection.execute(query)
        print("Database populated!")