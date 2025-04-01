from app.models import db, Skin, SkinCondition
from src.scripts.benchmark import run_benchmarks
from src.solvers.solver_manager import SearchSpace, search_solve_tradeup, SearchSpace
from src.scripts.scrape100 import update_all_weapon_paints_prices
from src.scripts.download_images import download_skin_images
from app.date import naive_utcnow
from app.util import update_all_tradeups_stats
import click
import os
from src.scripts.update_prices import update_skin_prices_white_market

def register_commands(app):

    @app.cli.command("run-solver")
    def run_solver():
        search_space = SearchSpace(range(0,77), [0.3], ["consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg"], [False], 'single')
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
        
    from src.scripts.add_new_collections import add_collection_from_json
    @app.cli.command("add-collection-from-json")
    @click.argument("file_path")
    def add_collection_from_json_command(file_path):
        add_collection_from_json(file_path)

    @app.cli.command("update-skin-prices-white-market")
    def update_skin_prices():
        update_skin_prices_white_market()