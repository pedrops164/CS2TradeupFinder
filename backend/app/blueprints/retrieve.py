from flask import Blueprint, request, jsonify
from backend.src.tradeups import calculate_output_entries, calculate_tradeup_stats
from backend.app.models import db, Tradeup, InputTradeupEntry, SkinCondition, OutputTradeupEntry, Skin, Collection, TradeupType
from backend.app.database import get_skin_price
from sqlalchemy.orm import joinedload
from flask_login import login_required, current_user
from backend.app.types import InputEntryDict, OutputEntryDict
from backend.app.util import get_long_tradeup_dict, get_purchasable_tradeup_dict, get_input_entry_dict, get_output_entry_dict
from typing import List

bp_retrieve = Blueprint('bp_retrieve', __name__)

@bp_retrieve.route('/tradeups/tracked', methods=['GET'])
@login_required
def get_tradeups():
    """Returns an array of dicts, each dict representing a tracked tradeup
    """

    tracked_tradeups = []

    # Parsing each tradeup separately
    for tradeup in current_user.tracked_tradeups:
        input_entries_dict: List[InputEntryDict] = []
        output_entries_dict: List[OutputEntryDict] = []
        collection_names: List[str] = []

        tradeup_id = tradeup.id
        tradeup_name = tradeup.name
        tradeup_input_rarity = tradeup.input_rarity
        tradeup_stattrak = tradeup.stattrak
        
        for input_entry in tradeup.input_entries:
            # parse each input entry, create the dictionary, and add to the array of input entries
            input_entry_dict = get_input_entry_dict(input_entry)
            input_entries_dict.append(input_entry_dict)
    
        for output_entry in tradeup.output_entries:
            # parse each output entry, create the dictionary, and add to the array of output entries
            output_entry_dict = get_output_entry_dict(output_entry)
            output_entries_dict.append(output_entry_dict)

        # add all collection names involved    
        for collection in tradeup.collections:
            collection_names.append(collection.name)
    
        # get tradeup stats
        avg_input_float, input_skins_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries_dict, output_entries_dict, tradeup_stattrak)

        # add tradeup to the array of tradeups
        tracked_tradeups.append({
            "tradeup_id": tradeup_id,
            "tradeup_name": tradeup_name,
            "input_entries": input_entries_dict,
            "output_entries": output_entries_dict,
            "collection_names": collection_names,
            "tradeup_input_rarity": tradeup_input_rarity,
            "tradeup_stattrak": tradeup_stattrak,
            "avg_input_float": avg_input_float,
            "input_skins_cost": input_skins_cost,
            "profit_avg_pctg": profit_avg,
            "profit_odds": profit_odds,
        })
    
    return jsonify({"result": tracked_tradeups}), 200

@bp_retrieve.route('/tradeups/calculate_output', methods=['POST'])
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
    
    input_entries: InputEntryDict = data.get('input_entries')
    stattrak: bool = data.get('stattrak')
    rarity: str = data.get('rarity')
    
    if not input_entries or not stattrak or not rarity:
        return jsonify({"error": "Missing required fields"}), 400

    output_entries = calculate_output_entries(input_entries, stattrak, rarity)
    
    avg_input_float, tradeup_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries, output_entries, stattrak)

    return jsonify({
        "output": output_entries,
        "avg_input_float": avg_input_float,
        "tradeup_cost": tradeup_cost,
        "profit_avg": profit_avg,
        "profit_odds": profit_odds}), 201

@bp_retrieve.route("/tradeups/search_skin", methods=["POST"])
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

@bp_retrieve.route('/tradeups/purchasable', methods=['GET'])
@login_required
def get_purchasable_tradeups():
    user_id = current_user.id
    user_email = current_user.email
    all_purchasable_tradeups = Tradeup.query.filter(Tradeup.tradeup_type == TradeupType.PURCHASABLE).all()
    user_purchased_tradeups = current_user.tradeups_purchased
    purchased_tradeups_dicts = []
    not_purchased_tradeups_dicts = []
    for tradeup in all_purchasable_tradeups:
        # check if user purchased tradeup
        if tradeup in user_purchased_tradeups:
            # user bought this tradeup. So we return all the information about the tradeup
            purchased_tradeups_dicts.append(get_long_tradeup_dict(tradeup))
        else:
            # user hasn't bought this tradeup. So we return relevant yet non disclosing info about the tradeup
            not_purchased_tradeups_dicts.append(get_purchasable_tradeup_dict(tradeup))

    return {
        'purchased': purchased_tradeups_dicts,
        'not_purchased': not_purchased_tradeups_dicts}, 200

@bp_retrieve.route('/tradeups/public', methods=['GET'])
def get_public_tradeups():
    public_tradeups = Tradeup.query.filter(Tradeup.tradeup_type == TradeupType.PUBLIC).all()
    public_tradeups_dicts = []
    for tradeup in public_tradeups:
        public_tradeups_dicts.append(get_long_tradeup_dict(tradeup))
    
    return {"public_tradeups": public_tradeups_dicts}, 200