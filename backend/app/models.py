from flask_sqlalchemy import SQLAlchemy
from flask_login import UserMixin
import sqlalchemy.orm as so
from werkzeug.security import generate_password_hash, check_password_hash
import enum
from sqlalchemy import Enum, MetaData
import sqlalchemy as sa

convention = {
    "ix": 'ix_%(column_0_label)s',
    "uq": "uq_%(table_name)s_%(column_0_name)s",
    "ck": "ck_%(table_name)s_%(constraint_name)s",
    "fk": "fk_%(table_name)s_%(column_0_name)s_%(referred_table_name)s",
    "pk": "pk_%(table_name)s"
}
metadata = MetaData(naming_convention=convention)

db = SQLAlchemy(metadata=metadata)

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
    stattrak_available = db.Column(db.Boolean, default=False)  # New field
    collection_id = db.Column(db.Integer, db.ForeignKey('collections.id'))
    quality = db.Column(db.String)
    image_name = db.Column(db.String(64), nullable=True, default=None)
    last_of_rarity = db.Column(db.Boolean, nullable=False, default=False, server_default=sa.text("0"))
    
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
    stattrak = db.Column(db.Boolean)
    timestamp = db.Column(db.DateTime)
    
    skin = db.relationship('Skin', backref='skin_conditions')

class TradeupType(enum.Enum):
    PUBLIC = "public"
    PURCHASABLE = "purchasable"
    PRIVATE = "private"

tradeup_purchase = db.Table('tradeup_purchase',
    db.Column('user_id', db.Integer, db.ForeignKey('user.steam_id'), primary_key=True),
    db.Column('tradeup_id', db.Integer, db.ForeignKey('tradeup.id'), primary_key=True)
)

private_tradeup_user = db.Table('private_tradeup_user',
    db.Column('user_id', db.Integer, db.ForeignKey('user.steam_id'), primary_key=True),
    db.Column('tradeup_id', db.Integer, db.ForeignKey('tradeup.id'), primary_key=True)
)
    
class Tradeup(db.Model):
    __tablename__ = "tradeup"
    
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String, nullable=True, unique=False)
    stattrak = db.Column(db.Boolean, nullable=False) # stattrak status of the input skins of the tradeup
    input_rarity = db.Column(db.String, nullable=False) # rarity of the input skins of the tradeup
    tradeup_type = db.Column(db.Enum(TradeupType), nullable=False) # public, purchasable or private
    price = db.Column(db.Float, nullable=True) # price of the tradeup. Only applicable if type is purchasable

    input_entries = db.relationship('InputTradeupEntry', backref='tradeup', lazy='joined')
    output_entries = db.relationship('OutputTradeupEntry', backref='tradeup', lazy='joined')
    collections = db.relationship('Collection', secondary='tradeup_collections', backref='tradeups', lazy='joined')
    purchased_by = db.relationship('User', secondary=tradeup_purchase, back_populates='tradeups_purchased')
    tracked_by = db.relationship('User', secondary=private_tradeup_user, back_populates='tracked_tradeups')
    
    def __init__(self, stattrak, input_rarity, tradeup_type, price=None, name=None):
        self.name = name
        self.stattrak = stattrak
        self.input_rarity = input_rarity
        self.tradeup_type = tradeup_type
        self.price = price
        
        # Ensure price is only set for purchasable tradeups
        if self.tradeup_type == TradeupType.PURCHASABLE and price is None:
            raise ValueError("Price must be set for purchasable tradeups")
        elif self.tradeup_type != TradeupType.PURCHASABLE and price is not None:
            raise ValueError("Price can only be set for purchasable tradeups")

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
    skin_float = db.Column(db.Float, nullable=False)
    count = db.Column(db.Integer, nullable=False)
    tradeup_id = db.Column(db.Integer, db.ForeignKey('tradeup.id'), nullable=False)
    
    skin_condition = db.relationship('SkinCondition', backref='input_entries')
    
    def __init__(self, skin_condition_id, skin_float, count, tradeup_id):
        self.skin_condition_id = skin_condition_id
        self.skin_float = skin_float
        self.count = count
        self.tradeup_id = tradeup_id
        
    def set_tradeup_id(self, tradeup_id):
        self.tradeup_id = tradeup_id

class OutputTradeupEntry(db.Model):
    __tablename__ = "output_tradeup_entry"

    id = db.Column(db.Integer, primary_key=True)
    skin_condition_id = db.Column(db.Integer, db.ForeignKey('skin_conditions.id'), nullable=False)
    skin_float = db.Column(db.Float, nullable=False)
    prob = db.Column(db.Float, nullable=False) # probability
    tradeup_id = db.Column(db.Integer, db.ForeignKey('tradeup.id'), nullable=False)

    skin_condition = db.relationship('SkinCondition', backref='output_entries')

    def __init__(self, skin_condition_id, skin_float, prob, tradeup_id):
        self.skin_condition_id = skin_condition_id
        self.skin_float = skin_float
        self.prob = prob
        self.tradeup_id = tradeup_id
        
    def set_tradeup_id(self, tradeup_id):
        self.tradeup_id = tradeup_id

