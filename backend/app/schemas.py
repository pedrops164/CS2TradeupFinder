# import marshmallow for schema validation and serialization of data in the request
from marshmallow import Schema, fields, validate, post_load
from app.models import db, TradeupType, User, UserRole, InputTradeupEntry, Tradeup, OutputTradeupEntry,SkinCondition
from app.date import aware_utcnow
from flask_marshmallow import Marshmallow
import logging
from collections import OrderedDict

ma = Marshmallow()

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class EmptySchema(ma.Schema):
    pass

# Define Schemas for request validation
class InputEntrySchema(ma.SQLAlchemySchema):
    class Meta:
        model = InputTradeupEntry
        load_instance = True
        
    skin_name = fields.Method("get_skin_name", dump_only=True) # dump only
    skin_condition = fields.Method("get_skin_condition", dump_only=True) # dump only
    skin_condition_id = ma.auto_field(required=True) # load and dump (goes to frontend and back)
    skin_float = fields.Float(required=True, validate=lambda x: x >= 0.0 and x <= 1.0) # load and dump (goes to frontend and back)
    count = fields.Integer(required=True, validate=lambda x: x > 0 and x <= 10) # load and dump (goes to frontend and back)
    collection_id = fields.Method("get_collection_id", dump_only=True) # dump only
    price = fields.Method("get_price", dump_only=True) # dump only
    image_url = fields.Method("get_image_url", dump_only=True) # dump only

    def get_skin_name(self, obj: InputTradeupEntry):
        return obj.skin_condition.skin.name
    def get_skin_condition(self, obj: InputTradeupEntry):
        return obj.skin_condition.condition
    def get_price(self, obj: InputTradeupEntry):
        return obj.skin_condition.price
    def get_image_url(self, obj: InputTradeupEntry):
        return obj.skin_condition.skin.image_name
    def get_collection_id(self, obj: InputTradeupEntry):
        return obj.skin_condition.skin.collection_id

    @post_load
    def load_skin_condition(self, entry, **kwargs):
        skin_condition = db.session.get(SkinCondition, entry['skin_condition_id'])
        entry['skin_condition'] = skin_condition
        return entry
    
class OutputEntrySchema(ma.SQLAlchemySchema):
    class Meta:
        model = OutputTradeupEntry
        load_instance = True
        
    skin_name = fields.Method("get_skin_name", dump_only=True) # dump only
    skin_condition = fields.Method("get_skin_condition", dump_only=True) # dump only
    #skin_condition_id = ma.auto_field(dump_only=True) # load and dump (goes to frontend and back)
    #skin_float = fields.Float(required=True, validate=lambda x: x >= 0 and x <= 1)
    skin_float = fields.Float(dump_only=True)
    #prob = fields.Float(required=True, validate=lambda x: x >= 0 and x <= 100)
    prob = fields.Float(dump_only=True)
    price = fields.Method("get_price", dump_only=True) # dump only
    image_url = fields.Method("get_image_url", dump_only=True) # dump only

    def get_skin_name(self, obj: OutputTradeupEntry):
        return obj.skin_condition.skin.name
    def get_skin_condition(self, obj: OutputTradeupEntry):
        return obj.skin_condition.condition
    def get_price(self, obj: OutputTradeupEntry):
        return obj.skin_condition.price
    def get_image_url(self, obj: InputTradeupEntry):
        return obj.skin_condition.skin.image_name
    
class LongTradeupSchema(Schema):
    id = fields.Integer(required=True) # in tradeup
    name = fields.String(required=True) # in tradeup
    input_entries = fields.List(fields.Nested(InputEntrySchema), required=True) # in tradeup
    output_entries = fields.List(fields.Nested(OutputEntrySchema), required=True) # in tradeup
    collection_names = fields.Method("get_collection_names")
    input_rarity = fields.String(required=True) # in tradeup
    stattrak = fields.Boolean(required=True) # in tradeup
    price = fields.Float(required=True) # in tradeup
    avg_input_float = fields.Float(required=True) # in tradeup
    input_skins_cost = fields.Float(required=True) # in tradeup
    avg_profitability = fields.Float(required=True) # in tradeup
    profit_odds = fields.Float(required=True) # in tradeup
    
    def get_collection_names(self, obj: Tradeup):
        return [collection.name for collection in obj.collections]
     
