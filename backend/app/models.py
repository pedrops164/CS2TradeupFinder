from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

# Define the models (database tables)
class Collection(db.Model):
    __tablename__ = 'collections'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, unique=True, nullable=False)

    # Relationship to link skins to collections
    skins = db.relationship('Skin', backref='collection', lazy=True)

class Skin(db.Model):
    __tablename__ = 'skins'

    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False)
    min_float = db.Column(db.Float)
    max_float = db.Column(db.Float)
    stattrak = db.Column(db.Boolean)
    collection_id = db.Column(db.Integer, db.ForeignKey('collections.id'))
    quality = db.Column(db.String)
    
    @staticmethod
    def get_float_str(float_value: float):
        assert 0 <= float_value <= 1, "float_value must be between 0 and 1"
        if float_value < 0.07:
            return "Factory New"
        elif float_value < 0.15:
            return "Minimal Wear"
        elif float_value < 0.38:
            return "Field-Tested"
        elif float_value < 0.45:
            return "Well-Worn"
        else:
            return "Battle-Scarred"

class SkinCondition(db.Model):
    __tablename__ = 'skin_conditions'

    id = db.Column(db.Integer, primary_key=True)
    condition = db.Column(db.String, nullable=False)
    price = db.Column(db.Float)
    skin_id = db.Column(db.Integer, db.ForeignKey('skins.id'))
    timestamp = db.Column(db.DateTime)
    
class Tradeup(db.Model):
    __tablename__ = "tradeup"
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=False, unique=True)
    tracked = db.Column(db.Boolean, nullable=False)
    
    def __init__(self, name, tracked):
        self.name = name
        self.tracked = tracked

    class InvalidRarityException(Exception):
        def __init__(self, message):
            self.message = message
            super().__init__(self.message)
    
    @staticmethod
    def get_output_quality(input_rarity):
        rarities = ["consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg", "covert_bg"]
        if input_rarity not in rarities:
            raise Tradeup.InvalidRarityException("Input rarity not defined")
        
        input_quality_index = rarities.index(input_rarity)
        if input_quality_index == len(rarities) - 1:
            raise Tradeup.InvalidRarityException("Input rarity doesn't have matching output rarity")
        
        return rarities[input_quality_index + 1]
    
class InputTradeupEntry(db.Model):
    __tablename__ = "input_tradeup_entry"
    
    id = db.Column(db.Integer, primary_key=True)
    skin_condition_id = db.Column(db.Integer, db.ForeignKey('skin_conditions.id'), nullable=False)
    float = db.Column(db.Float, nullable=False)
    count = db.Column(db.Integer, nullable=False)
    tradeup_id = db.Column(db.Integer, db.ForeignKey('tradeup.id'), nullable=False)
    
    def __init__(self, skin_condition_id, float, count, tradeup_id):
        self.skin_condition_id = skin_condition_id
        self.float = float
        self.count = count
        self.tradeup_id = tradeup_id
        
    def set_tradeup_id(self, tradeup_id):
        self.tradeup_id = tradeup_id

class OutputTradeupEntry(db.Model):
    __tablename__ = "output_tradeup_entry"

    id = db.Column(db.Integer, primary_key=True)
    skin_condition_id = db.Column(db.Integer, db.ForeignKey('skin_conditions.id'), nullable=False)
    float = db.Column(db.Float, nullable=False)
    prob = db.Column(db.Float, nullable=False) # probability
    tradeup_id = db.Column(db.Integer, db.ForeignKey('tradeup.id'), nullable=False)
