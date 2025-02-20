from flask import Blueprint, jsonify
from backend.app.database import get_skin_condition, get_skins_by_name
from backend.app.models import Tradeup, InputTradeupEntry, OutputTradeupEntry, TradeupType, db
import logging
from ..schemas import TradeupInputSchema, PurchasableTradeupInputSchema
from backend.src.tradeups import calculate_output_entries
from backend.app.limiter import limiter
from webargs.flaskparser import use_kwargs
from typing import List

from backend.app.auth import token_auth
from apifairy import authenticate # restrict function access to authenticated users

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

bp_insert = Blueprint('bp_insert', __name__)

@bp_insert.route('/tradeups/create_public', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
@use_kwargs(TradeupInputSchema())
def create_tradeup_public(input_entries, stattrak, input_rarity, name, release_date):
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
        release_date: datetime               # Optional release date for the tradeup
    }
    
    Returns:
        JSON response with tradeup ID and name on success or an error message and code on failure.
    """
    tradeup_type = TradeupType.PUBLIC

    # get tradeup output entries
    output_entries = calculate_output_entries(input_entries, stattrak, input_rarity)

    error_msg, error_code = _tradeup_input_checks(input_entries, tradeup_type)
    if error_msg:
        logger.error(error_msg)
        return jsonify({'error': error_msg}), error_code
    
    tradeup, error_msg, error_code = create_tradeup(stattrak, input_rarity, input_entries, output_entries, name, tradeup_type, release_date)
    if not tradeup:
        logger.error(error_msg)
        return jsonify({"error": error_msg}), error_code
    else:
        return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201
    
@bp_insert.route('/tradeups/create_purchasable', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
@use_kwargs(PurchasableTradeupInputSchema())
def create_tradeup_purchasable(input_entries, stattrak, input_rarity, name, price, release_date):
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
    output_entries = calculate_output_entries(input_entries, stattrak, input_rarity)

    error_msg, error_code = _tradeup_input_checks(input_entries, tradeup_type, price)
    if error_msg:
        logger.error(error_msg)
        return jsonify({'error': error_msg}), error_code
    
    tradeup, error_msg, error_code = create_tradeup(stattrak, input_rarity, input_entries, output_entries, name, tradeup_type, release_date, price)
    if not tradeup:
        logger.error(error_msg)
        return jsonify({"error": error_msg}), error_code
    else:
        return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201
    
@bp_insert.route('/tradeups/create_private', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
@use_kwargs(TradeupInputSchema())
def create_tradeup_private(input_entries, stattrak, input_rarity, name, release_date):
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
    output_entries_dict = calculate_output_entries(input_entries, stattrak, input_rarity)

    error_msg, error_code = _tradeup_input_checks(input_entries, tradeup_type)
    if error_msg:
        logger.error(error_msg)
        return jsonify({'error': error_msg}), error_code
    
    tradeup, error_msg, error_code = create_tradeup(stattrak, input_rarity, input_entries, output_entries_dict, name, tradeup_type, release_date)
    if not tradeup:
        logger.error(error_msg)
        return jsonify({"error": error_msg}), error_code
    
    track_tradeup(tradeup.id)
    return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201


def create_tradeup(tradeup_isstattrak, tradeup_input_rarity, input_entries: List[InputTradeupEntry], output_entries: List[OutputTradeupEntry], tradeup_name, tradeup_type, release_date, tradeup_price=None):
    """
    Creates a tradeup entry.

    This function creates a tradeup, validates its input and output entries, and stores it in the database.

    Args:
        tradeup_isstattrak (bool): Whether the tradeup is for StatTrak items.
        tradeup_input_rarity (str): The rarity of the input items.
        input_entries
        output_entries
        tradeup_name (str, optional): Name of the tradeup.
        tradeup_price (float, optional): Price of the tradeup (applicable for purchasable tradeups).
        tradeup_type (TradeupType): Type of the tradeup (PUBLIC, PURCHASABLE, PRIVATE).

    Returns:
        tuple: (tradeup, error_msg, error_code)
            - tradeup: The created Tradeup object if successful.
            - error_msg: Error message if not successful.
            - error_code: HTTP error code if not successful.
    """
    
    tradeup = Tradeup(stattrak=tradeup_isstattrak, input_rarity=tradeup_input_rarity, tradeup_type=tradeup_type, name=tradeup_name, price=tradeup_price, release_date=release_date)
    collections = []
    
    # gather all the collection IDs for the tradeup
    for entry in input_entries:
        collection = entry.skin_condition.skin.collection
        collections.append(collection)

    # associate input and output entries with the tradeup
    tradeup.input_entries = input_entries
    tradeup.output_entries = output_entries
    tradeup.collections = collections

    # add the complete tradeup object to the session.
    # All associated input/output entries and collection associations will be persisted.
    db.session.add(tradeup)
    db.session.commit()
        
    return tradeup, None, None

def _tradeup_input_checks(input_entries, tradeup_type: TradeupType, tradeup_price=None):
    """
    Validate input parameters for a tradeup.

    This function checks if all required parameters are provided and if they meet the criteria for creating a tradeup.

    Args:
        is_stattrak (bool): Whether the tradeup is for StatTrak items.
        input_rarity (str): The rarity of the input items.
        input_entries : List of input entries with details.
        tradeup_price (float, optional): Price of the tradeup.
        tradeup_type (TradeupType): Type of the tradeup (PUBLIC, PURCHASABLE, PRIVATE).

    Returns:
        tuple: (json_error, error_code)
            - json_error: JSON error message if validation fails.
            - error_code: HTTP error code if validation fails.
            - None: If validation is successful.
    """
    
    # Validate total count of all entries
    total_count = sum(entry.count for entry in input_entries)
    if total_count != 10:
        return "The total count of all entries must be 10", 400
    
    # Check permissions
    if tradeup_type in [TradeupType.PUBLIC, TradeupType.PURCHASABLE] and token_auth.current_user().is_user():
        return "Only administrators can create public or purchasable tradeups", 400

    if tradeup_type == TradeupType.PUBLIC and tradeup_price:
        return "Public tradeup can't have price", 400
    if tradeup_type == TradeupType.PURCHASABLE and not tradeup_price:
        return "Purchasable tradeup must have price", 400
    
    if len(input_entries) == 0:
        return f"Tradeup entries array is empty", 400
    
    return None, None

@bp_insert.route('/tradeups/<int:tradeup_id>/purchase', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("60 per minute", key_func = lambda : token_auth.current_user().steam_id)
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

    return jsonify({"message": "Tradeup purchased successfully", "user_id": token_auth.current_user().steam_id}), 200


@bp_insert.route('/tradeups/<int:tradeup_id>/track', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
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

    return jsonify({"message": "Tradeup tracked successfully", "user_id": token_auth.current_user().steam_id}), 200
