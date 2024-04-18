from enum import Enum

class Collection(Enum):
    ALPHA_COLLECTION = 1
    BANK_COLLECTION = 2
    DUST_2_COLLECTION = 3

class Condition(Enum):
    BATTLE_SCARED = 1  # 1.00 - 0.45
    WELL_WORN = 2      # 0.45 - 0.37
    FIELD_TESTED = 3   # 0.37 - 0.15
    MINIMAL_WEAR = 4   # 0.15 - 0.07
    FACTORY_NEW = 5    # 0.07 - 0.00

class Skin:

    """
    The constructor of skin receives
    
    weapon_name: str -> the name of the weapon (for example ak-47)
    skin_name: str -> the name of the skin (for example 'Redline')
    condition: Condition -> the condition of the skin (for example factory new)
    collection: Collection -> the collection that the skin belongs to (for example Phoenix Collection)~
    price: int -> the price of the skin in euros? (for example 15 euros)

    """
    def __init__(self, weapon_name, skin_name, condition, collection, price=None):
        self.weapon_name = weapon_name
        self.skin_name = skin_name
        self.condition = condition
        self.collection = collection
        self.price = price

    def updatePrice(self, price):
        self.price = price


class TradeUpPool:
    def __init__(self):
        pass