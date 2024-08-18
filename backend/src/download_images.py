""" DOWNLOAD THE IMAGES OF THE SKINS """

import os
import requests
import time

from PIL import Image
from io import BytesIO
from backend.app.models import db, Skin

images_folder = 'skin_images'
script_dir = os.path.dirname(__file__)
images_folder_path = os.path.join(script_dir, images_folder)
image_extension = ".png"

cx = "f747b894be64e4bfb" # search engine id

class DailyRateLimitExceeded(Exception):
    def __init__(self):
        self.message = "Reached Daily Rate Limit of the Custom Search API"
        super().__init__(self.message)

def skin_name_to_image_name(skin_name):
    sanitized_skin_name = skin_name.replace("|", "_")
    return sanitized_skin_name + image_extension

def save_skin_image_name(skin: Skin, image_name: str):
    skin.image_name = image_name
    db.session.commit()

def search_image(query, api_key, retries=10):
    search_url = "https://www.googleapis.com/customsearch/v1"
    num_images = 10
    params = {
        "q": query,
        "cx": cx,
        "key": api_key,
        "searchType": "image",
        "num": num_images,  # Number of results to return
    }

    response = requests.get(search_url, params=params)
    if response.status_code == 200:
        data = response.json()

        if "items" in data:
            for i in range(num_images):
                image_url = data['items'][i]['link']
                if 'https://steamcdn-a.akamaihd.net/apps/730/icons/' in image_url:
                    return image_url
            print(f"No image from steamcdn")
            return None
        else:
            print(f"No image found for the query '{query}'.")
            return None
    elif response.status_code == 429:
        raise DailyRateLimitExceeded
    elif response.status_code == 403:
        print("Error: Reached API usage limit.")
        print(response.json().get("error", {}).get("message", "No additional error information available."))
        raise Exception
    else:
        print(f"Error: Received unexpected status code {response.status_code}")
        print(response.json())
        raise Exception

def download_image(image_url, save_path):
    response = requests.get(image_url)
    img = Image.open(BytesIO(response.content))
    img.save(save_path)

def download_skin_image(api_key: str, skin: Skin):
    skin_name = skin.name
    skin_name_parts = skin_name.split('|')
    skin_weapon = skin_name_parts[0]
    skin_paint = skin_name_parts[1]
    #search_query = f"{skin_name}"
    search_query = f"{skin_paint} {skin_weapon}"

    # get url of the image
    image_url = search_image(search_query, api_key)

    if not image_url:
        print(f"Image url is none for {skin_name}")
        return
    
    # create the path to store the skin image in
    image_name = skin_name_to_image_name(skin_name)
    # get absolute path to store the image
    image_file_path = os.path.join(images_folder_path, image_name)
    # download and store the image
    download_image(image_url, image_file_path)
    save_skin_image_name(skin, image_name)
    print(f"Image downloaded and saved for {skin_name}")

def set_skin_image(api_key: str, skin: Skin):
    skin_name = skin.name
    skin_name_parts = skin_name.split('|')
    skin_weapon = skin_name_parts[0]
    skin_paint = skin_name_parts[1]
    #search_query = f"{skin_name}"
    search_query = f"{skin_paint} {skin_weapon}"

    # get url of the image
    image_url = search_image(search_query, api_key)

    if not image_url:
        print(f"Image url is none for {skin_name}")
        return
    
    save_skin_image_name(skin, image_url)
    print(f"Image downloaded and saved for {skin_name}")

def download_skin_images(api_key):
    skins = db.session.execute(db.select(Skin))
    try:
        for skin in skins.scalars():
            if skin.image_name is not None:
                print(f"Skin '{skin.name}' already has an image. Skipping...")
                continue

            #download_skin_image(api_key, skin)
            set_skin_image(api_key, skin)
        print("Finished downloading all skin images")
    except DailyRateLimitExceeded:
        print("Daily Rate Limit reached. Gracefully stopping...")