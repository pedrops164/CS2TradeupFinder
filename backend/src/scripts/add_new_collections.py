from app.models import db, Skin, SkinCondition, Collection
import json
from app.util import get_skin_conditions_array

def add_collection_from_json(file_path):
    try:
        with open(file_path, 'r', encoding="utf-8") as file:
            collection_data = json.load(file)
            collection_name = collection_data.get("collection_name")
            stattrak_available = collection_data.get("stattrak_available")
            skins_data = collection_data.get("skins")

            # Create a new Collection object
            collection = Collection(name=collection_name)
            db.session.add(collection)
            db.session.flush()

            for skin_data in skins_data:
                skin_name = skin_data.get("name")
                quality = skin_data.get("quality")
                min_float = skin_data.get("min_float")
                max_float = skin_data.get("max_float")
                last_of_rarity = skin_data.get("last_of_rarity")

                # Create a new Skin object
                skin = Skin(
                    name=skin_name,
                    min_float=min_float,
                    max_float=max_float,
                    stattrak_available=stattrak_available,
                    quality=quality,
                    last_of_rarity=last_of_rarity,
                    collection=collection
                )
                db.session.add(skin)
                db.session.flush()

                skin_conditions = get_skin_conditions_array(min_float, max_float)
                is_stattrak = [False, True] if stattrak_available else [False]
                for condition in skin_conditions:
                    for stattrak in is_stattrak:
                        skin_condition = SkinCondition(
                            skin=skin,
                            condition=condition,
                            stattrak=stattrak,
                            price=None,
                            timestamp=None
                        )
                        db.session.add(skin_condition)
            db.session.commit()
            print(f"Collection {collection_name} added successfully!")
    except Exception as e:
        db.session.rollback()
        print(f"Error occurred, rolling back transaction: {e}")



"""
Example json file:

{
    "collection_name": "2024 Overpass",
    "stattrak_available": false,
    "skins": [
        {
            "name": "AK-47 | B the Monster",
            "quality": "covert_bg",
            "min_float": 0.0,
            "max_float": 0.8,
            "last_of_rarity": true
        },
        {
            "name": "AWP | Crakow!",
            "quality": "classified_bg",
            "min_float": 0.0,
            "max_float": 1.0,
            "last_of_rarity": false
        },
        {
            "name": "Zeus x27 | Dragon Snore",
            "quality": "classified_bg",
            "min_float": 0.0,
            "max_float": 0.8,
            "last_of_rarity": false
        },
        {
            "name": "AUG | Eye of Zapems",
            "quality": "restricted_bg",
            "min_float": 0.0,
            "max_float": 0.85,
            "last_of_rarity": false
        },
        {
            "name": "Dual Berettas | Sweet Little Angels",
            "quality": "restricted_bg",
            "min_float": 0.0,
            "max_float": 0.82,
            "last_of_rarity": false
        },
        {
            "name": "XM1014 | Monster Melt",
            "quality": "restricted_bg",
            "min_float": 0.0,
            "max_float": 0.75,
            "last_of_rarity": false
        },
        {
            "name": "MAC-10 | Pipsqueak",
            "quality": "milspec_bg",
            "min_float": 0.0,
            "max_float": 0.9,
            "last_of_rarity": false
        },
        {
            "name": "Nova | Wurst Hölle",
            "quality": "milspec_bg",
            "min_float": 0.0,
            "max_float": 1.0,
            "last_of_rarity": false
        },
        {
            "name": "Galil AR | Metallic Squeezer",
            "quality": "milspec_bg",
            "min_float": 0.0,
            "max_float": 0.6,
            "last_of_rarity": false
        },
        {
            "name": "Glock-18 | Teal Graf",
            "quality": "milspec_bg",
            "min_float": 0.0,
            "max_float": 0.5,
            "last_of_rarity": false
        },
        {
            "name": "Desert Eagle | Tilted",
            "quality": "industrial_bg",
            "min_float": 0.0,
            "max_float": 0.75,
            "last_of_rarity": false
        },
        {
            "name": "M4A1-S | Wash me plz",
            "quality": "industrial_bg",
            "min_float": 0.0,
            "max_float": 0.58,
            "last_of_rarity": false
        },
        {
            "name": "Negev | Wall Bang",
            "quality": "industrial_bg",
            "min_float": 0.0,
            "max_float": 1.0,
            "last_of_rarity": false
        },
        {
            "name": "P90 | Wash me",
            "quality": "industrial_bg",
            "min_float": 0.0,
            "max_float": 0.5,
            "last_of_rarity": false
        },
        {
            "name": "Five-SeveN | Midnight Paintover",
            "quality": "industrial_bg",
            "min_float": 0.0,
            "max_float": 0.5,
            "last_of_rarity": false
        },
        {
            "name": "MP5-SD | Neon Squeezer",
            "quality": "industrial_bg",
            "min_float": 0.2,
            "max_float": 0.9,
            "last_of_rarity": false
        }
    ]
}

"""