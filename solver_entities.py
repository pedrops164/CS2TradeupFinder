# Steam API KEY: 7KG6F1NR55RYTH80
from steamapi import updateSkinPrice

base_floats = [0, 0.07, 0.15, 0.37, 0.45]
class Skin:
    def __init__(self, name, min_float, max_float, prices=None, stattrak=True, collection_name=None, quality=None):
        self.name = name
        self.min_float = min_float
        self.max_float = max_float
        self.stattrak = stattrak # Boolean that indicates if skin is stattrak or not
        self.collection_name = collection_name # Collection that the skin belongs to. For example: Bank
        self.quality = quality # quality of the skin. For example: Milspec
        # prices is a dict where key is the condition and value is the price
        self.prices = {"Factory New": None, "Minimal Wear": None, "Field-Tested": None, "Well-Worn": None, "Battle-Scarred": None}
        if prices:
            self.prices['Factory New'] = prices.get('Factory New')
            self.prices['Minimal Wear'] = prices.get('Minimal Wear')
            self.prices['Field-Tested'] = prices.get('Field-Tested')
            self.prices['Well-Worn'] = prices.get('Well-Worn')
            self.prices['Battle-Scarred'] = prices.get('Battle-Scarred')
        self.valid_floats = [f for f in base_floats if self.min_float <= f <= self.max_float]
        # Ensure that the list starts with the skin's min_float if it's not already included
        if self.valid_floats[0] != self.min_float:
            self.valid_floats.insert(0, self.min_float)
        if self.valid_floats[-1] == self.max_float:
            self.valid_floats.pop()

    def get_price(self, condition):
        return self.prices.get(condition, "N/A")
    
    def get_name(self):
        return self.name
    
    def get_floats(self):
        return self.valid_floats

    def get_bounded_floats(self):
        # Get the valid floats including boundaries for max float
        valid_floats = self.get_floats()

        # Create tuples representing bounded ranges
        bounded_floats = [(valid_floats[i], valid_floats[i + 1]) for i in range(len(valid_floats) - 1)]
        bounded_floats.append((valid_floats[-1], min(1, self.max_float)))
        return bounded_floats
    
    def get_median_floats(self, ratio=0.5):
        bounded_floats = self.get_bounded_floats()
        # median_floats = [(upper+lower) / 2.0 for (lower,upper) in bounded_floats]
        median_floats = [((upper - lower) * ratio + lower) for (lower,upper) in bounded_floats]
        return median_floats
    
    def updateConditionPrice(self, condition, newPrice=None):
        self.prices[condition] = newPrice
    
    def get_prices(self):
        condition_names = {
        (0, 0.07): 'Factory New',
        (0.07, 0.15): 'Minimal Wear',
        (0.15, 0.37): 'Field-Tested',
        (0.37, 0.45): 'Well-Worn',
        (0.45, 1): 'Battle-Scarred'
        }
        available_conditions = []
        prices = []
        bounded_floats = self.get_bounded_floats()
        for float_interval, condition in condition_names.items():
            for (start, end) in bounded_floats:
                if start >= float_interval[0] and end <= float_interval[1] and condition not in available_conditions:
                    available_conditions.append(condition)
                    prices.append(self.prices.get(condition))
        return prices, available_conditions
    
    @staticmethod
    def get_available_conditions(min_float, max_float):
        condition_names = {
            (0, 0.07): 'Factory New',
            (0.07, 0.15): 'Minimal Wear',
            (0.15, 0.37): 'Field-Tested',
            (0.37, 0.45): 'Well-Worn',
            (0.45, 1): 'Battle-Scarred'
        }
        available_conditions = []
        for (start, end), condition in condition_names.items():
            if min_float < end and max_float > start:
                available_conditions.append(condition)
        return available_conditions

class Collection:
    def __init__(self, name):
        self.name = name
        self.input_skins = []  # List of Skin objects
        self.output_skins = []  # List of Skin objects

    def add_input_skin(self, skin):
        self.input_skins.append(skin)

    def add_output_skin(self, skin):
        self.output_skins.append(skin)


class TradeUpPool:
    def __init__(self):
        self.collections = []  # Dictionary where key is the collection name and value is the Collection object

    def add_collection(self, collection):
        self.collections.append(collection)

    def get_collection(self, name):
        return self.collections.get(name, None)
    
    def updateAllPrices(self):
        for collection in self.collections:
            for input_skin in collection.input_skins:
                updateSkinPrice(input_skin)
            for output_skin in collection.output_skins:
                updateSkinPrice(output_skin)

class InputSkins:
    def __init__(self):
        self.input_skins = []

    def add_input_skin(self, var, costs, floats):
        self.input_skins.add((var, costs, floats))
