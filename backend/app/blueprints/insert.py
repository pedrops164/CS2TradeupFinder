from flask import Blueprint, request, jsonify, flash
from backend.app.database import add_tradeup, add_tradeup_entry, get_skin_condition_id, get_skins_by_name, add_tradeup_collection
from backend.app.models import Tradeup, InputTradeupEntry, OutputTradeupEntry, TradeupCollections, TradeupType, db
import logging
from .schemas import TradeupInputSchema, PurchasableTradeupInputSchema
from marshmallow import ValidationError
from backend.src.tradeups import calculate_output_entries
from backend.app.limiter import limiter
from webargs.flaskparser import use_kwargs

from backend.app.auth import token_auth
from apifairy import authenticate # restrict function access to authenticated users

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

bp_insert = Blueprint('bp_insert', __name__)

@bp_insert.route('/tradeups/create_public', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().id)
@use_kwargs(TradeupInputSchema())
def create_tradeup_public(input_entries, stattrak, input_rarity, name):
    """
    This route allows authenticated users to create a public tradeup. Public tradeups are visible to all users.
    
    Request JSON body:
    {
        "stattrak": bool,                    # Indicates if the tradeup is for stattrak skins
        "input_rarity": str,                 # Rarity of the input skins (e.g., "milspec_bg")
        "input_entries": [                  # List of input entries
            {
                "skin_name": str,            # Name of the skin (e.g., "AK-47 | Redline")
                "skin_condition": str,       # Condition of the skin (e.g., "Factory New")
                "float": float,              # Float value of the skin (0 to 1)
                "count": int,                # Number of skins of this type
                "collection_id": int         # Collection ID for the skin
            }
        ]
        "name": str                          # Optional name for the tradeup
    }
    
    Returns:
        JSON response with tradeup ID and name on success or an error message and code on failure.
    """
    tradeup_type = TradeupType.PUBLIC

    # get tradeup output entries
    output_entries_dict = calculate_output_entries(input_entries, stattrak, input_rarity, get_entries_price=False, get_entries_image=False)

    error_msg, error_code = _tradeup_input_checks(stattrak, input_rarity, input_entries, output_entries_dict, tradeup_type)
    if error_msg:
        logger.error(error_msg)
        return jsonify({'error': error_msg}), error_code
    
    tradeup, error_msg, error_code = create_tradeup(stattrak, input_rarity, input_entries, output_entries_dict, name, tradeup_type)
    if not tradeup:
        logger.error(error_msg)
        return jsonify({"error": error_msg}), error_code
    else:
        return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201
    
@bp_insert.route('/tradeups/create_purchasable', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().id)
@use_kwargs(PurchasableTradeupInputSchema())
def create_tradeup_purchasable(input_entries, stattrak, input_rarity, name, tradeup_price):
    """
    This route allows authenticated users to create a tradeup that can be purchased. Purchasable tradeups have a price.

    Request JSON body:
    {
        "stattrak": bool,                    # Indicates if the tradeup is for stattrak skins
        "input_rarity": str,                 # Rarity of the input skins (e.g., "milspec_bg")
        "input_entries": [                  # List of input entries
            {
                "skin_name": str,            # Name of the skin (e.g., "AK-47 | Redline")
                "skin_condition": str,       # Condition of the skin (e.g., "Factory New")
                "float": float,              # Float value of the skin (0 to 1)
                "count": int,                # Number of skins of this type
                "collection_id": int         # Collection ID for the skin
            }
        ]
        "name": str,                        # Optional name for the tradeup
        "price": float                      # Price of the tradeup (mandatory for purchasable tradeups)
    }

    Returns:
        JSON response with tradeup ID and name on success or an error message and code on failure.
    """
    tradeup_type = TradeupType.PURCHASABLE

    # get tradeup output entries
    output_entries_dict = calculate_output_entries(input_entries, stattrak, input_rarity, get_entries_price=False, get_entries_image=False)

    error_msg, error_code = _tradeup_input_checks(stattrak, input_rarity, input_entries, output_entries_dict, tradeup_type, tradeup_price)
    if error_msg:
        logger.error(error_msg)
        return jsonify({'error': error_msg}), error_code
    
    tradeup, error_msg, error_code = create_tradeup(stattrak, input_rarity, input_entries, output_entries_dict, name, tradeup_type, tradeup_price)
    if not tradeup:
        logger.error(error_msg)
        return jsonify({"error": error_msg}), error_code
    else:
        return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201
    
