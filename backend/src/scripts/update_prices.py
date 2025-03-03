
import requests
import re
import csv
from flask import current_app
from app.models import db, Skin, SkinCondition
from app.date import naive_utcnow
from app.util import update_all_tradeups_stats
from sqlalchemy import update
import traceback

def update_skin_prices_white_market():
        url = "https://api.white.market/export/v1/prices/730.json"

        # Define a list of allowed weapon names. Only skins for these weapons will be processed.
        ALLOWED_WEAPONS = [
            'AK-47', 'M4A4', 'AWP', 'G3SG1', 'SCAR-20', 'SG 553', 'FAMAS', 'Galil AR',
            'M4A1-S', 'USP-S', 'P2000', 'Desert Eagle',
            'P250', 'CZ75-Auto', 'Tec-9', 'Five-SeveN',
            'MP9', 'MAC-10', 'MP7', 'UMP-45', 'P90', 'PP-Bizon', 'MP5-SD',
            'XM1014', 'Sawed-Off', 'MAG-7', 'Nova',
            'Glock-18', 'Dual Berettas', 'R8 Revolver',
            'SSG 08', 'AUG',
            'Negev', 'M249',
            'Zeus x27'
        ]

        try:
            response = requests.get(url)
        except Exception as e:
            print(f"Error fetching data: {e}")
            return

        if response.status_code == 200:
            data = response.json()
            with open('skin_prices.csv', 'w', newline='', encoding="utf-8") as csvfile:
                fieldnames = ['weapon', 'skin', 'condition', 'price']
                writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
                with db.session.begin():
                    for entry in data:
                        market_hash_name = entry.get("market_hash_name", "")
                        # Split the name using the '|' separator.
                        parts = market_hash_name.split('|')
                        if len(parts) != 2:
                            continue  # skip if it doesn't have exactly two parts

                        # Parse the left side (weapon name) and right side (skin name and condition)
                        left = parts[0].strip()
                        right = parts[1].strip()

                        # Use a regular expression to capture the skin name and condition.
                        # Expected format: "Skin Name (Condition)"
                        match = re.match(r"^(.*?)\s*\((.*?)\)$", right)
                        if not match:
                            continue

                        paint_name = match.group(1).strip()
                        skin_condition = match.group(2).strip()

                        # Initialize stattrak flag
                        is_stattrak = False

                        # Check for the "StatTrak™" prefix and remove it if present.
                        stattrak_prefix = "StatTrak™ "
                        if left.startswith(stattrak_prefix):
                            is_stattrak = True
                            left = left[len(stattrak_prefix):].strip()

                        weapon_name = left
                        # Skip if the weapon is not in our allowed list.
                        if weapon_name not in ALLOWED_WEAPONS:
                            continue

                        #print(f"{stattrak_prefix if is_stattrak else ""}{weapon_name} | {paint_name} ({skin_condition}), Price: {entry.get('price')}")
                        writer.writerow({'weapon': weapon_name, 'skin': paint_name, 'condition': skin_condition, 'price': entry.get('price')})

                        skin_name = f"{weapon_name} | {paint_name}"
                        # Query for matching SkinCondition IDs
                        skin_condition_id = (
                            db.session.query(SkinCondition.id)
                            .join(Skin, Skin.id == SkinCondition.skin_id)
                            .filter(
                                Skin.name == skin_name,
                                SkinCondition.condition == skin_condition,
                                SkinCondition.stattrak == is_stattrak
                            )
                            .scalar()
                        )
                        if not skin_condition_id:
                            # this just means the skin is not in the database, so we skip it
                            #print(f"Skin {skin_name} ({skin_condition}) not found in the database")
                            continue
                        
                        stmt = update(SkinCondition)\
                            .where(SkinCondition.id == skin_condition_id)\
                                .values(price=float(entry.get("price")),
                                        timestamp = naive_utcnow()  # or datetime.utcnow() if you prefer
                            )
                        db.session.execute(stmt)
                db.session.commit()

            try:
                update_all_tradeups_stats()
            except Exception as e:
                current_app.logger.error(f"Error updating tradeup stats: {str(e)}")
                current_app.logger.error(traceback.format_exc())

        else:
            print(f"Error: {response.status_code}")