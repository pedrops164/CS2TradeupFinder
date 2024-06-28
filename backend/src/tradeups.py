from entities import Skin, TradeUpPool, Collection

def create_tradeup_from_dataframe(df, input_rarity, stattrak: bool):
    """
    Creates a tradeup from a dataframe

    Args:
        df: Pandas dataframe grouped by collection id
    """

    trade_up_pool = TradeUpPool()

    output_rarity = TradeUpPool.get_output_quality(input_rarity)

    # Process each group separately
    for collection_id, group in df:
        # limit problem size
        #if collection_id > 40:
        #    break
        collection = Collection(collection_id)
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
            skin = Skin(skin_name, min_float, max_float, price_dict, is_stattrak)
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
            skin = Skin(skin_name, min_float, max_float, price_dict, is_stattrak)
            # add input skin to Collection object
            collection.add_output_skin(skin)
        trade_up_pool.add_collection(collection)

    return trade_up_pool