class PurchasableTradeupSchema(Schema):
    id = fields.Integer(required=True) # in tradeup
    name = fields.String(required=True) # in tradeup
    input_rarity = fields.String(required=True) # in tradeup
    stattrak = fields.Boolean(required=True) # in tradeup
    price = fields.Float(required=True) # in tradeup
    input_skins_cost = fields.Float(required=True) # in tradeup
    avg_profitability = fields.Float(required=True) # in tradeup
    profit_odds = fields.Float(required=True) # in tradeup

"""
return {
        "tradeups": public_tradeups_dicts,
        "page": public_tradeups_paginated.page,
        "per_page": public_tradeups_paginated.per_page,
        "total_pages": public_tradeups_paginated.pages,
        "total_items": public_tradeups_paginated.total
    }
"""
class PaginatedSchema(Schema):
    page = fields.Int(attribute="page")
    per_page = fields.Int(attribute="per_page")
    total_pages = fields.Int(attribute="pages")
    total_items = fields.Int(attribute="total")

class PaginatedCensoredTradeupSchema(PaginatedSchema):
    tradeups = fields.List(fields.Nested(PurchasableTradeupSchema), attribute='items')

class PaginatedUncensoredTradeupSchema(PaginatedSchema):
    tradeups = fields.List(fields.Nested(LongTradeupSchema), attribute='items')

class TradeupInputSchema(Schema):
    input_entries = fields.List(fields.Nested(InputEntrySchema), required=True)
    stattrak = fields.Boolean(required=True)
    input_rarity = fields.String(required=True)
    name = fields.String(required=False, load_default=None)
    release_date = fields.DateTime(required=False, load_default=aware_utcnow)

class TradeupOutputSchema(ma.SQLAlchemySchema):
    output = fields.List(fields.Nested(OutputEntrySchema), attribute='output_entries', dump_only=True)
    avg_input_float = fields.Float(dump_only=True)
    tradeup_cost = fields.Float(dump_only=True, attribute='input_skins_cost')
    profit_avg = fields.Float(dump_only=True, attribute='avg_profitability')
    profit_odds = fields.Float(dump_only=True)
    
class PurchasableTradeupInputSchema(TradeupInputSchema):
    price = fields.Float(required=True)

class DuplicateTradeupCheckSchema(TradeupInputSchema):
    price = fields.Float(required=False, load_default=None)
    tradeup_type = fields.String(
        required=True,
        validate=validate.OneOf([e.value for e in TradeupType])
    )

class SkinSearchSchema(Schema):
    search_string = fields.String(required=False, load_default='')
    rarity = fields.String(required=True, validate=validate.OneOf(["consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg", "covert_bg"]))
    stattrak = fields.Boolean(required=True)
    page = fields.Integer(required=False, load_default=1, validate=validate.Range(min=1))  # Default to page 1

class UserSchema(ma.SQLAlchemySchema):
    class Meta:
        model = User
        dict_class = OrderedDict
        
    steam_id = ma.auto_field(dump_only=True)
    avatar_url = ma.auto_field(required=False, dump_only=True)
    personaname = ma.auto_field(required=False, dump_only=True)
    signup_date = ma.auto_field(dump_only=True)
    email = ma.auto_field(required=False, validate=[validate.Length(max=120),
                                                   validate.Email()])
    # Add the role field using a function to return the enum's value.
    role = fields.Enum(UserRole, required=True, by_value=True)

class TokenSchema(ma.Schema):
    class Meta:
        dict_class = OrderedDict

    access_token = ma.String(required=True)
    refresh_token = ma.String()

class OAuth2Schema(ma.Schema):
    code = ma.String(required=True)
    state = ma.String(required=True)

class SteamSchema(ma.Schema):
    steam_id = ma.String(required=True)