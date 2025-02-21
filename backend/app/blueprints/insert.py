from flask import Blueprint, jsonify, current_app, abort
from backend.app.models import Tradeup, InputTradeupEntry, OutputTradeupEntry, TradeupType, db
from ..schemas import TradeupInputSchema, PurchasableTradeupInputSchema
from backend.src.tradeups import calculate_output_entries
from backend.app.limiter import limiter
from backend.app.auth import admin_required
from webargs.flaskparser import use_kwargs
from typing import List
from backend.app.error_handlers import NoPermissionError

from backend.app.auth import token_auth
from apifairy import authenticate # restrict function access to authenticated users

bp_insert = Blueprint('bp_insert', __name__)

@bp_insert.route('/tradeups/create_public', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@admin_required
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
@use_kwargs(TradeupInputSchema())
def create_tradeup_public(input_entries, stattrak, input_rarity, name, release_date):
    """
    Create a public tradeup. Public tradeups are visible to all users.
    """
    user = token_auth.current_user()
    current_app.logger.info("User %s initiated creation of a PUBLIC tradeup", user.steam_id)
    tradeup_type = TradeupType.PUBLIC

    # get tradeup output entries
    output_entries = calculate_output_entries(input_entries, stattrak, input_rarity)
    current_app.logger.info("Calculated output entries for PUBLIC tradeup for user %s", user.steam_id)

    _tradeup_input_checks(input_entries, tradeup_type)
    
    tradeup = create_tradeup(stattrak, input_rarity, input_entries, output_entries, name, tradeup_type, release_date)
    current_app.logger.info("PUBLIC tradeup created with id %s for user %s", tradeup.id, user.steam_id)
    return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201
    
@bp_insert.route('/tradeups/create_purchasable', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@admin_required
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
@use_kwargs(PurchasableTradeupInputSchema())
def create_tradeup_purchasable(input_entries, stattrak, input_rarity, name, price, release_date):
    """
    Create a purchasable tradeup. Purchasable tradeups have a price.
    """
    user = token_auth.current_user()
    current_app.logger.info("User %s initiated creation of a PURCHASABLE tradeup", user.steam_id)
    tradeup_type = TradeupType.PURCHASABLE

    # get tradeup output entries
    output_entries = calculate_output_entries(input_entries, stattrak, input_rarity)
    current_app.logger.info("Calculated output entries for PURCHASABLE tradeup for user %s", user.steam_id)

    _tradeup_input_checks(input_entries, tradeup_type, price)
    
    tradeup = create_tradeup(stattrak, input_rarity, input_entries, output_entries, name, tradeup_type, release_date, price)
    current_app.logger.info("PURCHASABLE tradeup created with id %s for user %s", tradeup.id, user.steam_id)
    return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201
    
@bp_insert.route('/tradeups/create_private', methods=['POST'])
@authenticate(token_auth) # Ensure only authenticated users can access this route
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
@use_kwargs(TradeupInputSchema())
def create_tradeup_private(input_entries, stattrak, input_rarity, name, release_date):
    """
    Create a private tradeup. Private tradeups are only visible to the creator.
    """
    user = token_auth.current_user()
    current_app.logger.info("User %s initiated creation of a PRIVATE tradeup", user.steam_id)
    tradeup_type = TradeupType.PRIVATE

    # get tradeup output entries
    output_entries = calculate_output_entries(input_entries, stattrak, input_rarity)
    current_app.logger.info("Calculated output entries for PRIVATE tradeup for user %s", user.steam_id)

    _tradeup_input_checks(input_entries, tradeup_type)
    
    tradeup = create_tradeup(stattrak, input_rarity, input_entries, output_entries, name, tradeup_type, release_date)
    
    current_app.logger.info("PRIVATE tradeup created with id %s for user %s", tradeup.id, user.steam_id)
    track_tradeup(tradeup.id)
    return jsonify({"tradeup_id": tradeup.id, "name": tradeup.name}), 201


def create_tradeup(tradeup_isstattrak, tradeup_input_rarity, input_entries: List[InputTradeupEntry], output_entries: List[OutputTradeupEntry], tradeup_name, tradeup_type, release_date, tradeup_price=None):
    """
    Create and persist a tradeup entry in the database.
    """
    user = token_auth.current_user()
    current_app.logger.info("Creating tradeup for user %s", user.steam_id)
    
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
    try:
        db.session.add(tradeup)
        db.session.commit()
        current_app.logger.info("Tradeup created with id %s for user %s", tradeup.id, user.steam_id)
        return tradeup
    except Exception as e:
        current_app.logger.error("Database error while creating tradeup for user %s: %s", user.steam_id, str(e), exc_info=True)
        db.session.rollback()
        abort(500, "Failed to create tradeup")

def _tradeup_input_checks(input_entries, tradeup_type: TradeupType, tradeup_price=None):
    """
    Validate input parameters for a tradeup.
    """
    
    # Validate total count of all entries
    total_count = sum(entry.count for entry in input_entries)
    if total_count != 10:
        current_app.logger.error("The total count of all entries must be 10")
        abort(400, "The total count of all entries must be 10")
    
    # Check permissions
    if tradeup_type in [TradeupType.PUBLIC, TradeupType.PURCHASABLE] and token_auth.current_user().is_user():
        current_app.logger.error("Only administrators can create public or purchasable tradeups")
        raise NoPermissionError("Only administrators can create public or purchasable tradeups")

    if tradeup_type == TradeupType.PUBLIC and tradeup_price:
        current_app.logger.error("Public tradeup can't have price")
        abort(400, "Public tradeup can't have price")

    if tradeup_type == TradeupType.PURCHASABLE and not tradeup_price:
        current_app.logger.error("Purchasable tradeup must have price")
        abort(400, "Purchasable tradeup must have price")
    
    if len(input_entries) == 0:
        current_app.logger.error("There are no tradeup input entries")
        abort(400, "There are no tradeup input entries")

@bp_insert.route('/tradeups/<int:tradeup_id>/purchase', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("60 per minute", key_func = lambda : token_auth.current_user().steam_id)
def purchase_tradeup(tradeup_id):
    """
    Allow an authenticated user to purchase a tradeup.
    """
    user = token_auth.current_user()
    current_app.logger.info("User %s attempting to purchase tradeup %s", user.steam_id, tradeup_id)
    if tradeup_id is None:
        current_app.logger.error("Purchase request missing tradeup id for user %s", user.steam_id)
        abort(400, "Must receive tradeup id")
    
    # get tradeup with given id
    tradeup = Tradeup.query.filter(Tradeup.id == tradeup_id).first()
    if tradeup is None:
        current_app.logger.error("No tradeup found with id %s for purchase by user %s", tradeup_id, user.steam_id)
        abort(400, "No tradeup with given id")
    
    if tradeup.tradeup_type != TradeupType.PURCHASABLE:
        current_app.logger.error("Tradeup %s is not purchasable. User %s attempted to purchase", tradeup_id, user.steam_id)
        abort(400, "Tradeup with given ID is not purchasable")
    
    if tradeup in token_auth.current_user().tradeups_purchased:
        current_app.logger.error("User %s already purchased tradeup %s", user.steam_id, tradeup_id)
        abort(400, "User already purchased tradeup")
    
    # add tradeup to current user
    user.tradeups_purchased.append(tradeup)

    # persist changes in database
    try:
        db.session.commit()
        current_app.logger.info("User %s successfully purchased tradeup %s", user.steam_id, tradeup_id)
        return jsonify({"message": "Tradeup purchased successfully", "user_id": user.steam_id}), 200
    except Exception as e:
        current_app.logger.error("Database error during tradeup purchase by user %s: %s", user.steam_id, str(e), exc_info=True)
        db.session.rollback()
        abort(500, "Failed to purchase tradeup")

@bp_insert.route('/tradeups/<int:tradeup_id>/track', methods=['POST'])
@authenticate(token_auth)
@limiter.limit("20 per minute", key_func = lambda : token_auth.current_user().steam_id)
def track_tradeup(tradeup_id):
    """
    Allow an authenticated user to track a tradeup.
    """
    user = token_auth.current_user()
    current_app.logger.info("User %s attempting to track tradeup %s", user.steam_id, tradeup_id)
    if tradeup_id is None:
        current_app.logger.error("Track request missing tradeup id for user %s", user.steam_id)
        abort(400, "Must receive tradeup id")
    
    # get tradeup with given id
    tradeup = Tradeup.query.filter(Tradeup.id == tradeup_id).first()
    if tradeup is None:
        current_app.logger.error("No tradeup found with id %s for tracking by user %s", tradeup_id, user.steam_id)
        abort(400, "No tradeup with given id")
    
    if tradeup in token_auth.current_user().tracked_tradeups:
        current_app.logger.error("User %s already tracking tradeup %s", user.steam_id, tradeup_id)
        abort(400, "User already tracked the given tradeup")
    
    # add tradeup to current user
    user.tracked_tradeups.append(tradeup)

    # persist changes in database
    try:
        db.session.commit()
        current_app.logger.info("User %s successfully tracked tradeup %s", user.steam_id, tradeup_id)
        return jsonify({"message": "Tradeup tracked successfully", "user_id": user.steam_id}), 200
    except Exception as e:
        current_app.logger.error("Database error during tradeup tracking by user %s: %s", user.steam_id, str(e), exc_info=True)
        db.session.rollback()
        abort(500, "Failed to track tradeup")