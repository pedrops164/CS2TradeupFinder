from flask import Blueprint, request, jsonify
from backend.src.tradeups import calculate_output_entries, calculate_tradeup_stats
from backend.app.models import db, Tradeup, InputTradeupEntry, SkinCondition, OutputTradeupEntry, Skin, Collection, TradeupType
from sqlalchemy.orm import joinedload
from sqlalchemy import select
from flask_login import login_required, current_user
from backend.app.limiter import limiter
from backend.app.types import InputEntryDict, OutputEntryDict
from backend.app.util import get_long_tradeup_dict, get_purchasable_tradeup_dict, get_input_entry_dict, get_output_entry_dict
from typing import List
import logging
from .schemas import InputEntrySchema, TradeupInputSchema, SearchSkinSchema, DuplicateTradeupCheckSchema
from marshmallow import ValidationError
# import json for serialization and deserialization of data
from json import dumps, loads
from webargs.flaskparser import use_kwargs

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Define blueprint
bp_retrieve = Blueprint('bp_retrieve', __name__)

# Define routes
@bp_retrieve.route('/tradeups/tracked', methods=['GET'])
@login_required
@limiter.limit("20 per minute", key_func = lambda : current_user.id)
def get_tradeups():
    """
    This route returns a list of tracked tradeups for the authenticated user. Each tradeup is represented by a dictionary
     containing details about input and output entries, collections, and tradeup stats.

    Returns:
        JSON response with a list of tracked tradeups.
        - tradeup_id: ID of the tradeup.
        - tradeup_name: Name of the tradeup.
        - input_entries: List of dictionaries representing input entries.
        - output_entries: List of dictionaries representing output entries.
        - collection_names: List of collection names involved.
        - tradeup_input_rarity: Rarity of the tradeup input.
        - tradeup_stattrak: Boolean indicating if the tradeup is for StatTrak items.
        - avg_input_float: Average float value of input skins.
        - input_skins_cost: Cost of the input skins.
        - profit_avg_pctg: Average percentage of profit.
        - profit_odds: Odds of making a profit.
    """
    logger.info("Fetching tracked tradeups for user: %s", current_user.id)

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
@limiter.limit("20 per minute", key_func = lambda : current_user.id)
@use_kwargs(TradeupInputSchema())
def get_tradeup_output(input_entries, stattrak, input_rarity, name):
    """
    Processes the input entries to compute corresponding output entries and provides statistics related to the tradeup.

    Args:
        JSON payload containing:
        - input_entries (list of InputEntryDict): Details of input entries for the tradeup.
        - stattrak (bool): Boolean indicating if the tradeup is for StatTrak items.
        - input_rarity (str): Rarity of the tradeup input.

    Returns:
        JSON response with:
        - output (list of OutputEntryDict): Computed output entries.
        - avg_input_float: Average float value of input skins.
        - tradeup_cost: Total cost of the tradeup.
        - profit_avg: Average percentage of profit.
        - profit_odds: Odds of making a profit.
    """
    logger.info("Calculating tradeup output for user: %s", current_user.id)
    request_data = request.get_json()
    schema = TradeupInputSchema()
    try:
        # Validate request body against schema data types
        request_data = schema.load(request_data)
    except ValidationError as err:
        # Return an error message if validation fails
        logger.error(err.messages, exc_info=True)
        return jsonify({}), 400
    
    input_entries: InputEntryDict = request_data.get('input_entries')
    stattrak: bool = request_data.get('stattrak')
    input_rarity: str = request_data.get('input_rarity')

    try:
        output_entries = calculate_output_entries(input_entries, stattrak, input_rarity)

        avg_input_float, tradeup_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries, output_entries, stattrak)

        return jsonify({
            "output": output_entries,
            "avg_input_float": avg_input_float,
            "tradeup_cost": tradeup_cost,
            "profit_avg": profit_avg,
            "profit_odds": profit_odds}), 201
    except Tradeup.InvalidRarityException as e:
        logger.error(str(e), exc_info=True)
        return jsonify({"error": str(e)}), 400
    except Exception as e:
        logger.error(str(e), exc_info=True)
        return jsonify({}), 500

