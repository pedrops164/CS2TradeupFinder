from flask import Blueprint, request, jsonify, current_app
from backend.src.tradeups import calculate_output_entries, calculate_tradeup_stats
from sqlalchemy.orm import joinedload
from sqlalchemy import select, or_, not_
from backend.app.models import db, Tradeup, InputTradeupEntry, SkinCondition, OutputTradeupEntry, Skin, Collection, TradeupType
from backend.app.limiter import limiter
from backend.app.types import InputEntryDict, OutputEntryDict
from backend.app.util import get_long_tradeup_dict, get_purchasable_tradeup_dict, get_input_entry_dict, get_output_entry_dict
from typing import List
import logging
from .schemas import InputEntrySchema, TradeupInputSchema, DuplicateTradeupCheckSchema, SkinSearchSchema
from marshmallow import ValidationError
# import json for serialization and deserialization of data
from webargs.flaskparser import use_kwargs

from backend.app.auth import token_auth
from apifairy import authenticate # restrict function access to authenticated users

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Define blueprint
bp_retrieve = Blueprint('bp_retrieve', __name__)

# Define routes
@bp_retrieve.route('/tradeups/tracked', methods=['GET'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
def get_tradeups():
    """
    This route returns a list of tracked tradeups for the authenticated user. Each tradeup is represented by a dictionary
     containing details about input and output entries, collections, and tradeup stats.

    Returns:
        JSON response with a list of tracked tradeups.
        Each tradeup dictionary contains the following keys:
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
    logger.info("Fetching tracked tradeups for user: %s", token_auth.current_user().steam_id)

    tracked_tradeups = []

    # Parsing each tradeup separately
    for tradeup in token_auth.current_user().tracked_tradeups:
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
    
    return jsonify({"tradeups": tracked_tradeups}), 200

@bp_retrieve.route('/tradeups/calculate_output', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
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
    #logger.info("Calculating tradeup output for user: %s", token_auth.current_user().steam_id)

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

@bp_retrieve.route('/skins/search', methods=['GET'])
@use_kwargs(SkinSearchSchema, location="query")
def search_skins(search_string, rarity, stattrak, page):
    """
    Search for skins based on a search string, rarity, and stattrak status.

    Args:
        search_string (str): The search string to filter skins by name.
        rarity (str): The rarity of the skins (e.g., "milspec_bg").
        stattrak (bool): Whether the skins are StatTrak.
        page (int): The page number for pagination.
        per_page (int): The number of items per page.

    Returns:
        JSON response with a paginated list of matching skins.
    """
    # Get the number of tradeups per page from the app config
    skins_per_page = current_app.config.get('SKINS_PER_PAGE', 10)  # Default to 10 if not set

    # Get unique Skin IDs that match the filters
    skin_query = db.session.query(Skin.id)\
        .filter(Skin.quality == rarity, Skin.last_of_rarity == False, Skin.stattrak_available | not_(stattrak))

    # Apply the stattrak filter
    if stattrak:
        # Only include skins where stattrak_available is True
        skin_query = skin_query.filter(Skin.stattrak_available == True)

    if search_string:
        skin_query = skin_query.filter(Skin.name.ilike(f"%{search_string}%"))

    # Paginate the unique Skin IDs
    paginated_skin_ids = skin_query.paginate(page=page, per_page=skins_per_page, error_out=False)

    # Extract the list of Skin IDs from the paginated results
    skin_ids = [skin_id for (skin_id,) in paginated_skin_ids.items]

    # Fetch detailed data for the paginated Skin IDs
    detailed_query = db.session.query(
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
     .join(Collection, Collection.id == Skin.collection_id)\
     .filter(Skin.id.in_(skin_ids))\

    # Organize the results into the same structure as get_all_skins
    skins_dict = {}
    for row in detailed_query:
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
    skins_list = list(skins_dict.values())

    # Return the response with pagination metadata
    return jsonify({
        "skins": skins_list,
        "page": paginated_skin_ids.page,
        "per_page": paginated_skin_ids.per_page,
        "total_pages": paginated_skin_ids.pages,
        "total_items": paginated_skin_ids.total
    }), 200

@bp_retrieve.route('/tradeups/purchasable', methods=['GET'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
def get_purchasable_tradeups():
    """
    This route provides a list of tradeups available for purchase.

    Returns:
        JSON response with:
        - tradeups: List of dictionaries representing tradeups the user has not purchased.
    """
    all_purchasable_tradeups = Tradeup.query.filter(Tradeup.tradeup_type == TradeupType.PURCHASABLE).all()
    user_purchased_tradeups = token_auth.current_user().tradeups_purchased
    purchasable_tradeups_dicts = [get_long_tradeup_dict(tradeup) for tradeup in all_purchasable_tradeups if tradeup not in user_purchased_tradeups]

    return {'tradeups': purchasable_tradeups_dicts}, 200

@bp_retrieve.route('/tradeups/purchased', methods=['GET'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
def get_purchased_tradeups():
    """
    This route provides a list of tradeups that were purchased by the user

    Returns:
        JSON response with:
        - tradeups: List of dictionaries representing tradeups the user has purchased.
    """
    user_purchased_tradeups = token_auth.current_user().tradeups_purchased
    purchased_tradeups_dicts = [get_long_tradeup_dict(tradeup) for tradeup in user_purchased_tradeups]

    return {'tradeups': purchased_tradeups_dicts}, 200

@bp_retrieve.route('/tradeups/public', methods=['GET'])
@limiter.limit("60 per minute")
def get_public_tradeups():
    """
    This route returns a list of tradeups that are publicly available.
    Receives the page number as an argument to allow pagination.

    Returns:
        JSON response with a list of public tradeups.
    """
    # Get the page number from the query parameters, defaulting to 1
    page = request.args.get('page', 1, type=int)
    # Get the number of tradeups per page from the app config
    tradeups_per_page = current_app.config.get('TRADEUPS_PER_PAGE', 10)  # Default to 10 if not set
    public_tradeups_paginated = Tradeup.query.\
        filter(Tradeup.tradeup_type == TradeupType.PUBLIC).\
            paginate(page=page, per_page=tradeups_per_page)

    # Convert the pagination object to a list of tradeup dictionaries
    public_tradeups_dicts = [
        get_long_tradeup_dict(tradeup) for tradeup in public_tradeups_paginated.items
    ]
    
    return {
        "tradeups": public_tradeups_dicts,
        "page": public_tradeups_paginated.page,
        "per_page": public_tradeups_paginated.per_page,
        "total_pages": public_tradeups_paginated.pages,
        "total_items": public_tradeups_paginated.total
    }, 200

@bp_retrieve.route('/tradeups/check_duplicate', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
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
    logger.info("Checking for duplicate tradeup for user: %s", token_auth.current_user().steam_id)

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