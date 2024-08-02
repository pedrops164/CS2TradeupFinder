from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
import sqlalchemy.orm as so
from werkzeug.security import generate_password_hash, check_password_hash

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
    
    skin = db.relationship('Skin', backref='skin_conditions')
    
class Tradeup(db.Model):
    __tablename__ = "tradeup"
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=True, unique=False)
    stattrak = db.Column(db.Boolean, nullable=False)
    input_rarity = db.Column(db.String, nullable=False)

    input_entries = db.relationship('InputTradeupEntry', backref='tradeup', lazy='joined')
    output_entries = db.relationship('OutputTradeupEntry', backref='tradeup', lazy='joined')
    collections = db.relationship('Collection', secondary='tradeup_collections', backref='tradeups', lazy='joined')
    
    def __init__(self, stattrak, input_rarity, name=None):
        self.name = name
        self.stattrak = stattrak
        self.input_rarity = input_rarity

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
    
class TradeupCollections(db.Model):
    __tablename__ = "tradeup_collections"

    tradeup_id = db.Column(db.Integer, db.ForeignKey('tradeup.id'), primary_key=True)
    collection_id = db.Column(db.Integer, db.ForeignKey('collections.id'), primary_key=True)

    def __init__(self, tradeup_id, collection_id):
        self.tradeup_id = tradeup_id
        self.collection_id = collection_id
    
class InputTradeupEntry(db.Model):
    __tablename__ = "input_tradeup_entry"
    
    id = db.Column(db.Integer, primary_key=True)
    skin_condition_id = db.Column(db.Integer, db.ForeignKey('skin_conditions.id'), nullable=False)
    float = db.Column(db.Float, nullable=False)
    count = db.Column(db.Integer, nullable=False)
    tradeup_id = db.Column(db.Integer, db.ForeignKey('tradeup.id'), nullable=False)
    
    skin_condition = db.relationship('SkinCondition', backref='input_entries')
    
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

    skin_condition = db.relationship('SkinCondition', backref='output_entries')

    def __init__(self, skin_condition_id, float, prob, tradeup_id):
        self.skin_condition_id = skin_condition_id
        self.float = float
        self.prob = prob
        self.tradeup_id = tradeup_id
        
    def set_tradeup_id(self, tradeup_id):
        self.tradeup_id = tradeup_id

# user class
class User(UserMixin, db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), index=True, unique=True)
    password_hash = db.Column(db.String(256))

    def __repr__(self):
        return '<User {}>'.format(self.username)

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)