@bp_insert.route('/tradeups/create_private', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().id)
@use_kwargs(TradeupInputSchema())
def create_tradeup_private(input_entries, stattrak, input_rarity, name):
    """
    This route allows authenticated users to create a private tradeup. Private tradeups are only visible to the user who created them.

    Request JSON body:
    {
        "stattrak": bool,                    # Indicates if the tradeup is for stattrak skins
        "input_rarity": str,                 # Rarity of the input skins (e.g., "milspec_bg")
        "input_entries": [                  # List of input entries
            {
                "skin_name": str,            # Name of the skin (e.g., "AK-47 | Redline")
                "skin_condition": str,       # Condition of the skin (e.g., "Factory New")
                "float": float,              # Float value of the skin (0 to 1)
                "count": int,                # Number of skins of this type
                "collection_id": int         # Collection ID for the skin
            }
        ]
        "name": str,                        # Optional name for the tradeup
    }

    Returns:
        JSON response with tradeup ID and name on success or an error message and code on failure.
    """
    tradeup_type = TradeupType.PRIVATE

    # get tradeup output entries
    output_entries_dict = calculate_output_entries(input_entries, stattrak, input_rarity, get_entries_price=False, get_entries_image=False)

    error_msg, error_code = _tradeup_input_checks(stattrak, input_rarity, input_entries, output_entries_dict, tradeup_type)
    if error_msg:
        logger.error(error_msg)
        return jsonify({'error': error_msg}), error_code
    
    tradeup, error_msg, error_code = create_tradeup(stattrak, input_rarity, input_entries, output_entries_dict, name, tradeup_type)
    if not tradeup:
        logger.error(error_msg)
        return jsonify({"error": error_msg}), error_code
    
    track_tradeup(tradeup.id)
    return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201


def create_tradeup(tradeup_isstattrak, tradeup_input_rarity, input_entries_dict, output_entries_dict, tradeup_name, tradeup_type, tradeup_price=None):
    """
    Creates a tradeup entry.

    This function creates a tradeup, validates its input and output entries, and stores it in the database.

    Args:
        tradeup_isstattrak (bool): Whether the tradeup is for StatTrak items.
        tradeup_input_rarity (str): The rarity of the input items.
        input_entries_dict (list[dict]): List of input entries with details.
        output_entries_dict (list[dict]): List of output entries with details.
        tradeup_name (str, optional): Name of the tradeup.
        tradeup_price (float, optional): Price of the tradeup (applicable for purchasable tradeups).
        tradeup_type (TradeupType): Type of the tradeup (PUBLIC, PURCHASABLE, PRIVATE).

    Returns:
        tuple: (tradeup, error_msg, error_code)
            - tradeup: The created Tradeup object if successful.
            - error_msg: Error message if not successful.
            - error_code: HTTP error code if not successful.
    """
    
    tradeup = Tradeup(tradeup_isstattrak, tradeup_input_rarity, tradeup_type, name=tradeup_name, price=tradeup_price)
    input_entries, output_entries = [], []
    tradeup_collection_ids = set()
    
    # at this point we know len(tradeup_entries) > 0
    for tradeup_entry in input_entries_dict:
        weapon_paint = tradeup_entry.get("skin_name")
        condition = tradeup_entry.get("skin_condition")
        skin_float = tradeup_entry.get("skin_float")
        count = tradeup_entry.get("count")
        collection_id = tradeup_entry.get("collection_id")
        
        # check all required parameters were given
        if None in [weapon_paint, condition, skin_float, count, collection_id]:
            error = "Didn't receive all required parameters in tradeup input entry"
            return None, error, 400

        tradeup_collection_ids.add(collection_id)
        
        skin_condition_id, error = _input_entry_check(weapon_paint, tradeup_isstattrak, tradeup_input_rarity, condition, skin_float)
        if skin_condition_id:
            input_entries.append(InputTradeupEntry(skin_condition_id, skin_float, count, None))
        else:
            return None, error, 400

    for tradeup_entry in output_entries_dict:
        weapon_paint = tradeup_entry["skin_name"]
        condition = tradeup_entry["skin_condition"]
        skin_float = tradeup_entry["skin_float"]
        prob = tradeup_entry["prob"]
        
        skin_condition_id, error = _output_entry_check(weapon_paint, tradeup_isstattrak, tradeup_input_rarity, condition, skin_float)
        if skin_condition_id:
            output_entries.append(OutputTradeupEntry(skin_condition_id, skin_float, prob, None))
        else:
            return None, error, 400
        
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
        
    return tradeup, None, None

