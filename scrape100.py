import requests
import logging
import json
import os
import time
import re
import sqlite3
from db import update_weapon_paint_price, db_name

# configure logging
logging.basicConfig(level=logging.INFO,
                    handlers=[
                        logging.FileHandler("logs/scrape100.log", mode='w', encoding="utf-8"),
                        logging.StreamHandler()
                    ],
                    format='%(asctime)s - %(threadName)s - %(levelname)s - %(message)s')

output_file = "scrape100_output.txt"
cs2_app_id = 730
page_size = 100 # max is 100?
total_skin_count=21411
important_keys = ["name", "sell_listings", "sell_price_text"]

"""
Appends the dict of a skin to the output file with all skins
"""
def append_skin(file_name, skin_dict):
    with open(file_name, 'a') as f:
        json.dump(skin_dict, f)
        f.write('\n')

"""
Returns a dictionary of the requested page.
Returns None if the request fails
"""
def fetch_json(start):
    retries = 0
    max_retries = 5
    wait_time = 2
    url = \
    f"https://steamcommunity.com/market/search/render/?search_descriptions=0&sort_column=name&sort_dir=desc&appid={cs2_app_id}&norender=1&count={page_size}&start={start}"

    while retries < max_retries:
        try:
            # do http request
            response = requests.get(url, timeout=40, verify=False)
            # Convert json to dict
            logging.info(f"Request | status_code: {response.status_code}")
            if response.status_code == 200:
                data = response.json()
                logging.info(f"          sucess: {data['success']}, array_size: {len(data['results'])}")
                if data["success"] and len(data["results"]) > 0:
                    return data["results"]
                
                # this seems like a response bug or something. It doesnt necessarily mean the request failed because the value of "success" is true. So we just contine, no sleep
                if len(data["results"]) == 0:
                    continue
        except requests.exceptions.ReadTimeout:
            pass

        # execution only gets here if request fails
        # we sleep and square the wait time
        time.sleep(wait_time)
        wait_time = wait_time**2
        # increase retries
        retries += 1
            
    return None

"""
This function appends all the skins in the market to the text file
"""
def append_all_skins():
    start=2750 # index where non knives skins start, sorted by name
    while start < total_skin_count:
        skin_dict_array = fetch_json(start)
        if skin_dict_array:
            for skin_dict in skin_dict_array:
                filtered_dict = {k:skin_dict[k] for k in important_keys}
                append_skin(output_file, filtered_dict)
            start += page_size * 0.95 # we multiply by 0.95 to account for listings that appear or disappear, and that could compromise some skins
        else:
            # request failed after retries
            return
        
"""
Reads the file with the skin dictionaries, and filters the skins which are relevant to the database.
So we exclude agents, stickers, knives, etc
We only keep the actual gun skins
Returns a list of the filtered dictionaries
"""
def filter_skins():# Array of possible weapon names
    weapon_names = [
        "CZ75-Auto", "Desert Eagle", "Dual Berettas", "Five-SeveN", "Glock-18", "P2000", "P250", "R8 Revolver", "Tec-9", "USP-S", # Pistols
        "AK-47", "AUG", "AWP", "FAMAS", "G3SG1", "Galil AR", "M4A1-S", "M4A4", "SCAR-20", "SG 553", "SSG 08", # Rifles
        "MAC-10", "MP5-SD", "MP7", "MP9", "PP-Bizon", "P90", "UMP-45", # SMGs
        "MAG-7", "Nova", "Sawed-Off", "XM1014", "M249", "Negev", # Heavy
        "Zeus x27" # Special
    ]

    # Join the weapon names with '|' to form the pattern part
    weapon_names_pattern = '|'.join(map(re.escape, weapon_names))
    pattern = re.compile(rf'^(StatTrak™ )?({weapon_names_pattern}) \| .+ \((Factory New|Minimal Wear|Field-Tested|Well-Worn|Battle-Scarred)\)$',
                         re.UNICODE)
    
    file = open('scrape100_output.txt', 'r', encoding='utf-8')
    lines = file.readlines()
    filtered_dicts = []
    for line in lines:
        skin_dict = json.loads(line)
        match = pattern.match(skin_dict['name'])
        number_of_listings = skin_dict['sell_listings']
        # we filter out the skins that have less than 5 listings
        if match:
            stattrak = bool(match.group(1))
            full_skin_name = match.group(2) + " | " + match.group(0).split(" | ")[1].rsplit(" (", 1)[0]
            condition = match.group(3)
            filtered_dicts.append({
                "is_stattrak": stattrak,
                "weapon_paint": full_skin_name,
                "condition": condition,
                "price": float(skin_dict['sell_price_text'].replace(",", "").replace("$", "").strip()),
                "sell_listings": number_of_listings,
            })
    return filtered_dicts

if __name__ == '__main__':
    #append_all_skins()
    connection = sqlite3.connect(db_name)
    filtered_dicts = filter_skins()
    for dict_skin in filtered_dicts:
        number_of_listings = dict_skin['sell_listings']
        # we only update the price of the skin in the database, if it has more than 5 listings to ensure reliability of the prices
        if number_of_listings >= 5:
            append_skin('teste.txt', dict_skin)
            update_weapon_paint_price(dict_skin['is_stattrak'], dict_skin['weapon_paint'], dict_skin['condition'], dict_skin['price'], connection)
        else:
            logging.info(f"{dict_skin['weapon_paint']}|{dict_skin['condition']}|{dict_skin['is_stattrak']} has less than 5 listings. Price not updated")

    connection.commit()
    connection.close()