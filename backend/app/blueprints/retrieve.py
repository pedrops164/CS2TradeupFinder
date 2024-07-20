from flask import Blueprint, request, jsonify
from backend.src.tradeups import calculate_output_entries, calculate_tradeup_stats

bp_retrieve = Blueprint('bp_retrieve', __name__)

@bp_retrieve.route('/tracked', methods=['GET'])
def get_tradeups():
    """Returns an array of dicts, each dict representing a tracked tradeup
    """
    example_tradeup = {
        "tradeup_id": 1,
        "name": "example tradeup",
        "input_entries": [
            {
                "entry_id": 13,
                "skin_name": "M249 | Magma",
                "skin_condition": "Well-Worn",
                "float": 0.46,
                "count": 10
            }
        ],
        "output_entries": [
            {
                "entry_id": 17,
                "skin_name": "AK-47 | example skin",
                "skin_condition": "Well-Worn",
                "float": 0.46,
                "prob": 50 # 0 to 1
            },
            {
                "entry_id": 18,
                "skin_name": "AWP | example skin",
                "skin_condition": "Well-Worn",
                "float": 0.47,
                "prob": 50 # 0 to 1
            }
        ],
        "collection_array": ["Collection Example"],
        "input_rarity": "Mil-Spec",
        "stattrak": True
    }
    
    return jsonify({"result": [example_tradeup]}), 201

@bp_retrieve.route('/create', methods=['POST'])
def get_tradeup_output():
    """Gets tradeup input entries and returns the corresponding output entries by calculating them, and the tradeup stats

    Returns:
    average input float
    tradeup cost
    profitability average
    odds to profit
    output entries
    """
    data = request.get_json()
    
    if not data:
        return jsonify({"error": "No data provided"}), 400
    
    input_entries = data.get('input_entries')
    stattrak = data.get('stattrak')
    rarity = data.get('rarity')
    
    if not input_entries or not stattrak or not rarity:
        return jsonify({"error": "Missing required fields"}), 400
    
    # example
    output_entries = [
            {
                "skin_name": "AK-47 | example skin",
                "skin_condition": "Well-Worn",
                "float": 0.46,
                "prob": 50 # 0 to 1
            },
            {
                "skin_name": "AWP | example skin",
                "skin_condition": "Well-Worn",
                "float": 0.47,
                "prob": 50 # 0 to 1
            }
    ]

    output_entries = calculate_output_entries(input_entries, stattrak, rarity)
    
    avg_input_float, tradeup_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries, output_entries, stattrak)

    return jsonify({
        "output": output_entries,
        "avg_input_float": avg_input_float,
        "tradeup_cost": tradeup_cost,
        "profit_avg": profit_avg,
        "profit_odds": profit_odds}), 201
