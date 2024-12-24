from backend.app.models import Collection, Skin, SkinCondition, Tradeup, db

from sqlalchemy.sql import text
from sqlalchemy import and_

import datetime
import pandas as pd

""" Insert entries into sql database """

#def add_collection(name):
#    collection = Collection(name)
#    db.session.add(collection)
#    db.session.commit()
#    return collection
#
#def add_skin(name, min_float, max_float, stattrak_available, collection_id, quality):
#    new_skin = Skin(
#        name=name,
#        min_float=min_float,
#        max_float=max_float,
#        stattrak_available=stattrak_available,
#        collection_id=collection_id,
#        quality=quality
#    )
#    db.session.add(new_skin)
#    db.session.commit()
#    return new_skin

#def add_skin_condition(condition, price, skin_id, timestamp):
#    new_condition = SkinCondition(
#        condition=condition,
#        price=price,
#        skin_id=skin_id,
#        timestamp=timestamp
#    )
#    db.session.add(new_condition)
#    db.session.commit()
#    return new_condition

def add_tradeup(tradeup: Tradeup):
    db.session.add(tradeup)
    db.session.commit()
    return tradeup

def add_tradeup_entry(tradeup_entry):
    db.session.add(tradeup_entry)
    db.session.commit()
    return tradeup_entry

def add_tradeup_collection(tradeup_collection):
    db.session.add(tradeup_collection)
    db.session.commit()
    return tradeup_collection

""" Get entries from sql database """

def get_skin_condition_id(weapon_paint: str, condition: str, tradeup_isstattrak: bool):
    """Queries the database to return the ID of a skin condition.

    Args:
        weapon_paint (str): name of the weapon paint. For example "AK-47 Redline"
        condition (str): condition of the skin. For example "Factory New"

    Returns:
        skin_condition_id (int or None): ID of the skin condition, or None if not found
    """
    # Perform the query using SQLAlchemy ORM
    result = db.session.query(SkinCondition.id)\
        .join(Skin, Skin.id == SkinCondition.skin_id)\
        .filter(Skin.name == weapon_paint)\
        .filter(SkinCondition.condition == condition)\
        .filter(SkinCondition.stattrak == tradeup_isstattrak)\
        .one_or_none()  # Get one result or return None if not found

    # Return the ID if found
    if result:
        return result.id
    else:
        return None
    
def get_skins_by_name(weapon_paint: str):
    """Queries the database to return details of skins by name.

    Args:
        weapon_paint (str): name of the weapon paint. For example "AK-47 Redline"

    Returns:
        List of tuples containing (min_float, max_float, quality)
    """
    # Perform the query using SQLAlchemy ORM
    results = db.session.query(Skin.min_float, Skin.max_float, Skin.quality, Skin.stattrak_available)\
        .filter(Skin.name == weapon_paint)\
        .all()  # Get all matching results

    return results
        
def get_skin_price(skin_name: str, skin_condition: str, stattrak: bool):
    """Queries the database to return the price of a skin

    Args:
        skin_name (str): name of the skin. For example "AK-47 Redline"
        skin_condition (str): condition of the skin. For example "Factory New"
        stattrak (bool): whether the skin is stattrak

    Returns:
        skin_price (float): price of skin
    """
    result = db.session.query(
        SkinCondition.price.label('price')
    )\
    .filter(Skin.id == SkinCondition.skin_id)\
    .filter(Skin.name == skin_name)\
    .filter(SkinCondition.condition == skin_condition)\
    .filter(SkinCondition.stattrak == stattrak)\
    .one() # extract one record. Might raise NoResultFound or MultipleResultsFound exceptions

    skin_price = result.price
    return skin_price

def get_skin_image_url(skin_name: str):
    """ Retrieves the image url of a skin

    Args:
        skin_name (str): name of the skin. For example "AK-47 Redline"

    Returns:
        image_url (str): image url of the skin
    """
    result = db.session.query(
        Skin.image_name.label('image_url')
    )\
    .filter(Skin.name == skin_name)\
    .one() # extract one record. Might raise NoResultFound or MultipleResultsFound exceptions

    return result.image_url

""" User Authentication """

def add_user(user):
    """Adds user to database

    Args:
        user (User): User to add

    Returns:
        user: Added user
    """
    db.session.add(user)
    db.session.commit()
    return user

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
    skin = db.session.query(Skin).filter(
        and_(
            Skin.name == weapon_paint
        )
    ).first()

    if skin:
        # Update the skin condition
        db.session.query(SkinCondition).filter(
            and_(
                SkinCondition.skin_id == skin.id,
                SkinCondition.condition == condition,
                SkinCondition.stattrak == is_stattrak
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
    # Perform the query using SQLAlchemy ORM, selecting specific columns
    query = db.session.query(
        Skin.id.label('skin_id'),
        Skin.collection_id,
        Skin.quality,
        SkinCondition.stattrak,
        Skin.name,
        Skin.min_float,
        Skin.max_float,
        SkinCondition.id.label('condition_id'),
        SkinCondition.condition,
        SkinCondition.price,
        SkinCondition.timestamp
    ).join(SkinCondition, Skin.id == SkinCondition.skin_id).filter(
        SkinCondition.price.isnot(None),
        SkinCondition.timestamp.isnot(None)
    ).order_by(Skin.collection_id)

    # Fetch the results
    result = query.all()

    # Convert the results to a pandas DataFrame
    df = pd.DataFrame(result)

    # Group by collection_id
    df_grouped = df.groupby('collection_id')

    return df_grouped