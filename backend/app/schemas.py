# import marshmallow for schema validation and serialization of data in the request
from marshmallow import Schema, fields, validate
from backend.app.models import TradeupType, User, UserRole, InputTradeupEntry, Tradeup, OutputTradeupEntry
from backend.app.date import aware_utcnow
from flask_marshmallow import Marshmallow
import logging

ma = Marshmallow()

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

class EmptySchema(ma.Schema):
    pass

# Define Schemas for request validation
class InputEntrySchema(Schema):
    skin_name = fields.Method("get_skin_name", deserialize="load_skin_name")
    skin_condition = fields.Method("get_skin_condition", deserialize="load_skin_condition")
    skin_float = fields.Float(required=True, validate=lambda x: x >= 0.0 and x <= 1.0)
    count = fields.Integer(required=True, validate=lambda x: x > 0 and x <= 10)
    collection_id = fields.Integer(required=True)
    price = fields.Method("get_price")
    image_url = fields.Method("get_image_url")

    def get_skin_name(self, obj: InputTradeupEntry):
        return obj.skin_condition.skin.name
    def get_skin_condition(self, obj: InputTradeupEntry):
        return obj.skin_condition.condition
    def get_price(self, obj: InputTradeupEntry):
        return obj.skin_condition.price
    def get_image_url(self, obj: InputTradeupEntry):
        return obj.skin_condition.skin.image_name
    def load_skin_name(self, value):
        return str(value).strip()
    def load_skin_condition(self, value):
        return str(value).strip()
    
class OutputEntrySchema(Schema):
    skin_name = fields.Method("get_skin_name", deserialize="load_skin_name")
    skin_condition = fields.Method("get_skin_condition", deserialize="load_skin_condition")
    skin_float = fields.Float(required=True, validate=lambda x: x >= 0 and x <= 1)
    prob = fields.Float(required=True, validate=lambda x: x >= 0 and x <= 100)
    price = fields.Method("get_price")
    image_url = fields.Method("get_image_url")

    def get_skin_name(self, obj: OutputTradeupEntry):
        return obj.skin_condition.skin.name
    def get_skin_condition(self, obj: OutputTradeupEntry):
        return obj.skin_condition.condition
    def get_price(self, obj: OutputTradeupEntry):
        return obj.skin_condition.price
    def get_image_url(self, obj: OutputTradeupEntry):
        return obj.skin_condition.skin.image_name
    def load_skin_name(self, value):
        return str(value).strip()
    def load_skin_condition(self, value):
        return str(value).strip()
    
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
        ordered = True
        
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
        ordered = True

    access_token = ma.String(required=True)
    refresh_token = ma.String()

class OAuth2Schema(ma.Schema):
    code = ma.String(required=True)
    state = ma.String(required=True)

class SteamSchema(ma.Schema):
    steam_id = ma.String(required=True)