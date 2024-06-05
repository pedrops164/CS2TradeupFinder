import requests
import logging
import json
import os
import time
import re

# configure logging
logging.basicConfig(level=logging.INFO,
                    handlers=[
                        logging.FileHandler("logs/scrape100.log", mode='w'),
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
    # start=2770 # index where non knives skins start, sorted by name
    start=10070 # index where non knives skins start, sorted by name
    while start < total_skin_count:
        skin_dict_array = fetch_json(start)
        if skin_dict_array:
            for skin_dict in skin_dict_array:
                filtered_dict = {k:skin_dict[k] for k in important_keys}
                append_skin(output_file, filtered_dict)
            start += page_size
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
        "MAG-7", "Nova", "Sawed-Off", "XM1014", "M249", "Negev" # Heavy
    ]

    # Join the weapon names with '|' to form the pattern part
    weapon_names_pattern = '|'.join(map(re.escape, weapon_names))
    pattern = re.compile(rf'^(StatTrak™ )?({weapon_names_pattern}) \| .+ \((Factory New|Minimal Wear|Field-Tested|Well-Worn|Battle-Scarred)\)$')
    
    file = open('scrape100_output.txt', 'r')
    lines = file.readlines()
    filtered_dicts = []
    for line in lines:
        skin_dict = json.loads(line)
        if pattern.match(skin_dict['name']):
            filtered_dicts.append(skin_dict)
    return filtered_dicts

if __name__ == '__main__':
    #append_all_skins()
    filtered_dicts = filter_skins()
    for dict_skin in filtered_dicts:
        append_skin('teste.txt', dict_skin)