@bp_retrieve.route("/tradeups/search_skin", methods=["POST"])
@limiter.limit("60 per minute")
@login_required
@use_kwargs(SearchSkinSchema())
def search_skin(rarity, stattrak, condition, search_string, collection_names):
    """
    Searches for skins based on specified criteria.
    This route allows the user to search for skins using filters such as rarity, StatTrak status, condition, and optional search string and collection names.

    Args:
        JSON payload containing:
        - rarity (str): Rarity of the skin.
        - stattrak (bool): Boolean indicating if the skin is StatTrak.
        - condition (str): Condition of the skin.
        - search_string (str, optional): Partial or full name of the skin to search for.
        - collection_names (list of str, optional): List of collection names to filter by.

    Returns:
        JSON response with a list of skins matching the search criteria.
    """
    #request_data = request.get_json()
    #schema = SearchSkinSchema()
    #try:
    #    request_data = schema.load(request_data)
    #except ValidationError as err:
    #    logger.error(err.messages, exc_info=True)
    #    return jsonify({}), 400
    #
    #rarity = request_data.get('rarity')
    #stattrak = request_data.get('stattrak')
    #condition = request_data.get('condition')
    #search_string = request_data.get('search_string') # optional
    #collection_names = request_data.get('collection_names') # list of collection names (optional)
    
    query = db.session.query(
        Skin.name.label('skin_name'),
        SkinCondition.condition.label('skin_condition'),
        Skin.min_float.label('min_float'),
        Skin.max_float.label('max_float'),
        SkinCondition.price.label('price'),
        Collection.name.label('collection_name')
    )\
    .filter(Skin.id == SkinCondition.skin_id,
    Collection.id == Skin.collection_id,
    Skin.quality == rarity,
    SkinCondition.stattrak == stattrak,
    SkinCondition.price != None,
    SkinCondition.condition == condition)

    if collection_names:
        query = query.filter(Collection.name.in_(collection_names))

    if search_string:
        query = query.filter(Skin.name.ilike(f"%{search_string}%"))

    skins_result = query.all()

    # Convert the result to a list of dictionaries
    skins_result_dicts = [row._asdict() for row in skins_result]

    return jsonify(skins_result_dicts), 200

@bp_retrieve.route('/tradeups/purchasable', methods=['GET'])
@login_required
@limiter.limit("20 per minute", key_func = lambda : current_user.id)
def get_purchasable_tradeups():
    """
    This route provides a list of tradeups available for purchase, segmented into those that the user has already purchased
     and those that are still available for purchase.

    Returns:
        JSON response with:
        - purchased: List of dictionaries representing tradeups the user has purchased.
        - not_purchased: List of dictionaries representing tradeups the user has not purchased.
    """
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
@limiter.limit("60 per minute")
def get_public_tradeups():
    """
    This route returns a list of tradeups that are publicly available.

    Returns:
        JSON response with a list of public tradeups.
    """
    public_tradeups = Tradeup.query.filter(Tradeup.tradeup_type == TradeupType.PUBLIC).all()
    public_tradeups_dicts = []
    for tradeup in public_tradeups:
        public_tradeups_dicts.append(get_long_tradeup_dict(tradeup))
    
    return {"public_tradeups": public_tradeups_dicts}, 200