class UserRole(enum.Enum):
    # users can be of default type (user) or admin
    USER = "user"
    ADMIN = "admin"

from datetime import datetime, timedelta, timezone
# date helper functions for Token and User models
def aware_utcnow():
    return datetime.now(timezone.utc)

def naive_utcnow():
    return aware_utcnow().replace(tzinfo=None)

# user class
class User(UserMixin, db.Model):
    __tablename__ = "user"

    steam_id = db.Column(db.String(32), primary_key=True)
    email = db.Column(db.String(120), unique=True, nullable=True)
    role = db.Column(db.Enum(UserRole), nullable=False, default=UserRole.USER)
    avatar_url = db.Column(db.String(256), nullable=True)
    personaname = db.Column(db.String(32), nullable=True)
    signup_date: so.Mapped[datetime] = so.mapped_column(default=naive_utcnow, server_default=sa.text("CURRENT_TIMESTAMP"), nullable=False)

    tradeups_purchased = db.relationship('Tradeup', secondary=tradeup_purchase, back_populates='purchased_by')
    tracked_tradeups = db.relationship('Tradeup', secondary=private_tradeup_user, back_populates='tracked_by')

    last_seen: so.Mapped[datetime] = so.mapped_column(default=naive_utcnow, server_default=sa.text("CURRENT_TIMESTAMP"), nullable=False)
    tokens: so.WriteOnlyMapped['Token'] = so.relationship(
        back_populates='user')

    def __repr__(self):
        return '<User {}>'.format(self.username)

    def set_password(self, password):
        self.password_hash = generate_password_hash(password)

    def check_password(self, password):
        return check_password_hash(self.password_hash, password)
    
    def is_admin(self):
        return self.role == UserRole.ADMIN
    
    def is_user(self):
        return self.role == UserRole.USER

    def ping(self):
        self.last_seen = naive_utcnow()

    def generate_auth_token(self):
        token = Token(user=self)
        token.generate()
        return token

    @staticmethod
    def verify_access_token(access_token_jwt, refresh_token=None):
        token = Token.from_jwt(access_token_jwt)
        if token:
            if token.access_expiration > naive_utcnow():
                token.user.ping() # not implemented
                db.session.commit()
                return token.user

    @staticmethod
    def verify_refresh_token(refresh_token, access_token_jwt):
        token = Token.from_jwt(access_token_jwt)
        if token and token.refresh_token == refresh_token:
            if token.refresh_expiration > naive_utcnow():
                return token

            # someone tried to refresh with an expired token
            # revoke all tokens from this user as a precaution
            token.user.revoke_all()
            db.session.commit()

import sqlalchemy as sa
import jwt
import secrets
from flask import current_app

class Token(db.Model):
    __tablename__ = 'tokens'

    id: so.Mapped[int] = so.mapped_column(primary_key=True)
    access_token: so.Mapped[str] = so.mapped_column(sa.String(64), index=True)
    access_expiration: so.Mapped[datetime]
    refresh_token: so.Mapped[str] = so.mapped_column(sa.String(64), index=True)
    refresh_expiration: so.Mapped[datetime]
    user_id: so.Mapped[int] = so.mapped_column(
        sa.ForeignKey('user.steam_id'), index=True)

    user: so.Mapped['User'] = so.relationship(back_populates='tokens')

    @property
    def access_token_jwt(self):
        return jwt.encode({'token': self.access_token},
                          current_app.config['SECRET_KEY'],
                          algorithm='HS256')

    def generate(self):
        self.access_token = secrets.token_urlsafe()
        self.access_expiration = naive_utcnow() + \
            timedelta(minutes=current_app.config['ACCESS_TOKEN_MINUTES'])
        self.refresh_token = secrets.token_urlsafe()
        self.refresh_expiration = naive_utcnow() + \
            timedelta(days=current_app.config['REFRESH_TOKEN_DAYS'])

    def expire(self, delay=None):
        if delay is None:  # pragma: no branch
            # 5 second delay to allow simultaneous requests
            delay = 5 if not current_app.testing else 0
        self.access_expiration = naive_utcnow() + timedelta(seconds=delay)
        self.refresh_expiration = naive_utcnow() + timedelta(seconds=delay)

    @staticmethod
    def clean():
        """Remove any tokens that have been expired for more than a day."""
        yesterday = naive_utcnow() - timedelta(days=1)
        db.session.query(Token).filter(Token.refresh_expiration < yesterday).delete()

    @staticmethod
    def from_jwt(access_token_jwt):
        access_token = None
        try:
            access_token = jwt.decode(access_token_jwt,
                                      current_app.config['SECRET_KEY'],
                                      algorithms=['HS256'])['token']
            return db.session.query(Token).filter_by(access_token=access_token).first()
        except jwt.PyJWTError:
            pass