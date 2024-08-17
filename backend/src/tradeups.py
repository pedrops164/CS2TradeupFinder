#from .entities import TradeUpPool, Collection, Skin, 
from backend.src import entities
from backend.app.models import db, Collection, Skin, Tradeup, SkinCondition
from backend.app.database import get_skin_price
from sqlalchemy import func
from sqlalchemy.orm.exc import NoResultFound, MultipleResultsFound
from backend.app.types import InputEntryDict, OutputEntryDict
from typing import List

def create_tradeup_from_dataframe(df, input_rarity, stattrak: bool):
    """
    Creates a tradeup from a dataframe

    Args:
        df: Pandas dataframe grouped by collection id
    """

    trade_up_pool = entities.TradeUpPool()

    output_rarity = entities.TradeUpPool.get_output_quality(input_rarity)

    # Process each group separately
    for collection_id, group in df:
        # limit problem size
        #if collection_id > 40:
        #    break
        collection = entities.Collection(collection_id)
        # Perform processing on each group
        # For example, print the group
        input_skins = group[(group['quality'] == input_rarity) & (group['stattrak'] == stattrak)]
        output_skins = group[(group['quality'] == output_rarity) & (group['stattrak'] == stattrak)]

        input_skins_grouped = input_skins.groupby('skin_id')
        output_skins_grouped = output_skins.groupby('skin_id')

        # iterate through the input skins and add them to the collection
        for skin_id, skin_group in input_skins_grouped:
            # we assume each group has at least one row
            # we fetch the name, min_float, max_float, is_stattrak and the price dictionary from the skin_group dataframe
            skin_name = skin_group.iloc[0]['name']
            min_float = skin_group.iloc[0]['min_float']
            max_float = skin_group.iloc[0]['max_float']
            is_stattrak = skin_group.iloc[0]['stattrak']
            # define the price dict for each row there is in the skin group. Each row represents a different condition of the given skin
            price_dict = {row['condition']:row['price'] for _, row in skin_group.iterrows()}
            # define Skin object
            skin = entities.Skin(skin_name, min_float, max_float, price_dict, is_stattrak)
            # add input skin to Collection object
            collection.add_input_skin(skin)

        # iterate through the output skins and add them to the collection
        for skin_id, skin_group in output_skins_grouped:
            # we assume each group has at least one row
            # we fetch the name, min_float, max_float, is_stattrak and the price dictionary from the skin_group dataframe
            skin_name = skin_group.iloc[0]['name']
            min_float = skin_group.iloc[0]['min_float']
            max_float = skin_group.iloc[0]['max_float']
            is_stattrak = skin_group.iloc[0]['stattrak']
            # define the price dict for each row there is in the skin group. Each row represents a different condition of the given skin
            price_dict = {row['condition']:row['price'] for _, row in skin_group.iterrows()}
            # define Skin object
            skin = entities.Skin(skin_name, min_float, max_float, price_dict, is_stattrak)
            # add input skin to Collection object
            collection.add_output_skin(skin)
        trade_up_pool.add_collection(collection)

    return trade_up_pool

