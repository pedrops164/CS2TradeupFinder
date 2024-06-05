import sqlite3
import datetime
import logging

db_name = "skins.db"

from solver_entities import Skin

# for http requests
import requests

# time module for sleeping the thread
import time

# disable InsecureRequestWarning, since we're not sending sensitive info in the requests
import urllib3
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

logger = logging.getLogger(__name__)

# -------------------- DATABASE INSERTIONS / CREATES -------------------- #

def create_database():
    connection = sqlite3.connect(db_name)
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

def create_skin(skin):
    # retrieve the available conditions from the skin
    _, available_conditions = skin.get_prices()

    connection = sqlite3.connect(db_name)
    cursor = connection.cursor()

    # skin must have a collection name
    assert skin.collection_name != None
    # Get collection, or create it not stored in db
    collection_id = get_or_create_collection(connection, cursor, skin.collection_name)

    # Get skin, or create it if not stored in db
    skin_id = get_or_create_skin(connection, cursor, skin, collection_id)

    # list of prices to return
    for condition in available_conditions:
        # Create skin_condition it if not stored in db
        get_or_create_skin_condition(connection, cursor, skin_id, condition)

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

# -------------------- FETCH PRICES -------------------- #

"""
Returns a list of the prices of a skin
If the price of some of the skins isn't available, it returns None for those skins
"""
def get_skin_prices(skin):
    # retrieve the available conditions from the skin
    _, available_conditions = skin.get_prices()
    # update the price of the skin for each of its available conditions

    # list of prices to return
    prices = []
    for condition in available_conditions:
        price = get_skin_condition_price(skin, condition)
        prices.append(price)
    return prices

def get_skin_condition_price(skin, condition):
    """
    Condition can be:
    'Factory New'
    'Minimal Wear'
    'Field-Tested'
    'Well-Worn'
    'Battle-Scarred'
    """
    connection = sqlite3.connect(db_name)
    cursor = connection.cursor()
    # Get collection, or create it if not stored in db
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
        returned_price = result[0]
    else:
        # there isn't a skin_condition with id=skin_condition_id
        print("skin condition doesn't exist. Something went wrong")
        returned_price = None

    connection.close()
    return returned_price

def get_all_skins():
    # connect to db
    connection = sqlite3.connect(db_name)
    connection.row_factory = sqlite3.Row
    cursor = connection.cursor()
    # the query is to get these specific columns from all rows in skins table
    query = """ SELECT id, name, min_float, max_float, stattrak FROM skins """
    cursor.execute(query)
    result = cursor.fetchall()
    return [dict(row) for row in result]


# -------------------- UPDATE PRICES -------------------- #

"""
This function receives information about a skin (stattrak, skin name, and condition),
and sends an http request to steam to fetch the price of the skin.

Returns None if the price request couldnt be done
"""
def make_price_request(is_StatTrak, skin_name, skin_condition, proxy=None):
    print(f"Making request: {skin_name}, {skin_condition}, {is_StatTrak}")
    statTrak = "StatTrak%E2%84%A2 " if is_StatTrak else ""

    """
    Construct the URL
    example: http://steamcommunity.com/market/priceoverview/?appid=730&currency=3&market_hash_name=StatTrak%E2%84%A2 M4A1-S | Hyper Beast (Minimal Wear)
    this url returns a json {"success":true,"lowest_price":"261,35&#8364; ","volume":"11","median_price":"269,52&#8364; "}
    we only need lowest_price
    """
    url = f"http://steamcommunity.com/market/priceoverview/?appid=730&currency=3&market_hash_name={statTrak}{skin_name} ({skin_condition})"
    retries = 0
    initial_wait = 2
    wait_time = initial_wait
    max_retries = 12

    while retries < max_retries:
        try:
            # Make the HTTP request
            response = requests.get(url, proxies=proxy, timeout=10, verify=False)
            if response.status_code == 200:
                # Parse the JSON response
                data = response.json()
                if data["success"] and "lowest_price" in data:
                    # Clean up the price string
                    price_str = data["lowest_price"].replace(",", ".").replace("€", "").strip()
                    # Replace any non-numeric, non-dot characters
                    price_str = ''.join([c for c in price_str if c.isdigit() or c == '.'])
                    # Try to convert the cleaned string to float
                    if price_str:  # Ensure the string is not empty
                        return float(price_str)
                    else:
                        raise ValueError("Price string is empty after cleaning.")
            elif response.status_code == 429:
                logger.info(f"Waiting for {wait_time} seconds before retrying...")
                time.sleep(wait_time)
                wait_time *= 3  # Exponential backoff
                retries += 1
            else:
                logger.error(f"Failed to retrieve data: {response.status_code}")
        except requests.RequestException as e:
            logger.error(f"Failed: {e}")

    # Return Not Available if all retries are exhausted
    return None

