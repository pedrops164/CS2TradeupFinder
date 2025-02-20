from flask import Blueprint, jsonify, current_app, request
from backend.src.tradeups import calculate_output_entries, calculate_tradeup_stats
from sqlalchemy import not_
from backend.app.models import db, Tradeup, SkinCondition, Skin, Collection, TradeupType
from backend.app.limiter import limiter
from ..schemas import TradeupInputSchema, DuplicateTradeupCheckSchema, SkinSearchSchema, PaginatedUncensoredTradeupSchema, PaginatedCensoredTradeupSchema,TradeupOutputSchema
# import json for serialization and deserialization of data
from webargs.flaskparser import use_kwargs
from datetime import datetime, timezone
from backend.app.auth import token_auth
from apifairy import authenticate # restrict function access to authenticated users

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
        - id: ID of the tradeup.
        - name: Name of the tradeup.
        - input_entries: List of dictionaries representing input entries.
        - output_entries: List of dictionaries representing output entries.
        - collection_names: List of collection names involved.
        - input_rarity: Rarity of the tradeup input.
        - stattrak: Boolean indicating if the tradeup is for StatTrak items.
        - avg_input_float: Average float value of input skins.
        - input_skins_cost: Cost of the input skins.
        - avg_profitability: Average percentage of profit.
        - profit_odds: Odds of making a profit.
    """
    user = token_auth.current_user()
    current_app.logger.info("User %s requested tracked tradeups", user.steam_id)

    # Get the page number from the query parameters, defaulting to 1
    page = request.args.get('page', 1, type=int)
    # Get the sort_by parameter from the URL query parameters, defaulting to 'avg_profitability'
    sort_by = request.args.get('sort_by', 'avg_profitability', type=str)
    # Get the number of tradeups per page from the app config
    tradeups_per_page = current_app.config.get('TRADEUPS_PER_PAGE', 10)  # Default to 10 if not set

    # Parsing each tradeup separately
    tracked_tradeups = user.tracked_tradeups
    
    # Apply sorting based on the sort_by parameter
    if sort_by == 'avg_profitability':
        tracked_tradeups = tracked_tradeups.order_by(Tradeup.avg_profitability.desc())
    else:
        # default to sort by date
        tracked_tradeups = tracked_tradeups.order_by(Tradeup.created_at.desc())

    tracked_tradeups_paginated = tracked_tradeups.paginate(page=page, per_page=tradeups_per_page)
    current_app.logger.info("Fetched %d tracked tradeups for user %s on page %d, sort_by=%s", 
                              len(tracked_tradeups_paginated.items), user.steam_id, page, sort_by)
    return PaginatedUncensoredTradeupSchema().dump(tracked_tradeups_paginated), 200

@bp_retrieve.route('/tradeups/calculate_output', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
@use_kwargs(TradeupInputSchema())
def get_tradeup_output(input_entries, stattrak, input_rarity, name, release_date):
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
    user = token_auth.current_user()
    current_app.logger.info("User %s initiated tradeup output calculation", user.steam_id)

    try:
        output_entries = calculate_output_entries(input_entries, stattrak, input_rarity)

        avg_input_float, tradeup_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries, output_entries, stattrak)

        tradeup = Tradeup(
            input_entries=input_entries,
            output_entries=output_entries,
            avg_input_float=avg_input_float,
            input_skins_cost=tradeup_cost,
            avg_profitability=profit_avg,
            profit_odds=profit_odds,
        )
        current_app.logger.info("Tradeup calculation successful for user %s", user.steam_id)
        return TradeupOutputSchema().dump(tradeup), 200
    except Tradeup.InvalidRarityException as e:
        current_app.logger.error("Invalid rarity error for user %s: %s", user.steam_id, str(e), exc_info=True)
        return jsonify({"error": str(e)}), 400
    except Exception as e:
        current_app.logger.error("Unexpected error during tradeup calculation for user %s: %s", 
                                   user.steam_id, str(e), exc_info=True)
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
    current_app.logger.info("Skin search initiated with search_string='%s', rarity='%s', stattrak=%s, page=%d",
                              search_string, rarity, stattrak, page)
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
        SkinCondition.id.label('skin_condition_id'),
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
            conditions[row.condition]["stattrak"] = {'price': row.price, 'skin_condition_id': row.skin_condition_id}
        else:
            conditions[row.condition]["non_stattrak"] = {'price': row.price, 'skin_condition_id': row.skin_condition_id}

    # Convert the dictionary to a list for JSON response
    skins_list = list(skins_dict.values())
    current_app.logger.info("Skin search returned %d items on page %d", len(skins_list), page)

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
    user = token_auth.current_user()
    current_app.logger.info("User %s requested purchasable tradeups", user.steam_id)
    # Get the number of tradeups per page from the app config
    tradeups_per_page = current_app.config.get('TRADEUPS_PER_PAGE', 10)  # Default to 10 if not set
    all_purchasable_tradeups = Tradeup.query.filter(Tradeup.tradeup_type == TradeupType.PURCHASABLE)

    # Get the page number from the query parameters, defaulting to 1
    page = request.args.get('page', 1, type=int)
    # Get the sort_by parameter from the URL query parameters, defaulting to 'avg_profitability'
    sort_by = request.args.get('sort_by', 'avg_profitability', type=str)

    # Apply sorting based on the sort_by parameter
    if sort_by == 'avg_profitability':
        all_purchasable_tradeups = all_purchasable_tradeups.order_by(Tradeup.avg_profitability.desc())
    else:
        # default to sort by date
        all_purchasable_tradeups = all_purchasable_tradeups.order_by(Tradeup.created_at.desc())

    #user_purchased_tradeups = token_auth.current_user().tradeups_purchased
    # Currently we also show the tradeups that the user has already purchased. We can change this later,
    #   or show to the user that they have already purchased the tradeup
    all_purchasable_tradeups_paginated = all_purchasable_tradeups.paginate(page=page, per_page=tradeups_per_page)
    current_app.logger.info("Fetched %d purchasable tradeups on page %d for user %s", 
                              len(all_purchasable_tradeups_paginated.items), page, user.steam_id)
    return PaginatedCensoredTradeupSchema().dump(all_purchasable_tradeups_paginated), 200

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
    user = token_auth.current_user()
    current_app.logger.info("User %s requested purchased tradeups", user.steam_id)
    tradeups_per_page = current_app.config.get('TRADEUPS_PER_PAGE', 10)  # Default to 10 if not set
    user_purchased_tradeups = token_auth.current_user().tradeups_purchased

    # Get the page number from the query parameters, defaulting to 1
    page = request.args.get('page', 1, type=int)
    # Get the sort_by parameter from the URL query parameters, defaulting to 'avg_profitability'
    sort_by = request.args.get('sort_by', 'avg_profitability', type=str)

    # Apply sorting based on the sort_by parameter
    if sort_by == 'avg_profitability':
        user_purchased_tradeups = user_purchased_tradeups.order_by(Tradeup.avg_profitability.desc())
    else:
        # default to sort by date
        user_purchased_tradeups = user_purchased_tradeups.order_by(Tradeup.created_at.desc())

    # Get the number of tradeups per page from the app config
    user_purchased_tradeups_paginated = user_purchased_tradeups.paginate(page=page, per_page=tradeups_per_page)
    current_app.logger.info("Fetched %d purchased tradeups on page %d for user %s", 
                              len(user_purchased_tradeups_paginated.items), page, user.steam_id)
    return PaginatedUncensoredTradeupSchema().dump(user_purchased_tradeups_paginated), 200

@bp_retrieve.route('/tradeups/public', methods=['GET'])
@limiter.limit("60 per minute")
def get_public_tradeups():
    """
    This route returns a list of tradeups that are publicly available.
    Receives the page number as an argument to allow pagination.

    Returns:
        JSON response with a list of public tradeups.
    """
    # Get the number of tradeups per page from the app config
    tradeups_per_page = current_app.config.get('TRADEUPS_PER_PAGE', 10)  # Default to 10 if not set
    public_tradeups = Tradeup.query.filter(
        Tradeup.tradeup_type == TradeupType.PUBLIC, # Only show public tradeups
        Tradeup.release_date <= datetime.now(timezone.utc)) # Only show tradeups that have been released (release_date is in the past)

    # Get the page number from the query parameters, defaulting to 1
    page = request.args.get('page', 1, type=int)
    # Get the sort_by parameter from the URL query parameters, defaulting to 'avg_profitability'
    sort_by = request.args.get('sort_by', 'avg_profitability', type=str)

    # Apply sorting based on the sort_by parameter
    if sort_by == 'avg_profitability':
        public_tradeups = public_tradeups.order_by(Tradeup.avg_profitability.desc())
    else:
        # default to sort by date
        public_tradeups = public_tradeups.order_by(Tradeup.created_at.desc())

    public_tradeups_paginated = public_tradeups.paginate(page=page, per_page=tradeups_per_page)
    current_app.logger.info("Fetched %d public tradeups on page %d", 
                              len(public_tradeups_paginated.items), page)

    return PaginatedUncensoredTradeupSchema().dump(public_tradeups_paginated), 200

@bp_retrieve.route('/tradeups/check_duplicate', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
@use_kwargs(DuplicateTradeupCheckSchema())
def check_duplicate_tradeup(input_entries, stattrak, input_rarity, name, release_date, price, tradeup_type):
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
    user = token_auth.current_user()
    current_app.logger.info("User %s initiated duplicate check for tradeup", user.steam_id)

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
                    entry.skin_condition.skin.name == tradeup_entry.skin_condition.skin.name and
                    entry.skin_float == tradeup_entry.skin_float and
                    entry.count == tradeup_entry.count
                    for tradeup_entry in tradeup_input_entries
                )
                for entry in input_entries
            )

            if is_duplicate:
                current_app.logger.info("Duplicate tradeup found for user %s", user.steam_id)
                return jsonify({"is_duplicate": True}), 200

        return jsonify({"is_duplicate": False}), 200
    except Exception as e:
        current_app.logger.error("Error in duplicate check for user %s: %s", user.steam_id, str(e), exc_info=True)
        return jsonify({}), 500