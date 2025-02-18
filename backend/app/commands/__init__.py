from backend.app.models import db, Skin, SkinCondition, naive_utcnow, Collection
from backend.src.scripts.benchmark import run_benchmarks
from backend.src.solvers.solver_manager import SearchSpace
from backend.src.scripts.scrape100 import update_all_weapon_paints_prices
from backend.src.scripts.download_images import download_skin_images
from backend.app.date import naive_utcnow
import click
import os
from backend.src.solvers.solver_manager import search_solve_tradeup, SearchSpace

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
        search_space = SearchSpace(range(0,77), [0.3], ["classified_bg"], [False], 'single')
        search_solve_tradeup(search_space)
        print("Finished solving!")

    @app.cli.command("run-solver-doubles")
    def run_solver_doubles():
        search_space = SearchSpace(range(1,77), [0.5], ["milspec_bg"], [False], 'double')
        search_solve_tradeup(search_space)
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

    @app.cli.command("download-skin-images")
    @click.argument("api_key")
    def download_skin_images_command(api_key):
        download_skin_images(api_key)

    from sqlalchemy import case, func, update, select
    @app.cli.command("calculate-last-of-rarity-skins")
    def calculate_last_of_rarity_skins():
        # Build a CASE expression to assign a numeric rank to the skin quality.
        quality_order = case(
            (Skin.quality == "consumer_bg", 1),
            (Skin.quality == "industrial_bg", 2),
            (Skin.quality == "milspec_bg", 3),
            (Skin.quality == "restricted_bg", 4),
            (Skin.quality == "classified_bg", 5),
            (Skin.quality == "covert_bg", 6),
            else_=0
        )

        # Build a subquery that, for each collection, computes the maximum quality rank.
        max_quality_subq = (
            db.session.query(
                Skin.collection_id.label("collection_id"),
                func.max(quality_order).label("max_quality")
            )
            .group_by(Skin.collection_id)
            .subquery()
        )

        # Now, build a query to select the IDs of the skins that match that maximum quality per collection.
        skins_with_max_quality = (
            db.session.query(Skin.id)
            .join(
                max_quality_subq,
                (Skin.collection_id == max_quality_subq.c.collection_id) &
                (quality_order == max_quality_subq.c.max_quality)
            )
        )

        # Convert the query to a subquery
        skins_with_max_quality_subq = skins_with_max_quality.subquery()

        # Build an UPDATE statement: update Skin rows whose id is in the above subquery,
        # setting last_of_rarity to True.
        try:
            with db.session.begin():
                stmt = (
                    update(Skin)
                    .where(Skin.id.in_(select(skins_with_max_quality_subq.c.id)))
                    .values(last_of_rarity=True)
                )
                db.session.execute(stmt)
            # If no exception occurs, the transaction is automatically committed.
        except Exception as e:
            # The transaction is automatically rolled back if an exception is raised.
            # Optionally, log the error or re-raise it.
            db.session.rollback()
            raise e
        
    from backend.src.scripts.add_new_collections import add_collection_from_json
    @app.cli.command("add-collection-from-json")
    @click.argument("file_path")
    def add_collection_from_json_command(file_path):
        add_collection_from_json(file_path)

    import requests
    import re
    import csv
    @app.cli.command("print-skin-prices-white-market")
    def print_skin_prices_white_market():
        url = "https://api.white.market/export/v1/prices/730.json"

        # Define a list of allowed weapon names. Only skins for these weapons will be processed.
        ALLOWED_WEAPONS = [
            'AK-47', 'M4A4', 'AWP', 'G3SG1', 'SCAR-20', 'SG 553', 'FAMAS', 'Galil AR',
            'M4A1-S', 'USP-S', 'P2000', 'Desert Eagle',
            'P250', 'CZ75-Auto', 'Tec-9', 'Five-SeveN',
            'MP9', 'MAC-10', 'MP7', 'UMP-45', 'P90', 'PP-Bizon', 'MP5-SD',
            'XM1014', 'Sawed-Off', 'MAG-7', 'Nova',
            'Glock-18', 'Dual Berettas', 'R8 Revolver',
            'SSG 08', 'AUG',
            'Negev', 'M249',
            'Zeus x27'
        ]

        try:
            response = requests.get(url)
        except Exception as e:
            print(f"Error fetching data: {e}")
            return

        if response.status_code == 200:
            data = response.json()
            with open('skin_prices.csv', 'w', newline='', encoding="utf-8") as csvfile:
                fieldnames = ['weapon', 'skin', 'condition', 'price']
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                for entry in data:
                    market_hash_name = entry.get("market_hash_name", "")
                    # Split the name using the '|' separator.
                    parts = market_hash_name.split('|')
                    if len(parts) != 2:
                        continue  # skip if it doesn't have exactly two parts

                    # Parse the left side (weapon name) and right side (skin name and condition)
                    left = parts[0].strip()
                    right = parts[1].strip()

                    # Use a regular expression to capture the skin name and condition.
                    # Expected format: "Skin Name (Condition)"
                    match = re.match(r"^(.*?)\s*\((.*?)\)$", right)
                    if not match:
                        continue

                    paint_name = match.group(1).strip()
                    skin_condition = match.group(2).strip()

                    # Initialize stattrak flag
                    is_stattrak = False

                    # Check for the "StatTrak™" prefix and remove it if present.
                    stattrak_prefix = "StatTrak™ "
                    if left.startswith(stattrak_prefix):
                        is_stattrak = True
                        left = left[len(stattrak_prefix):].strip()

                    weapon_name = left
                    # Skip if the weapon is not in our allowed list.
                    if weapon_name not in ALLOWED_WEAPONS:
                        continue

                    #print(f"{stattrak_prefix if is_stattrak else ""}{weapon_name} | {paint_name} ({skin_condition}), Price: {entry.get('price')}")
                    writer.writerow({'weapon': weapon_name, 'skin': paint_name, 'condition': skin_condition, 'price': entry.get('price')})

                    skin_name = f"{weapon_name} | {paint_name}"
                    # Query for matching SkinCondition IDs
                    skin_condition_id = (
                        db.session.query(SkinCondition.id)
                        .join(Skin, Skin.id == SkinCondition.skin_id)
                        .filter(
                            Skin.name == skin_name,
                            SkinCondition.condition == skin_condition,
                            SkinCondition.stattrak == is_stattrak
                        )
                        .scalar()
                    )
                    if not skin_condition_id:
                        # this just means the skin is not in the database, so we skip it
                        print(f"Skin {skin_name} ({skin_condition}) not found in the database")
                        continue
                    
                    stmt = update(SkinCondition)\
                        .where(SkinCondition.id == skin_condition_id)\
                            .values(price=float(entry.get("price")),
                                    timestamp = naive_utcnow()  # or datetime.utcnow() if you prefer
                        )
                    db.session.execute(stmt)
                db.session.commit()

        else:
            print(f"Error: {response.status_code}")