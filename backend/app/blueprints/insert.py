from flask import Blueprint, request, jsonify
from backend.app.database import add_tradeup, add_tradeup_entry, get_skin_condition_id, get_skins_by_name, add_tradeup_collection
from backend.app.models import Tradeup, InputTradeupEntry, OutputTradeupEntry, TradeupCollections

bp_insert = Blueprint('bp_insert', __name__)

@bp_insert.route('/add_tradeup', methods=['POST'])
def add_completed_tradeup():
    data = request.json
    tradeup_name = data["name"]
    tradeup_isstattrak = data["stattrak"]
    tradeup_input_rarity = data["input_rarity"]
    input_entries_dict = data["input_entries"]
    output_entries_dict = data["output_entries"]

    # Validate total count of all entries
    total_count = sum(entry["count"] for entry in input_entries_dict)
    if total_count != 10:
        return jsonify({"error": "The total count of all entries must be 10"}), 400
    
    tradeup = Tradeup(tradeup_isstattrak, tradeup_input_rarity, tradeup_name)
    input_entries, output_entries = [], []
    tradeup_collection_ids = set()
    
    if len(input_entries_dict) == 0:
        return jsonify({"error": f"Tradeup entries array is empty"}), 400
    
    # at this point we know len(tradeup_entries) > 0
    for tradeup_entry in input_entries_dict:
        weapon_paint = tradeup_entry["skin_name"]
        condition = tradeup_entry["skin_condition"]
        skin_float = tradeup_entry["float"]
        count = tradeup_entry["count"]
        tradeup_collection_ids.add(tradeup_entry["collection_id"])
        
        skin_condition_id, error = _input_entry_check(weapon_paint, tradeup_isstattrak, tradeup_input_rarity, condition, skin_float)
        if skin_condition_id:
            input_entries.append(InputTradeupEntry(skin_condition_id, skin_float, count, None))
        else:
            return jsonify({"error": error}), 400

    for tradeup_entry in output_entries_dict:
        weapon_paint = tradeup_entry["skin_name"]
        condition = tradeup_entry["skin_condition"]
        skin_float = tradeup_entry["float"]
        prob = tradeup_entry["prob"]
        
        skin_condition_id, error = _output_entry_check(weapon_paint, tradeup_isstattrak, tradeup_input_rarity, condition, skin_float)
        if skin_condition_id:
            output_entries.append(OutputTradeupEntry(skin_condition_id, skin_float, prob, None))
        else:
            return jsonify({"error": error}), 400
    
    # every possible error has been checked, so we add the tradeup and its input and output entries to the db
    add_tradeup(tradeup)
    for entry in input_entries:
        entry.set_tradeup_id(tradeup.id)
        add_tradeup_entry(entry)
    for entry in output_entries:
        entry.set_tradeup_id(tradeup.id)
        add_tradeup_entry(entry)
    for coll_id in tradeup_collection_ids:
        tradeup_collection = TradeupCollections(tradeup.id, coll_id)
        add_tradeup_collection(tradeup_collection)
        
    return jsonify({"id": tradeup.id, "name": tradeup.name}), 201

def _input_entry_check(weapon_paint, tradeup_isstattrak, tradeup_input_rarity, condition, skin_float):
    """Applies assert checks for a given input entry

    Args:
        weapon_paint (str): paint of the skin. For example "AK-47 | Redline"
        tradeup_isstattrak (bool): boolean indicating if tradeup is stattrak
        tradeup_input_rarity (str): input rarity of the tradeup. For example "milspec_bg"
        condition (str): condition of the skin. For example "Factory New"
        skin_float (float): float of the skin (value 0 to 1)

    Returns:
        result: id of skin condition if no errors, otherwise None
        error: if errors, returns error message, otherwise None
    """

    # returns array of tuples (min_float, max_float, quality, stattrak)
    matching_skins = get_skins_by_name(weapon_paint)

    if len(matching_skins) == 0:
        # no results, so skin with weapon_paint as name doesnt exist
        return None, f"Invalid weapon_paint for '{weapon_paint}'"
    if not any([res[3] == tradeup_isstattrak for res in matching_skins]):
        # there isn't a result on this skin with the given stattrak status
        # (a stattrak skin was requested for a skin which doesn't have stattrak)
        return None, f"Weapon_paint {weapon_paint} doesn't have given stattrak status"
    # float in bounds check
    if matching_skins[0][0] > skin_float or matching_skins[0][1] < skin_float:
        return None, f"Weapon_paint {weapon_paint} with float {skin_float} is not valid"
    # [0] because we know len(results) > 0, and [2] because quality is at index 2
    if tradeup_input_rarity != matching_skins[0][2]:
        return None, "Tradeup Input rarity doesn't match rarity of input entry"
    
    skin_condition_id = get_skin_condition_id(weapon_paint, condition)
    
    if skin_condition_id is None:
        return None, f"Invalid weapon_paint or condition for {weapon_paint}, {condition}"

    return skin_condition_id, None

def _output_entry_check(weapon_paint, tradeup_isstattrak, tradeup_input_rarity, condition, skin_float):

    # returns array of tuples (min_float, max_float, quality, stattrak)
    matching_skins = get_skins_by_name(weapon_paint)

    if len(matching_skins) == 0:
        # no results, so skin with weapon_paint as name doesnt exist
        return None, f"Invalid weapon_paint for '{weapon_paint}'"
    if not any([res[3] == tradeup_isstattrak for res in matching_skins]):
        # there isn't a result on this skin with the given stattrak status
        # (a stattrak skin was requested for a skin which doesn't have stattrak)
        return None, f"Weapon_paint {weapon_paint} doesn't have given stattrak status"
    # float in bounds check
    if matching_skins[0][0] > skin_float or matching_skins[0][1] < skin_float:
        return None, f"Weapon_paint {weapon_paint} with float {skin_float} is not valid"
    # [0] because we know len(results) > 0, and [2] because quality is at index 2
    if Tradeup.get_output_quality(tradeup_input_rarity) != matching_skins[0][2]:
        return None, "Tradeup Output rarity doesn't match rarity of output entry"
    
    skin_condition_id = get_skin_condition_id(weapon_paint, condition)
    
    if skin_condition_id is None:
        return None, f"Invalid weapon_paint or condition for {weapon_paint}, {condition}"

    return skin_condition_id, None