def calculate_output_entries(input_entries: List[InputEntryDict], stattrak: bool, rarity: str) -> List[OutputEntryDict]:
    """Receives the input entries of a tradeup, and calculates the output entries.
    We assume that the stattrak status and rarity received in the arguments are in accordance with the input entries.
    We assume the price of the input skins is correct

    Args:
        input_entries (list[dict]): has parameters: skin_name, skin_condition, float, count, collection_id
        stattrak (bool): whether the tradeup is stattrak
        rarity (str): possible rarities: ["consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg", "covert_bg"]. The last rarity isnt valid (doesnt have matching output rarity)
    """
    coll_to_dict = {}

    # initialize the input entries count to 0 for all collections of the tradeup
    for entry in input_entries:
        coll_to_dict[entry["collection_id"]] = {"input_count": 0}
        
    # add up the input entries count and correspond with each collection id
    for entry in input_entries:
        col_dict = coll_to_dict[entry["collection_id"]]
        col_dict["input_count"] += entry["count"]

    # get the rarity of the output skins (the rarity after the input rarity)
    output_rarity = Tradeup.get_output_quality(rarity)

    # rarity filter for the sql query
    output_rarity_filter = Skin.quality == output_rarity

    # get the ids of the collections of the tradeup
    tradeup_collections_ids = list(coll_to_dict.keys())

    # retrieve collection id, number of possible skin outputs, their names, min and max floats, for each collection in the tradeup
    results_output = db.session.query(
        Collection.id.label('coll_id'),
        func.count(Skin.id).label('output_count'),
        func.group_concat(Skin.name).label('output_skin_names'),
        func.group_concat(Skin.min_float).label('min_floats'),
        func.group_concat(Skin.max_float).label('max_floats')
    )\
    .filter(Collection.id == Skin.collection_id) \
    .filter(output_rarity_filter, Collection.id.in_(tradeup_collections_ids)) \
    .group_by(Collection.id).all()

    total_ballots = 0
    # calculate value of total ballots, which is the sum over all collections of the number of input entries multiplied by the number of possible output skins
    for result in results_output:
        col_dict = coll_to_dict[result.coll_id]
        col_dict["output_count"] = result.output_count
        col_dict["output_skin_names"] = result.output_skin_names.split(',')
        col_dict["min_floats"] = result.min_floats.split(',')
        col_dict["max_floats"] = result.max_floats.split(',')
        total_ballots += col_dict["output_count"] * col_dict["input_count"]

    # calculate the average float of the input skins
    average_float = sum([entry["count"]*entry["skin_float"] for entry in input_entries]) / 10

    # initialize list of output entries to return
    output_entries = []

    # iterate over the collections of the tradeup
    for (coll_id, coll_dict) in coll_to_dict.items():
        # iterate over the possible output skins of the tradeup
        for output_skin_name, min_float_str, max_float_str in zip(coll_dict["output_skin_names"], coll_dict["min_floats"], coll_dict["max_floats"]):
            # calculate float of resulting output skin
            output_float = ((float(max_float_str)-float(min_float_str)) * average_float) + float(min_float_str)
            # get the condition of the skin from the value of the float (for example 0.03 would give "Factory New")
            output_condition = Skin.get_float_str(output_float)
            # calculate probability of getting this output skin
            output_probability = (coll_dict["input_count"] / total_ballots) * 100
            skin_price = get_skin_price(output_skin_name, output_condition, stattrak)
            output_entry: OutputEntryDict = {
                "skin_float": output_float,
                "prob": output_probability,
                "skin_condition": output_condition,
                "skin_name": output_skin_name,
                "price": skin_price
            }
            output_entries.append(output_entry)

    return output_entries

def calculate_tradeup_stats(input_entries: List[InputEntryDict], output_entries: List[OutputEntryDict], stattrak: bool):
    
    # calculate average input float
    avg_input_float = sum([entry["count"]*entry["skin_float"] for entry in input_entries]) / 10

    # set up dictionary from (skin_name, skin_cond) to price
    skin_to_price_dict = {}

    # set up set of (skin_name, skin_cond) tuples, to avoid repetition when fetching prices
    skins_set = set()
    # add all distinct (skin_name, skin_condition) pairs to skins_set
    for entry in input_entries:
        skins_set.add((entry["skin_name"], entry["skin_condition"]))
    for entry in output_entries:
        skins_set.add((entry["skin_name"], entry["skin_condition"]))
    
    # iterate over skins_set, and fetch the prices from the database
    for (skin_name, skin_condition) in skins_set:
        result = db.session.query(
            SkinCondition.price.label("price")
        )\
        .filter(Skin.id == SkinCondition.skin_id)\
        .filter(Skin.name == skin_name)\
        .filter(SkinCondition.condition == skin_condition)\
        .filter(SkinCondition.stattrak == stattrak)\
        .one() # extract one record
        # might raise NoResultFound or MultipleResultsFound exceptions

        skin_price = result.price
        # correspond the skin to its price in the dictionary
        skin_to_price_dict[(skin_name, skin_condition)] = skin_price

    # calculate input cost
    input_skins_cost = 0
    for entry in input_entries:
        # fetch the skin price from the dictionary of skins to price
        skin_price = skin_to_price_dict[(entry["skin_name"], entry["skin_condition"])]
        # increase the total cost of the input skins
        input_skins_cost += skin_price * entry["count"]

    # calculate output cost
    avg_output_skins_cost = 0
    profit_odds = 0
    for entry in output_entries:
        # fetch the skin price from the dictionary of skins to price
        skin_price = skin_to_price_dict[(entry["skin_name"], entry["skin_condition"])]
        # increase the average return for this skin and add to total cost of the output skins
        avg_output_skins_cost += skin_price * entry["prob"]
        # if the price of this output skin is higher than the total input cost, then this skin gives profit
        if skin_price > input_skins_cost:
            # add the probability of the skin to the total profit odds
            profit_odds += entry["prob"]

    profit_avg = avg_output_skins_cost / input_skins_cost

    return avg_input_float, input_skins_cost, profit_avg, profit_odds