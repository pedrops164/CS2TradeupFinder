""" Utilty functions module """
from backend.app.models import Tradeup, InputTradeupEntry, OutputTradeupEntry
from typing import List, TypedDict
from backend.app.types import InputEntryDict, OutputEntryDict, LongTradeupDict, PurchasableTradeupDict
from backend.app.database import get_skin_price, get_skin_image_url
from backend.src.tradeups import calculate_tradeup_stats

def get_input_entry_dict(input_entry: InputTradeupEntry) -> InputEntryDict:
    skin_condition = input_entry.skin_condition
    skin = skin_condition.skin
    skin_price = get_skin_price(skin.name, skin_condition.condition, skin_condition.stattrak)
    skin_condition_str = skin_condition.condition
    skin_name = skin.name
    image_url = get_skin_image_url(skin.name)

    entry_dict = {
        "count": input_entry.count,
        "skin_float": input_entry.skin_float,
        "price": skin_price,
        "skin_condition": skin_condition_str,
        "skin_name": skin_name
    }
    if image_url:
        entry_dict["image_url"] = image_url
    return entry_dict

def get_output_entry_dict(output_entry: OutputTradeupEntry) -> OutputEntryDict:
    skin_condition = output_entry.skin_condition
    skin = skin_condition.skin
    skin_price = get_skin_price(skin.name, skin_condition.condition, skin_condition.stattrak)
    skin_condition_str = skin_condition.condition
    skin_name = skin.name
    image_url = get_skin_image_url(skin.name)

    entry_dict = {
        "prob": output_entry.prob,
        "skin_float": output_entry.skin_float,
        "price": skin_price,
        "skin_condition": skin_condition_str,
        "skin_name": skin_name
    }
    if image_url:
        entry_dict["image_url"] = image_url
    return entry_dict

class OutputEntryDict(TypedDict):
    prob: float
    skin_float: float
    price: float
    skin_condition: str
    skin_name: str

def get_long_tradeup_dict(tradeup: Tradeup) -> LongTradeupDict:
    """Receives a Tradeup object and returns a dictionary containing all the information about the tradeup

    Args:
        tradeup (Tradeup): tradeup to extract all information

    Returns:
        LongTradeupDict: dictionary containing all the information
    """
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
    avg_input_float = tradeup.avg_input_float
    input_skins_cost = tradeup.input_skins_cost
    profit_avg = tradeup.avg_profitability
    profit_odds = tradeup.profit_odds

    #avg_input_float, input_skins_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries_dict, output_entries_dict, tradeup_stattrak)
    # add tradeup to the array of tradeups
    tradeup_dict: LongTradeupDict = {
        "tradeup_id": tradeup_id,
        "tradeup_name": tradeup_name,
        "input_entries": input_entries_dict,
        "output_entries": output_entries_dict,
        "collection_names": collection_names,
        "tradeup_input_rarity": tradeup_input_rarity,
        "tradeup_stattrak": tradeup_stattrak,
        "tradeup_price": tradeup.price,
        "avg_input_float": avg_input_float,
        "input_skins_cost": input_skins_cost,
        "profit_avg_pctg": profit_avg,
        "profit_odds": profit_odds,
    }
    return tradeup_dict

def set_tradeup_stats(tradeup: Tradeup):
    if not tradeup.input_entries or not tradeup.output_entries:
        tradeup.avg_input_float = None
        tradeup.input_skins_cost = None
        tradeup.avg_profitability = None
        tradeup.profit_odds = None
        raise ValueError("Tradeup has no input or output entries")
    
    input_entries_dict = [get_input_entry_dict(input_entry) for input_entry in tradeup.input_entries]
    output_entries_dict = [get_output_entry_dict(output_entry) for output_entry in tradeup.output_entries]
    avg_input_float, input_skins_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries_dict, output_entries_dict, tradeup.stattrak)
    tradeup.avg_input_float = avg_input_float
    tradeup.input_skins_cost = input_skins_cost
    tradeup.avg_profitability = profit_avg
    tradeup.profit_odds = profit_odds


def get_purchasable_tradeup_dict(tradeup: Tradeup) -> PurchasableTradeupDict:
    """Receives a Tradeup object and returns a dictionary containing relevant information about the tradeup, but not
    revealing the tradeup's content

    Args:
        tradeup (Tradeup): tradeup to extract relevant information

    Returns:
        PurchasableTradeupDict: dictionary containing the information
    """
    input_entries_dict: List[InputEntryDict] = []
    output_entries_dict: List[OutputEntryDict] = []
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

    # get tradeup stats
    _, input_skins_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries_dict, output_entries_dict, tradeup_stattrak)
    # add tradeup to the array of tradeups
    tradeup_dict: PurchasableTradeupDict = {
        "tradeup_id": tradeup_id,
        "tradeup_name": tradeup_name,
        "tradeup_input_rarity": tradeup_input_rarity,
        "tradeup_stattrak": tradeup_stattrak,
        "tradeup_price": tradeup.price,
        "input_skins_cost": input_skins_cost,
        "profit_avg_pctg": profit_avg,
        "profit_odds": profit_odds,
    }
    return tradeup_dict

def get_skin_conditions_array(min_float: float, max_float: float) -> list:
    # Define CS2 condition ranges as (name, lower bound, upper bound)
    conditions = [
        ("Factory New", 0.00, 0.07),
        ("Minimal Wear", 0.07, 0.15),
        ("Field-Tested", 0.15, 0.38),
        ("Well-Worn", 0.38, 0.45),
        ("Battle-Scarred", 0.45, 1.00)
    ]
    
    result = []
    for name, lower, upper in conditions:
        # Check if the condition range overlaps with the [min_float, max_float] range.
        # There is an overlap if the condition's upper bound is greater than min_float
        # and its lower bound is less than max_float.
        if upper > min_float and lower < max_float:
            result.append(name)
    
    return result