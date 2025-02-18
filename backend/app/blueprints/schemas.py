# import marshmallow for schema validation and serialization of data in the request
from marshmallow import Schema, fields, validate
from backend.app.models import TradeupType, User, UserRole
from backend.app import ma
from backend.app.date import aware_utcnow

class EmptySchema(ma.Schema):
    pass

# Define Schemas for request validation
class InputEntrySchema(Schema):
    skin_name = fields.String(required=True)
    skin_condition = fields.String(required=True)
    skin_float = fields.Float(required=True, validate=lambda x: x >= 0.0 and x <= 1.0)
    count = fields.Integer(required=True, validate=lambda x: x > 0 and x <= 10)
    collection_id = fields.Integer(required=True)
    
class OutputEntrySchema(Schema):
    skin_name = fields.String(required=True)
    skin_condition = fields.String(required=True)
    skin_float = fields.Float(required=True, validate=lambda x: x >= 0 and x <= 1)
    skin_prob = fields.Float(required=True, validate=lambda x: x >= 0 and x <= 100)

class TradeupInputSchema(Schema):
    input_entries = fields.List(fields.Nested(InputEntrySchema), required=True)
    stattrak = fields.Boolean(required=True)
    input_rarity = fields.String(required=True)
    name = fields.String(required=False, load_default=None)
    release_date = fields.DateTime(required=False, load_default=aware_utcnow)

class PurchasableTradeupInputSchema(TradeupInputSchema):
    tradeup_price = fields.Float(required=True)

class DuplicateTradeupCheckSchema(TradeupInputSchema):
    tradeup_price = fields.Float(required=False, load_default=None)
    tradeup_type = fields.String(
        required=True,
        validate=validate.OneOf([e.value for e in TradeupType])
    )

#class SearchSkinSchema(Schema):
#    rarity = fields.String(required=True)
#    stattrak = fields.Boolean(required=True)
#    condition = fields.String(required=True)
#    search_string = fields.String(required=False, load_default=None)
#    collection_names = fields.List(fields.String(), required=False, load_default=None)


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