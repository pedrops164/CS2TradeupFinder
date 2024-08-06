from backend.app.models import db
from backend.src.main import solve
import os

def register_commands(app):
    @app.cli.command("populate-postgres-db")
    def populate_postgres_db():
        """Populate the database with initial data."""
        from sqlalchemy import text
        with app.app_context():
            with db.engine.connect() as connection:
                sql_file_path = os.path.join(os.path.dirname(__file__), 'postgres_dump.sql')
                with open(sql_file_path, 'r', encoding="utf-8") as file:
                    query = text(file.read())
                    connection.execute(query)
        print("Postgres Database populated!")
        
    @app.cli.command("populate-sqlite-db")
    def populate_sqlite_db():
        """Populate the SQLite database with initial data."""
        from sqlalchemy import text
        with app.app_context():
            with db.engine.connect() as connection:
                sql_file_path = os.path.join(os.path.dirname(__file__), 'sqlite_dump.sql')  # Make sure to point to the converted file
                with open(sql_file_path, 'r', encoding='utf-16') as file:
                    sql_statements = file.read()
                    for statement in sql_statements.split(';'):
                        if statement.strip():
                            connection.execute(text(statement))
            print("SQLite Database populated!")

    @app.cli.command("run-solver")
    def run_solver():
        solve()
        print("Finished solving!")
