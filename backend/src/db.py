import sqlite3
import datetime
import logging
import pandas as pd
from sqlalchemy import and_

from backend.app import models
from backend.app.models import db

#db_name = "app.db"
db_name = "backend/app.db"

from .entities import Skin

# for http requests
import requests

# time module for sleeping the thread
import time

# disable InsecureRequestWarning, since we're not sending sensitive info in the requests
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

logger = logging.getLogger(__name__)

# -------------------- DATABASE INSERTIONS / CREATES -------------------- #

def get_or_create_skin_condition(connection, cursor, skin_id, condition):
    cursor.execute("SELECT id from skin_conditions WHERE skin_id = ? AND condition = ?", (skin_id,condition))
    result = cursor.fetchone()
    if result:
        # skin condition exists, return its id
        skin_condition_id = result[0]
    else:
        # skin condition doesnt exist, so create it
        print("Creating skin condition")
        cursor.execute('''
                       INSERT INTO skin_conditions (condition, skin_id)
                       VALUES (?, ?)
                       ''', (condition, skin_id))
        skin_condition_id = cursor.lastrowid # Get the ID of the last inserted row
        connection.commit()
    return skin_condition_id

# -------------------- UPDATE PRICES -------------------- #

def update_weapon_paint_price(is_stattrak: bool, weapon_paint: str, condition: str, price: float):
    """
    Updates the price of a skin in the database using SQLAlchemy ORM
    Args:
        is_stattrak (bool): Indicates whether the skin is stattrak or not
        weapon_paint (str): the name of the string. For example "AK-47 | Red Laminate"
        condition (str): The condition of the skin. For example "Minimal Wear"
        price (float): The price of the skin
        db: SQLAlchemy database object
    """
    # Get current time
    timestamp = datetime.datetime.now()

    # Find the correct skin
    skin = db.session.query(models.Skin).filter(
        and_(
            models.Skin.name == weapon_paint
        )
    ).first()

    if skin:
        # Update the skin condition
        db.session.query(models.SkinCondition).filter(
            and_(
                models.SkinCondition.skin_id == skin.id,
                models.SkinCondition.condition == condition,
                models.SkinCondition.stattrak == is_stattrak
            )
        ).update({
            'price': price,
            'timestamp': timestamp
        })

        # Commit the changes
        db.session.commit()
    else:
        print(f"Skin not found: {weapon_paint}")

def get_tradeup_dataframe():
    """
    Gets the skins whose price is not null, and groups by collection id

    Returns:
        pandas.Dataframe: The Dataframe with the grouped collections
    """
    # query = \
    # """
    # SELECT *
    # FROM skins s
    #     JOIN skin_conditions sc
    #     ON s.id = sc.skin_id
    # WHERE sc.price IS NOT NULL AND sc.timestamp IS NOT NULL
    # ORDER BY s.collection_id
    # """
    # Fetch data into a pandas DataFrame
    # df = pd.read_sql_query(query, connection)
    # df_grouped = df.groupby('collection_id')
    # connection.close()
    # return df_grouped
    # Perform the query using SQLAlchemy ORM, selecting specific columns
    query = db.session.query(
        models.Skin.id.label('skin_id'),
        models.Skin.collection_id,
        models.Skin.quality,
        models.SkinCondition.stattrak,
        models.Skin.name,
        models.Skin.min_float,
        models.Skin.max_float,
        models.SkinCondition.id.label('condition_id'),
        models.SkinCondition.condition,
        models.SkinCondition.price,
        models.SkinCondition.timestamp
    ).join(models.SkinCondition, models.Skin.id == models.SkinCondition.skin_id).filter(
        models.SkinCondition.price.isnot(None),
        models.SkinCondition.timestamp.isnot(None)
    ).order_by(models.Skin.collection_id)

    # Fetch the results
    result = query.all()

    # Convert the results to a pandas DataFrame
    df = pd.DataFrame(result)

    # Group by collection_id
    df_grouped = df.groupby('collection_id')

    return df_grouped