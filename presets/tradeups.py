from solver_entities import Skin, TradeUpPool, Collection
from db import get_tradeup_dataframe
import pickle

def load_tradeup_1():
    # input skins definition
    skin_input1 = Skin("SCAR-20 | Jungle Slipstream", 0, 0.5, {"Factory New": 0.72, "Minimal Wear": 0.32, "Field-Tested": 0.17, "Well-Worn": 0.15, "Battle-Scarred": 0.28})
    skin_input2 = Skin("AUG | Triqua", 0, 1, {"Factory New": 2.71, "Minimal Wear": 0.43, "Field-Tested": 0.18, "Well-Worn": 0.13, "Battle-Scarred": 0.14})
    skin_input3 = Skin("G3SG1 | Hunter", 0, 1, {"Factory New": 1.22, "Minimal Wear": 0.32, "Field-Tested": 0.18, "Well-Worn": 0.11, "Battle-Scarred": 0.11})
    skin_input4 = Skin("Glock-18 | Off World", 0, 1, {"Factory New": 4.7, "Minimal Wear": 0.73, "Field-Tested": 0.37, "Well-Worn": 0.28, "Battle-Scarred": 0.28})
    skin_input5 = Skin("MAC-10 | Oceanic", 0, 0.6, {"Factory New": 0.78, "Minimal Wear": 0.41, "Field-Tested": 0.17, "Well-Worn": 0.2, "Battle-Scarred": 0.11})
    skin_input6 = Skin("Sawed-Off | Morris", 0, 1, {"Factory New": 0.95, "Minimal Wear": 0.33, "Field-Tested": 0.18, "Well-Worn": 0.11, "Battle-Scarred": 0.11})
    skin_input7 = Skin("Tec-9 | Cracked Opal", 0, 1, {"Factory New": 1.75, "Minimal Wear": 0.43, "Field-Tested": 0.18, "Well-Worn": 0.13, "Battle-Scarred": 0.13})

    # output skins definition
    skin_output1 = Skin("CZ75-Auto | Tacticat", 0, 0.7, {"Factory New": 3.82, "Minimal Wear": 2.13, "Field-Tested": 1.14, "Well-Worn": 1.08, "Battle-Scarred": 0.92}) # certo
    skin_output2 = Skin("XM1014 | Ziggy", 0, 0.72, {"Factory New": 4.23, "Minimal Wear": 2.15, "Field-Tested": 1.17, "Well-Worn": 1.75, "Battle-Scarred": 1.12}) # 2.15 -> 1.98
    skin_output3 = Skin("MP9 | Goo", 0, 0.6, {"Factory New": 4.78, "Minimal Wear": 2.15, "Field-Tested": 1.25, "Well-Worn": 1.43, "Battle-Scarred": 1.07}) # 4.78 -> 4.79
    skin_output4 = Skin("SG 553 | Phantom", 0, 0.6, {"Factory New": 4.04, "Minimal Wear": 1.79, "Field-Tested": 1.16, "Well-Worn": 0.96, "Battle-Scarred": 0.86}) # 4.04 -> 4.15
    skin_output5 = Skin("UMP-45 | Exposure", 0, 0.55, {"Factory New": 3.97, "Minimal Wear": 1.81, "Field-Tested": 1.33, "Well-Worn": 1.2, "Battle-Scarred": 0.87}) # 3.97 -> 3.95

    # Create a collection and add skins
    collection_1 = Collection("Collection 1")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    collection_1.add_input_skin(skin_input4)
    collection_1.add_input_skin(skin_input5)
    collection_1.add_input_skin(skin_input6)
    collection_1.add_input_skin(skin_input7)
    # add output skins
    collection_1.add_output_skin(skin_output1)
    collection_1.add_output_skin(skin_output2)
    collection_1.add_output_skin(skin_output3)
    collection_1.add_output_skin(skin_output4)
    collection_1.add_output_skin(skin_output5)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

def load_tradeup_2():
    # Create skins with min and max float, and prices for each condition
    skinX = Skin("SkinX", 0, 1, {"Factory New": 10, "Minimal Wear": 4, "Field-Tested": 3, "Well-Worn": 2, "Battle-Scarred": 1})
    skinY = Skin("SkinY", 0, 1, {"Factory New": 5, "Minimal Wear": 8, "Field-Tested": 6, "Well-Worn": 4, "Battle-Scarred": 2})
    
    skinRedline = Skin("Redline", 0, 1, {"Factory New": 130, "Minimal Wear": 108, "Field-Tested": 24, "Well-Worn": 17, "Battle-Scarred": 15})
    
    skinDecimator = Skin("Decimator", 0, 1, {"Factory New": 58, "Minimal Wear": 26, "Field-Tested": 15, "Well-Worn": 17, "Battle-Scarred": 13})
    skinEmerald = Skin("Emerald", 0, 1, {"Factory New": 10, "Minimal Wear": 5, "Field-Tested": 3, "Well-Worn": 2.5, "Battle-Scarred": 2.4})
    
    # Create a collection and add skins
    collection_1 = Collection("Collection 1")
    collection_1.add_input_skin(skinX)
    collection_1.add_output_skin(skinRedline)
    
    collection_2 = Collection("Collection 2")
    collection_2.add_input_skin(skinY)
    collection_2.add_output_skin(skinDecimator)
    collection_2.add_output_skin(skinEmerald)
    
    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    trade_up_pool.add_collection(collection_2)
    return trade_up_pool