"""
Updates the price of a Skin object
Receives the skin, and optionally a proxy to use on the http request
Updates the price for every available condition of the skin

Returns a boolean representing if the update went fine or not
"""
def update_skin_price(skin_dict, proxy=None):
    # retrive values inside skin_dict
    min_float = skin_dict["min_float"]
    max_float = skin_dict["max_float"]

    # retrieve the available conditions from the skin
    available_conditions = Skin.get_available_conditions(min_float, max_float)

    # update the price of the skin for each of its available conditions
    for condition in available_conditions:
        ret = update_skin_condition_price(skin_dict, condition, proxy)
        if not ret:
            return False
    return True

def update_skin_condition_price(skin_dict: dict, condition: str, proxy=None):
    """
    Condition can be:
    'Factory New'
    'Minimal Wear'
    'Field-Tested'
    'Well-Worn'
    'Battle-Scarred'
    """
    connection = sqlite3.connect(db_name)
    cursor = connection.cursor()

    skin_id = skin_dict["id"]
    stattrak = skin_dict["stattrak"]
    skin_name = skin_dict["name"]

    # Get skin_condition, or create it if not stored in db
    skin_condition_id = get_or_create_skin_condition(connection, cursor, skin_id, condition)
    
    # price to return
    returned_price = None

    # Get price of said skin_condition
    cursor.execute("SELECT price, timestamp FROM skin_conditions WHERE id = ?", (skin_condition_id,))
    result = cursor.fetchone()

    if result:
        last_price, last_update_timestamp = result
        current_time = datetime.datetime.now()
        if last_update_timestamp and last_price:
            last_update_time = datetime.datetime.strptime(last_update_timestamp, "%Y-%m-%d %H:%M:%S.%f")
            time_diff = current_time - last_update_time

            # Check if the last update was less than 24 hours ago
            #if time_diff < datetime.timedelta(hours=24):
            #    logger.info("Last update was less than 24 hours ago. Skipping update.")
            #    returned_price = last_price
            logger.info("Skipping update.")
            returned_price = last_price
        else:
            new_price = make_price_request(stattrak, skin_name, condition, proxy)
            if new_price:
                cursor.execute('''
                               UPDATE skin_conditions
                                SET price=?, timestamp=?
                                WHERE id = ?''', (new_price, current_time, skin_condition_id))
                connection.commit()
                logger.info(f"new price: {new_price:.2f}")
                returned_price = new_price
            else:
                logger.error("Price returned from make_price_request was None")
    else:
        # there isn't a skin_condition with id=skin_condition_id
        logger.error("skin condition doesn't exist. Something went wrong")
        returned_price = None

    connection.close()
    return returned_price

def update_weapon_paint_price(is_stattrak: bool, weapon_paint: str, condition: str, price: float, connection=None):
    # instantiate the cursor to query the db
    cursor = connection.cursor()

    # get current time
    timestamp = datetime.datetime.now()

    # define the query to update
    query = """
    UPDATE skin_conditions
    SET price = ?, timestamp = ?
    WHERE skin_id = (
        SELECT id FROM skins
        WHERE stattrak = ? AND name = ?
    ) AND condition = ?;"""
    cursor.execute(query, (price, timestamp, is_stattrak, weapon_paint, condition))
    logger.info("Updated weapon paint price")
