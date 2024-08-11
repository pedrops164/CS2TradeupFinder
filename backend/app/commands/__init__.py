from backend.app.models import db
from backend.src.main import solve
from backend.src.benchmark import run_benchmarks
from backend.src.solvers.solver_manager import SearchSpace
from backend.src.scrape100 import update_all_weapon_paints_prices
import click
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
        search_space = SearchSpace(range(40,41), [0.3], ["classified_bg"], [False], 'single')
        solve(search_space)
        print("Finished solving!")

    @app.cli.command("run-solver-doubles")
    def run_solver_doubles():
        search_space = SearchSpace(range(1,77), [0.5], ["milspec_bg"], [False], 'double')
        solve(search_space)
        print("Finished solving!")

    @app.cli.command("run-benchmarks")
    @click.argument("name")
    def run_solver(name):
        run_benchmarks(name)
        print("Finished benchmarks!")

    @app.cli.command("update-skin-prices")
    def update_skin_prices():
        update_all_weapon_paints_prices()
        print("Finished updating prices!")