import requests
import logging
import json
import os
import time
import re
from backend.app.database import update_weapon_paint_price
from backend.src.logs import get_output_log_path

output_log_path = get_output_log_path('scrape100.log')

# configure logging
logging.basicConfig(level=logging.INFO,
                    handlers=[
                        logging.FileHandler(output_log_path, mode='w', encoding="utf-8"),
                        logging.StreamHandler()
                    ],
                    format='%(asctime)s - %(threadName)s - %(levelname)s - %(message)s')

cs2_app_id = 730
page_size = 100 # max is 100?
total_skin_count=21411
important_keys = ["name", "sell_listings", "sell_price_text"]

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


"""
Appends the dict of a skin to the output file with all skins
"""
def append_skin(file_name, skin_dict):
    with open(file_name, 'a') as f:
        json.dump(skin_dict, f)
        f.write('\n')

def fetch_json(start):
    """
    Returns a dictionary of the requested page.
    Returns None if the request fails
    
    Args:
    start (int): Beggining offset of the page
    """
    retries = 0
    max_retries = 8
    wait_time = 5 # wait 5 seconds between requests - 10 requests per minute
    url = \
    f"https://steamcommunity.com/market/search/render/?search_descriptions=0&sort_column=name&sort_dir=desc&appid={cs2_app_id}&norender=1&count={page_size}&start={start}"

    while retries < max_retries:
        time.sleep(wait_time)
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
        # we square the wait time
        wait_time = wait_time**2
        # increase retries
        retries += 1
            
    return None
        

def match_pattern(skin_dict):
    """
    Filters a skin with a regex pattern
    Filters the skins which are relevant to the database.
    So we exclude agents, stickers, knives, etc
    We only keep the actual gun skins

    Args:
        skin_dict (dict): dictionary of skin
        
    Returns:
        dictionary with the parsed skin name, or None if it didn't match the regex pattern
    """
    match = pattern.match(skin_dict['name'])
    number_of_listings = skin_dict['sell_listings']
    # we filter out the skins that have less than 5 listings
    if match:
        stattrak = bool(match.group(1))
        full_skin_name = match.group(2) + " | " + match.group(0).split(" | ")[1].rsplit(" (", 1)[0]
        condition = match.group(3)
        res_dict = {
            "is_stattrak": stattrak,
            "weapon_paint": full_skin_name,
            "condition": condition,
            "price": float(skin_dict['sell_price_text'].replace(",", "").replace("$", "").strip()),
            "sell_listings": number_of_listings,
        }
        return res_dict
    return None

def update_all_weapon_paints_prices():
    """
    Updates the price of all skins through the steam market which have more than 5 listings and are relevant from tradeups (we exclude knifes, stickers, etc)
    """
    #start=2750 # index where non knives skins start, sorted by name
    start=2750
    while start < total_skin_count:
        skin_dict_array = fetch_json(start)
        if skin_dict_array:
            for skin_dict in skin_dict_array:
                filtered_dict = {k:skin_dict[k] for k in important_keys}
                filtered_skin_dict = match_pattern(filtered_dict)
                if filtered_skin_dict:
                    # this entry matched the regex pattern
                    number_of_listings = filtered_skin_dict['sell_listings']
                    # we only update the price of the skin in the database, if it has more than 5 listings to ensure reliability of the prices
                    if number_of_listings >= 5:
                        #append_skin('teste.txt', filtered_skin_dict)
                        update_weapon_paint_price(filtered_skin_dict['is_stattrak'], filtered_skin_dict['weapon_paint'], filtered_skin_dict['condition'], filtered_skin_dict['price'])
                    else:
                        logging.info(f"{filtered_skin_dict['weapon_paint']}|{filtered_skin_dict['condition']}|{filtered_skin_dict['is_stattrak']} has less than 5 listings. Price not updated")
                else:
                    logging.info(f"Start: {start}, skin filtered out")
            start += page_size * 0.95 # we multiply by 0.95 to account for listings that appear or disappear, and that could compromise some skins
        else:
            logging.info("Request failed after retries")
            return
        
if __name__ == '__main__':
    update_all_weapon_paints_prices()