def _tradeup_input_checks(is_stattrak, input_rarity, input_entries_dict, output_entries_dict, tradeup_type: TradeupType, tradeup_price=None):
    """
    Validate input parameters for a tradeup.

    This function checks if all required parameters are provided and if they meet the criteria for creating a tradeup.

    Args:
        is_stattrak (bool): Whether the tradeup is for StatTrak items.
        input_rarity (str): The rarity of the input items.
        input_entries_dict (list[dict]): List of input entries with details.
        output_entries_dict (list[dict]): List of output entries with details.
        tradeup_price (float, optional): Price of the tradeup.
        tradeup_type (TradeupType): Type of the tradeup (PUBLIC, PURCHASABLE, PRIVATE).

    Returns:
        tuple: (json_error, error_code)
            - json_error: JSON error message if validation fails.
            - error_code: HTTP error code if validation fails.
            - None: If validation is successful.
    """
    if None in [is_stattrak, input_rarity, input_entries_dict, output_entries_dict]:
        return "Didn't receive all required parameters in tradeup", 400
    
    # Validate total count of all entries
    total_count = sum(entry["count"] for entry in input_entries_dict)
    if total_count != 10:
        return "The total count of all entries must be 10", 400
    
    # Check permissions
    if tradeup_type in [TradeupType.PUBLIC, TradeupType.PURCHASABLE] and token_auth.current_user().is_user():
        return "Only administrators can create public or purchasable tradeups", 400

    if tradeup_type == TradeupType.PUBLIC and tradeup_price:
        return "Public tradeup can't have price", 400
    if tradeup_type == TradeupType.PURCHASABLE and not tradeup_price:
        return "Purchasable tradeup must have price", 400
    
    if len(input_entries_dict) == 0:
        return f"Tradeup entries array is empty", 400
    
    return None, None

def _input_entry_check(weapon_paint, tradeup_isstattrak, tradeup_input_rarity, condition, skin_float):
    """
    Validates an input entry for a tradeup.
    This function checks if the provided input entry details are valid by matching them against the available skins in the database.

    Args:
        weapon_paint (str): Name of the skin (e.g., "AK-47 | Redline").
        tradeup_isstattrak (bool): Indicates if the tradeup is for StatTrak™ items.
        tradeup_input_rarity (str): The rarity of the input items (e.g., "milspec_bg").
        condition (str): Condition of the skin (e.g., "Factory New").
        skin_float (float): Float value of the skin (0 to 1).

    Returns:
        tuple: (skin_condition_id, error_message)
            - skin_condition_id: ID of the skin condition if valid.
            - error_message: Error message if validation fails.
    """

    # returns array of tuples (min_float, max_float, quality, stattrak)
    matching_skins = get_skins_by_name(weapon_paint)

    if len(matching_skins) == 0:
        # no results, so skin with weapon_paint as name doesnt exist
        return None, f"Invalid weapon_paint for '{weapon_paint}'"
    #if not any([res[3] == tradeup_isstattrak for res in matching_skins]):
        # tradeup_isstattrak implies stattrak_available
        # there isn't a result on this skin with the given stattrak status
        # (a stattrak skin was requested for a skin which doesn't have stattrak)
    #    return None, f"Weapon_paint {weapon_paint} doesn't have given stattrak status"
    # float in bounds check
    if matching_skins[0][0] > skin_float or matching_skins[0][1] < skin_float:
        return None, f"Weapon_paint {weapon_paint} with float {skin_float} is not valid"
    # [0] because we know len(results) > 0, and [2] because quality is at index 2
    if tradeup_input_rarity != matching_skins[0][2]:
        return None, "Tradeup Input rarity doesn't match rarity of input entry"
    
    skin_condition_id = get_skin_condition_id(weapon_paint, condition, tradeup_isstattrak)
    
    if skin_condition_id is None:
        return None, f"Invalid weapon_paint or condition for {weapon_paint}, {condition}"

    return skin_condition_id, None