@bp_retrieve.route('/load-all-skins', methods=['GET'])
@login_required
@limiter.limit("30 per minute", key_func = lambda : current_user.id)
def get_all_skins():
    """
    This route returns a list of all the skins, each having the following attributes:
    - skin name
    - stattrak available
    - rarity
    - min float
    - max float
    - image url
    - price for each condition (Factory New, Minimal Wear, etc.)
    """

    all_skins = []

    # Perform a join between Skin and SkinCondition to get the skin details and price information
    result = db.session.execute(
        select(
            Skin.name, 
            Skin.stattrak_available, 
            Skin.quality, 
            Skin.min_float, 
            Skin.max_float, 
            Skin.image_name,
            SkinCondition.condition,
            SkinCondition.price,
            SkinCondition.stattrak,
            Collection.id.label('collection_id')
        ).join(SkinCondition, Skin.id == SkinCondition.skin_id)\
        .join(Collection, Collection.id == Skin.collection_id)
    )

    # Organize the results
    skins_dict = {}
    for row in result:
        skin_key = row.name

        # If the skin is already added to the dict, update the conditions
        if skin_key in skins_dict:
            conditions = skins_dict[skin_key]['conditions']
        else:
            # If the skin is not yet added, create a new entry for it
            skins_dict[skin_key] = {
                "skin_name": row.name,
                "stattrak_available": row.stattrak_available,
                "rarity": row.quality,
                "min_float": row.min_float,
                "max_float": row.max_float,
                "image_url": row.image_name,
                "conditions": {},
                "collection_id": row.collection_id
            }
            conditions = skins_dict[skin_key]['conditions']

        # Add/update the condition in the dictionary
        if row.condition not in conditions:
            conditions[row.condition] = {
                "stattrak": None,
                "non_stattrak": None
            }

        if row.stattrak:
            conditions[row.condition]["stattrak"] = row.price
        else:
            conditions[row.condition]["non_stattrak"] = row.price

    # Convert the dictionary to a list for JSON response
    all_skins = list(skins_dict.values())

    return {"all_skins": all_skins}, 200

@bp_retrieve.route('/tradeups/check_duplicate', methods=['POST'])
@login_required
@limiter.limit("20 per minute", key_func = lambda : current_user.id)
@use_kwargs(DuplicateTradeupCheckSchema())
def check_duplicate_tradeup(input_entries, stattrak, input_rarity, name, tradeup_price, tradeup_type):
    """
    Checks if a tradeup with the given input entries, stattrak status, and rarity already exists.

    Args:
        JSON payload containing:
        - input_entries (list of InputEntryDict): Details of input entries for the tradeup.
        - stattrak (bool): Boolean indicating if the tradeup is for StatTrak items.
        - input_rarity (str): Rarity of the tradeup input.

    Returns:
        JSON response with:
        - is_duplicate (bool): Indicates if the tradeup is a duplicate.
    """
    logger.info("Checking for duplicate tradeup for user: %s", current_user.id)

    #request_data = request.get_json()
    #schema = DuplicateTradeupCheckSchema()
    #try:
    #    request_data = schema.load(request_data)
    #except ValidationError as err:
    #    logger.error(err.messages, exc_info=True)
    #    return jsonify({}), 400
    #
    #input_entries: List[InputEntryDict] = request_data.get('input_entries')
    #stattrak: bool = request_data.get('stattrak')
    #input_rarity: str = request_data.get('input_rarity')
    #tradeup_type: str = request_data.get('tradeup_type')

    try:
        # Query the database to check for duplicates
        duplicate_tradeups = Tradeup.query.filter(
            Tradeup.stattrak == stattrak,
            Tradeup.input_rarity == input_rarity,
            Tradeup.tradeup_type == TradeupType(tradeup_type)
        ).all()

        for tradeup in duplicate_tradeups:
            tradeup_input_entries = tradeup.input_entries
            if len(tradeup_input_entries) != len(input_entries):
                continue

            is_duplicate = all(
                any(
                    entry['skin_name'] == tradeup_entry.skin_condition.skin.name and
                    entry['skin_float'] == tradeup_entry.skin_float and
                    entry['count'] == tradeup_entry.count
                    for tradeup_entry in tradeup_input_entries
                )
                for entry in input_entries
            )

            if is_duplicate:
                return jsonify({"is_duplicate": True}), 200

        return jsonify({"is_duplicate": False}), 200
    except Exception as e:
        logger.error(f"Error occurred in check_duplicate_tradeup: {str(e)}", exc_info=True)
        return jsonify({}), 500