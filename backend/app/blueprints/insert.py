from flask import Blueprint, request, jsonify
from backend.app.database import add_tradeup, add_tradeup_entry, get_skin_condition_id, get_skins_by_name
from backend.app.models import Tradeup, InputTradeupEntry

bp_insert = Blueprint('bp_insert', __name__)

@bp_insert.route('/add_tradeup', methods=['POST'])
def add_completed_tradeup():
    data = request.json
    tradeup_name = data["name"]
    tradeup_isstattrak = data["isstattrak"]
    tradeup_entries_dicts = data["entries"]

    # Validate total count of all entries
    total_count = sum(entry["count"] for entry in tradeup_entries_dicts)
    if total_count != 10:
        return jsonify({"error": "The total count of all entries must be 10"}), 400
    
    rarities = set()
    
    #tradeup = add_tradeup(tradeup_name)
    tracked = True
    tradeup = Tradeup(tradeup_name, tracked)
    entries = []
    
    if len(tradeup_entries_dicts) == 0:
        return jsonify({"error": f"Tradeup entries array is empty"}), 400
    
    # at this point we know len(tradeup_entries) > 0
    
    for tradeup_entry in tradeup_entries_dicts:
        weapon_paint = tradeup_entry["weapon_paint"]
        condition = tradeup_entry["condition"]
        float = tradeup_entry["float"]
        count = tradeup_entry["count"]
        
        # returns array of tuples (min_float, max_float, quality, stattrak)
        results = get_skins_by_name(weapon_paint)
    
        if len(results) == 0:
            # no results, so skin with weapon_paint as name doesnt exist
            return jsonify({"error": f"Invalid weapon_paint for '{weapon_paint}'"}), 400

        if not any([res[3] == tradeup_isstattrak for res in results]):
            # there isn't a result on this skin with the given stattrak status
            # (a stattrak skin was requested for a skin which doesn't have stattrak)
            return jsonify({"error": f"Weapon_paint {weapon_paint} doesn't have given stattrak status"}), 400
        
        # float in bounds check
        if results[0][0] > float or results[0][1] < float:
            return jsonify({"error": f"Weapon_paint {weapon_paint} with float {float} is not valid"}), 400
        
        # [0] because we know len(results) > 0, and [2] because quality is at index 2
        rarities.add(results[0][2])
        
        skin_condition_id = get_skin_condition_id(weapon_paint, condition)
        
        if skin_condition_id is None:
            return jsonify({"error": f"Invalid weapon_paint or condition for {weapon_paint}, {condition}"}), 400
        
        entries.append(InputTradeupEntry(skin_condition_id, float, count, None))
    
    assert len(rarities) > 0
    if len(rarities) != 1:
        return jsonify({"error": f"The rarity of the tradeup entries doesn't match"}), 400
    
    # every possible error has been checked, so we add the tradeup and its entries to the db
    add_tradeup(tradeup)
    for entry in entries:
        entry.set_tradeup_id(tradeup.id)
        add_tradeup_entry(entry)
        
    return jsonify({"id": tradeup.id, "name": tradeup.name}), 201