# Collection Inferno 2018 Mil-spec
def load_tradeup_3():
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

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

# Collection Nuke 2018 Industrial
def load_tradeup_4():
    # input skins definition
    skin_input1 = Skin("M4A4 | Mainframe", 0, 0.5, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("Galil AR | Cold Fusion", 0, 0.83, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("MP7 | Motherboard", 0, 0.5, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input4 = Skin("Negev | Bulkhead", 0, 0.5, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("AWP | Acheron", 0, 0.83, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo
    skin_output2 = Skin("MP5-SD | Co-Processor", 0, 0.5, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo
    skin_output3 = Skin("P250 | Exchanger", 0, 0.5, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo
    skin_output4 = Skin("P90 | Facility Negative", 0, 0.5, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

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
    collection_1.add_output_skin(skin_output4)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

# Collection Nuke 2018 Mil-spec
def load_tradeup_5():
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

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

# Collection Bank Mil-spec
def load_tradeup_6():
    # input skins definition
    skin_input1 = Skin("CZ75-Auto | Tuxedo", 0, 0.8, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("Galil AR | Tuxedo", 0, 0.8, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("Desert Eagle | Meteorite", 0, 0.18, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("AK-47 | Emerald Pinstripe", 0, 1, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Nuke 2018")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

# Collection Dust 2 Mil-spec
def load_tradeup_7():
    # input skins definition
    skin_input1 = Skin("PP-Bizon | Brass", 0, 1, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("SG 553 | Damascus Steel", 0, 1, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("M4A1-S | VariCamo", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("P2000 | Amber Fade", 0, 0.4, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Nuke 2018")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

# Collection Italy Mil-spec
def load_tradeup_8():
    # input skins definition
    skin_input1 = Skin("Glock-18 | Candy Apple", 0, 0.3, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("Sawed-Off | Full Stop", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("MP7 | Anodized Navy", 0, 0.08, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("AWP | Pit Viper", 0.08, 0.5, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Nuke 2018")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

# Collection Lake Mil-spec
def load_tradeup_9():
    # input skins definition
    skin_input1 = Skin("USP-S | Night Ops", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("P90 | Teardown", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("SG 553 | Anodized Navy", 0, 0.08, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("Dual Berettas | Cobalt Quartz", 0, 0.4, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Nuke 2018")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

# Collection Safehouse Mil-spec
def load_tradeup_10():
    # input skins definition
    skin_input1 = Skin("SSG 08 | Acid Fade", 0, 0.03, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("FAMAS | Teardown", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("Five-SeveN | Silver Quartz", 0, 0.4, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("M4A1-S | Nitro", 0.06, 0.8, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Nuke 2018")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    collection_1.add_input_skin(skin_input3)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

# Collection Train Mil-spec
def load_tradeup_11():
    # input skins definition
    skin_input1 = Skin("Desert Eagle | Urban Rubble", 0, 0.5, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("Sawed-Off | Amber Fade", 0, 0.4, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("Tec-9 | Red Quartz", 0, 0.4, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False) # certo

    # Create a collection and add skins
    collection_1 = Collection("Collection Nuke 2018")
    # add input skins
    collection_1.add_input_skin(skin_input1)
    collection_1.add_input_skin(skin_input2)
    # add output skins
    collection_1.add_output_skin(skin_output1)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    return trade_up_pool

def load_tradeup_filler1():
    # input skins definition
    skin_input1 = Skin("SSG 08 | Hand Brake", 0, 1, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input2 = Skin("M4A4 | Converter", 0, 0.4, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input3 = Skin("Sawed-Off | Brake Light", 0, 0.08, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input4 = Skin("USP-S | Check Engine", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    skin_input5 = Skin("Sawed-Off | Full Stop", 0, 0.6, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input6 = Skin("MP7 | Anodized Navy", 0, 0.08, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)
    skin_input7 = Skin("Glock-18 | Candy Apple", 0, 0.3, {"Factory New": 100, "Minimal Wear": 100, "Field-Tested": 100, "Well-Worn": 100, "Battle-Scarred": 100}, stattrak=False)

    # output skins definition
    skin_output1 = Skin("AK-47 | Safety Net", 0, 0.6, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False)
    skin_output2 = Skin("MP7 | Fade", 0, 0.25, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False)
    skin_output3 = Skin("P250 | Vino Primo", 0, 1, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False)

    skin_output4 = Skin("AWP | Pit Viper", 0.08, 0.5, {"Factory New": 0.1, "Minimal Wear": 0.1, "Field-Tested": 0.1, "Well-Worn": 0.1, "Battle-Scarred": 0.1}, stattrak=False)

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

    collection_2 = Collection("Filler") # italy collection
    collection_2.add_input_skin(skin_input5)
    collection_2.add_input_skin(skin_input6)
    collection_2.add_input_skin(skin_input7)

    collection_2.add_output_skin(skin_output4)

    # Create a TradeUpPool and add the collection
    trade_up_pool = TradeUpPool()
    trade_up_pool.add_collection(collection_1)
    trade_up_pool.add_collection(collection_2)
    return trade_up_pool

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