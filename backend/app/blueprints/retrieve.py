from flask import Blueprint, request, jsonify
from backend.src.tradeups import calculate_output_entries, calculate_tradeup_stats
from backend.app.models import db, Tradeup, InputTradeupEntry, SkinCondition, OutputTradeupEntry, Skin, Collection
from backend.app.database import get_skin_price
from sqlalchemy.orm import joinedload
from flask_login import login_required

bp_retrieve = Blueprint('bp_retrieve', __name__)

@bp_retrieve.route('/tracked', methods=['GET'])
@login_required
def get_tradeups():
    """Returns an array of dicts, each dict representing a tracked tradeup
    """

    tracked_tradeups = []

    # get all tradeups, associated with their input and output entries, and associated with their skin conditions (joins)
    tradeups = db.session.query(Tradeup).options(
        joinedload(Tradeup.input_entries).joinedload(InputTradeupEntry.skin_condition).joinedload(SkinCondition.skin),
        joinedload(Tradeup.output_entries).joinedload(OutputTradeupEntry.skin_condition).joinedload(SkinCondition.skin),
        joinedload(Tradeup.collections)
    ).all()

    # Parsing each tradeup separately
    for tradeup in tradeups:
        input_entries, output_entries, collection_names = [], [], []
        tradeup_id = tradeup.id
        tradeup_name = tradeup.name
        tradeup_input_rarity = tradeup.input_rarity
        tradeup_stattrak = tradeup.stattrak
        
        for input_entry in tradeup.input_entries:
            # parse each input entry, create the dictionary, and add to the array of input entries
            skin_condition = input_entry.skin_condition
            skin = skin_condition.skin
            skin_price = get_skin_price(skin.name, skin_condition.condition, skin.stattrak)
            input_entries.append({
                "skin_name": skin.name,
                "skin_condition": skin_condition.condition,
                "float": input_entry.float,
                "count": input_entry.count,
                "price": skin_price
            })
    
        for output_entry in tradeup.output_entries:
            # parse each output entry, create the dictionary, and add to the array of output entries
            skin_condition = output_entry.skin_condition
            skin = skin_condition.skin
            skin_price = get_skin_price(skin.name, skin_condition.condition, skin.stattrak)
            output_entries.append({
                "skin_name": skin.name,
                "skin_condition": skin_condition.condition,
                "float": output_entry.float,
                "prob": output_entry.prob,
                "price": skin_price
            })

        # add all collection names involved    
        for collection in tradeup.collections:
            collection_names.append(collection.name)
    
        # get tradeup stats
        avg_input_float, input_skins_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries, output_entries, tradeup_stattrak)

        # add tradeup to the array of tradeups
        tracked_tradeups.append({
            "tradeup_id": tradeup_id,
            "tradeup_name": tradeup_name,
            "input_entries": input_entries,
            "output_entries": output_entries,
            "collection_names": collection_names,
            "tradeup_input_rarity": tradeup_input_rarity,
            "tradeup_stattrak": tradeup_stattrak,
            "avg_input_float": avg_input_float,
            "input_skins_cost": input_skins_cost,
            "profit_avg_pctg": profit_avg,
            "profit_odds": profit_odds,
        })
    
    return jsonify({"result": tracked_tradeups}), 201

@bp_retrieve.route('/create', methods=['POST'])
@login_required
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

@bp_retrieve.route("/search_skin", methods=["POST"])
@login_required
def search_skin():
    data = request.get_json()
    
    if not data:
        return jsonify({"error": "No data provided"}), 400

    rarity = data.get('rarity')
    stattrak = data.get('stattrak')
    condition = data.get('condition')
    search_string = data.get('search_string') # optional
    collection_names = data.get('collection_names') # list of collection names (optional)

    if rarity is None or stattrak is None or condition is None:
        return jsonify({"error": "Missing required fields"}), 400
    
    query = db.session.query(
        Skin.name.label('skin_name'),
        SkinCondition.condition.label('skin_condition'),
        Skin.min_float.label('min_float'),
        Skin.max_float.label('max_float'),
        SkinCondition.price.label('price'),
        Collection.name.label('collection_name')
    )\
    .filter(Skin.id == SkinCondition.skin_id)\
    .filter(Collection.id == Skin.collection_id)\
    .filter(Skin.quality == rarity)\
    .filter(Skin.stattrak == stattrak)\
    .filter(SkinCondition.price != None)\
    .filter(SkinCondition.condition == condition)\

    if collection_names:
        query = query.filter(Collection.name.in_(collection_names))

    if search_string:
        query = query.filter(Skin.name.ilike(f"%{search_string}%"))

    skins_result = query.all()

    # Convert the result to a list of dictionaries
    skins_result_dicts = [row._asdict() for row in skins_result]

    return jsonify(skins_result_dicts), 201