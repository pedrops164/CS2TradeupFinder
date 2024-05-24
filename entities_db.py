import sqlite3
import datetime
from steamapi import makeRequest
from solver_entities import Skin

def create_database():
    connection = sqlite3.connect('skins.db')
    cursor = connection.cursor()
    
    # Create tables
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS collections (
            id INTEGER PRIMARY KEY,
            name TEXT UNIQUE
        )
    ''')
    
    cursor.execute('''
        CREATE TABLE IF NOT EXISTS skins (
            id INTEGER PRIMARY KEY,
            name TEXT,
            min_float REAL,
            max_float REAL,
            stattrak BOOLEAN,
            collection_id INTEGER,
            quality TEXT,
            FOREIGN KEY (collection_id) REFERENCES collections (id)
        )
    ''')

    cursor.execute('''
        CREATE TABLE IF NOT EXISTS skin_conditions (
            id INTEGER PRIMARY KEY,
            condition TEXT,
            price REAL,
            skin_id INTEGER,
            timestamp DATETIME,
            FOREIGN KEY (skin_id) REFERENCES skins (id)
        )
    ''')
    
    connection.commit()
    connection.close()

def get_or_update_skin_price(skin):
    # retrieve the available conditions from the skin
    _, available_conditions = skin.get_prices()
    # update the price of the skin for each of its available conditions

    # list of prices to return
    prices = []
    for condition in available_conditions:
        price = get_or_update_skin_condition_price(skin, condition)
        prices.append(price)
    return prices

def get_or_update_skin_condition_price(skin, condition):
    """
    Condition can be:
    'Factory New'
    'Minimal Wear'
    'Field-Tested'
    'Well-Worn'
    'Battle-Scarred'
    """
    connection = sqlite3.connect('skins.db')
    cursor = connection.cursor()
    # Get collection, or create it not stored in db
    collection_id = get_or_create_collection(connection, cursor, skin.collection_name)

    # Get skin, or create it if not stored in db
    skin_id = get_or_create_skin(connection, cursor, skin, collection_id)

    # Get skin_condition, or create it if not stored in db
    skin_condition_id = get_or_create_skin_condition(connection, cursor, skin_id, condition)
    
    # price to return
    returned_price = None

    # Get price of said skin_condition
    cursor.execute("SELECT price, timestamp FROM skin_conditions WHERE id = ?", (skin_condition_id,))
    result = cursor.fetchone()

    if result:
        # there is skin_condition with id=skin_condition_id
        current_time = datetime.datetime.now()
        if result[0] == None or result[1] == None or (current_time - datetime.datetime.fromisoformat(result[1])).total_seconds() > 5:
            # there is no price, or there is no last update time, or price wasn't updated for too long. So we get current price and update it
            new_price = makeRequest(skin.stattrak, skin.get_name(), condition)
            cursor.execute('''
                           UPDATE skin_conditions
                            SET price=?, timestamp=?
                            WHERE id = ?''', (new_price, current_time, skin_condition_id))
            connection.commit()
            print("updated price")
            returned_price = new_price
        else:
            # price and last update time are defined, and the price wasn't updated a long time ago. So we just return the price
            returned_price = result[0]
    else:
        # there isn't a skin_condition with id=skin_condition_id
        print("skin condition doesn't exist. Something went wrong")
        returned_price = None

    connection.close()
    return returned_price

def get_or_create_collection(connection, cursor, collection_name):
    # Try to find the collection by name
    cursor.execute("SELECT id FROM collections WHERE name = ?", (collection_name,))
    result = cursor.fetchone()

    if result:
        # Collection exists, return the existing ID
        collection_id = result[0]
    else:
        # Collection does not exist, insert it and get the new ID
        print("Creating collection")
        cursor.execute("INSERT INTO collections (name) VALUES (?)", (collection_name,))
        collection_id = cursor.lastrowid  # Get the ID of the last inserted row
        connection.commit()
    return collection_id

def get_or_create_skin(connection, cursor, skin, collection_id):
    cursor.execute("SELECT id FROM skins WHERE name = ? AND stattrak = ?", (skin.name, skin.stattrak))
    result = cursor.fetchone()
    if result:
        # Skin exists, return the existing ID
        skin_id = result[0]
    else:
        # Skin doesnt exist, so create it
        print("Creating skin")
        cursor.execute('''INSERT INTO skins (name, min_float, max_float, stattrak, collection_id, quality) 
                          VALUES (?,?,?,?,?,?)
                       ''', (skin.name, skin.min_float, skin.max_float, skin.stattrak, collection_id, skin.quality))
        skin_id = cursor.lastrowid # Get the ID of the last inserted row
        connection.commit()
    return skin_id

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

if __name__ == '__main__':
    create_database()
    skin_input1 = Skin("Glock-18 | Off World", 0, 0.5, collection_name='Bank', stattrak=True)
    price1 = get_or_update_skin_condition_price(skin_input1, "Field-Tested")
    print(price1)