def _output_entry_check(weapon_paint, tradeup_isstattrak, tradeup_input_rarity, condition, skin_float):
    """
    Validates an output entry for a tradeup.

    This function checks if the provided output entry details are valid by matching them against the available skins in the database.

    Args:
        weapon_paint (str): Name of the skin (e.g., "M4A4 | Howl").
        tradeup_isstattrak (bool): Indicates if the tradeup is for StatTrak™ items.
        tradeup_input_rarity (str): The rarity of the input items (e.g., "milspec_bg").
        condition (str): Condition of the skin (e.g., "Minimal Wear").
        skin_float (float): Float value of the skin (0 to 1).

    Returns:
        tuple: (skin_condition_id, error_message)
            - skin_condition_id: ID of the skin condition if valid.
            - error_message: Error message if validation fails.
    """
    matching_skins = get_skins_by_name(weapon_paint)

    if len(matching_skins) == 0:
        # no results, so skin with weapon_paint as name doesnt exist
        return None, f"Invalid weapon_paint for '{weapon_paint}'"
    #if not any([res[3] == tradeup_isstattrak for res in matching_skins]):
    #    # there isn't a result on this skin with the given stattrak status
    #    # (a stattrak skin was requested for a skin which doesn't have stattrak)
    #    return None, f"Weapon_paint {weapon_paint} doesn't have given stattrak status"
    # float in bounds check
    if matching_skins[0][0] > skin_float or matching_skins[0][1] < skin_float:
        return None, f"Weapon_paint {weapon_paint} with float {skin_float} is not valid"
    # [0] because we know len(results) > 0, and [2] because quality is at index 2
    if Tradeup.get_output_quality(tradeup_input_rarity) != matching_skins[0][2]:
        return None, "Tradeup Output rarity doesn't match rarity of output entry"
    
    skin_condition_id = get_skin_condition_id(weapon_paint, condition, tradeup_isstattrak)
    
    if skin_condition_id is None:
        return None, f"Invalid weapon_paint or condition for {weapon_paint}, {condition}"

    return skin_condition_id, None

@bp_insert.route('/tradeups/<int:tradeup_id>/purchase', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("60 per minute", key_func = lambda : token_auth.current_user().id)
def purchase_tradeup(tradeup_id):
    """
    This route allows an authenticated user to purchase a tradeup, adding it to their list of purchased tradeups.

    Args:
        tradeup_id (int): The ID of the tradeup to purchase.

    Returns:
        JSON response with a success message and user ID on success, or an error message and code on failure.
    """
    if tradeup_id is None:
        return jsonify({"error": "Must receive tradeup id"}), 400
    
    # get tradeup with given id
    tradeup = Tradeup.query.filter(Tradeup.id == tradeup_id).first()
    if tradeup is None:
        return jsonify({"error": "No tradeup with given id"}), 400
    
    if tradeup.tradeup_type != TradeupType.PURCHASABLE:
        return jsonify({"error": "Tradeup with given ID is not purchasable"}), 400
    
    if tradeup in token_auth.current_user().tradeups_purchased:
        return jsonify({"error": "User already purchased tradeup"}), 400
    
    # add tradeup to current user
    token_auth.current_user().tradeups_purchased.append(tradeup)

    # persist changes in database
    db.session.commit()

    return jsonify({"message": "Tradeup purchased successfully", "user_id": token_auth.current_user().id}), 200


@bp_insert.route('/tradeups/<int:tradeup_id>/track', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().id)
def track_tradeup(tradeup_id):
    """
    This route allows an authenticated user to track a tradeup, adding it to their list of tracked tradeups.

    Args:
        tradeup_id (int): The ID of the tradeup to track.

    Returns:
        JSON response with a success message and user ID on success, or an error message and code on failure.
    """
    if tradeup_id is None:
        return jsonify({"error": "Must receive tradeup id"}), 400
    
    # get tradeup with given id
    tradeup = Tradeup.query.filter(Tradeup.id == tradeup_id).first()
    if tradeup is None:
        return jsonify({"error": "No tradeup with given id"}), 400
    
    if tradeup in token_auth.current_user().tracked_tradeups:
        return jsonify({"error": "User already tracked the given tradeup"}), 400
    
    # add tradeup to current user
    token_auth.current_user().tracked_tradeups.append(tradeup)

    # persist changes in database
    db.session.commit()

    return jsonify({"message": "Tradeup tracked successfully", "user_id": token_auth.current_user().id}), 200
