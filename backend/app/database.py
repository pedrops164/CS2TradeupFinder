from backend.app.models import Collection, Skin, SkinCondition, Tradeup, db
from sqlalchemy.sql import text

""" Insert entries into postgres database """

def add_collection(name):
    collection = Collection(name)
    db.session.add(collection)
    db.session.commit()
    return collection

def add_skin(name, min_float, max_float, stattrak, collection_id, quality):
    new_skin = Skin(
        name=name,
        min_float=min_float,
        max_float=max_float,
        stattrak=stattrak,
        collection_id=collection_id,
        quality=quality
    )
    db.session.add(new_skin)
    db.session.commit()
    return new_skin

def add_skin_condition(condition, price, skin_id, timestamp):
    new_condition = SkinCondition(
        condition=condition,
        price=price,
        skin_id=skin_id,
        timestamp=timestamp
    )
    db.session.add(new_condition)
    db.session.commit()
    return new_condition

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

""" Get entries from postgres database """

def get_skin_condition_id(weapon_paint, condition):
    # Define the SQL query
    query = """
        SELECT sc.id 
        FROM skin_conditions sc 
        JOIN skins s ON s.id = sc.skin_id 
        WHERE sc.condition = :condition AND s.name = :weapon_paint
    """
    # Execute the query with bound parameters
    result = db.session.execute(
        text(query), 
        {"condition": condition, "weapon_paint": weapon_paint}
    ).fetchone()
    
    # Return the id if found
    if result:
        return result[0]
    else:
        return None
    
def get_skins_by_name(weapon_paint: str):
    # Define the SQL query
    query = """
        SELECT s.min_float, s.max_float, s.quality, s.stattrak
        FROM skins s
        WHERE s.name = :weapon_paint
    """
    # Execute the query with bound parameters
    result = db.session.execute(
        text(query),
        {"weapon_paint": weapon_paint}
    ).fetchall()
    return result
        
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
    .filter(Skin.stattrak == stattrak)\
    .one() # extract one record. Might raise NoResultFound or MultipleResultsFound exceptions

    skin_price = result.price
    return skin_price