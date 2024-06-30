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
    
    def __init__(self, name):
        self.name = name
    
class TradeupEntry(db.Model):
    __tablename__ = "tradeup_entry"
    
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