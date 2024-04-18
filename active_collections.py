from solver_entities import Skin, TradeUpPool, Collection

# Collection Inferno 2018 Mil-spec
def load_collection_1():
    # input skins definition
    skin_input1 = Skin("SSG 08 | Hand Brake", 0, 1, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("M4A4 | Converter", 0, 0.4, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("Sawed-Off | Brake Light", 0, 0.08, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input4 = Skin("USP-S | Check Engine", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("AK-47 | Safety Net", 0, 0.6, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo
    skin_output2 = Skin("MP7 | Fade", 0, 0.25, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo
    skin_output3 = Skin("P250 | Vino Primo", 0, 1, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Inferno 2018")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    collection_1.add_input_skin(skin_input4)
    # add output skins
    collection_1.add_output_skin(skin_output1)
    collection_1.add_output_skin(skin_output2)
    collection_1.add_output_skin(skin_output3)

    return collection_1

# Collection Nuke 2018 Mil-spec
def load_collection_2():
    # input skins definition
    skin_input1 = Skin("P90 | Facility Negative", 0, 0.5, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("P250 | Exchanger", 0, 0.5, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("MP5-SD | Co-Processor", 0, 0.5, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input4 = Skin("AWP | Acheron", 0, 0.83, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("AUG | Random Access", 0, 0.5, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo
    skin_output2 = Skin("Glock-18 | Nuclear Garden", 0, 0.7, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo
    skin_output3 = Skin("MAG-7 | Core Breach", 0, 1, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Nuke 2018")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    collection_1.add_input_skin(skin_input4)
    # add output skins
    collection_1.add_output_skin(skin_output1)
    collection_1.add_output_skin(skin_output2)
    collection_1.add_output_skin(skin_output3)

    return collection_1

# Collection Bank Mil-spec
def load_collection_3():
    # input skins definition
    skin_input1 = Skin("CZ75-Auto | Tuxedo", 0, 0.8, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("Galil AR | Tuxedo", 0, 0.8, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("Desert Eagle | Meteorite", 0, 0.18, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("AK-47 | Emerald Pinstripe", 0, 1, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Bank")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    return collection_1

# Collection Dust 2 Mil-spec
def load_collection_4():
    # input skins definition
    skin_input1 = Skin("PP-Bizon | Brass", 0, 1, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("SG 553 | Damascus Steel", 0, 1, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("M4A1-S | VariCamo", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("P2000 | Amber Fade", 0, 0.4, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Dust 2")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    return collection_1

# Collection Italy Mil-spec
def load_collection_5():
    # input skins definition
    skin_input1 = Skin("Glock-18 | Candy Apple", 0, 0.3, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("Sawed-Off | Full Stop", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("MP7 | Anodized Navy", 0, 0.08, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("AWP | Pit Viper", 0.08, 0.5, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Italy")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    return collection_1

# Collection Lake Mil-spec
def load_collection_6():
    # input skins definition
    skin_input1 = Skin("USP-S | Night Ops", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("P90 | Teardown", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("SG 553 | Anodized Navy", 0, 0.08, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("Dual Berettas | Cobalt Quartz", 0, 0.4, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Lake")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    return collection_1

# Collection Safehouse Mil-spec
def load_collection_7():
    # input skins definition
    skin_input1 = Skin("SSG 08 | Acid Fade", 0, 0.03, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("FAMAS | Teardown", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("Five-SeveN | Silver Quartz", 0, 0.4, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("M4A1-S | Nitro", 0.06, 0.8, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Safehouse")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    return collection_1

# Collection Train Mil-spec
def load_collection_8():
    # input skins definition
    skin_input1 = Skin("Desert Eagle | Urban Rubble", 0, 0.5, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("Sawed-Off | Amber Fade", 0, 0.4, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("Tec-9 | Red Quartz", 0, 0.4, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Train")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    return collection_1

def load_active_milspec_tradeup():
    # load collection
    collection_1 = load_collection_1()
    collection_2 = load_collection_2()
    collection_3 = load_collection_3()
    collection_4 = load_collection_4()
    collection_5 = load_collection_5()
    collection_6 = load_collection_6()
    collection_7 = load_collection_7()
    collection_8 = load_collection_8()
    
    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    trade_up_pool.add_collection(collection_2)
    trade_up_pool.add_collection(collection_3)
    trade_up_pool.add_collection(collection_4)
    trade_up_pool.add_collection(collection_5)
    trade_up_pool.add_collection(collection_6)
    trade_up_pool.add_collection(collection_7)
    trade_up_pool.add_collection(collection_8)
    return trade_up_pool