""" Module for defining relevant types"""

from typing import List, TypedDict, Optional

class InputEntryDict(TypedDict):
    count: int
    skin_float: float
    price: float
    skin_condition: str
    skin_name: str
    collection_id: int

class OutputEntryDict(TypedDict):
    prob: float
    skin_float: float
    price: float
    skin_condition: str
    skin_name: str

class LongTradeupDict(TypedDict):
    """Typed Dictionary containing all the information about a tradeup
    """
    tradeup_id: int
    tradeup_stattrak: bool
    tradeup_input_rarity: str
    tradeup_name: Optional[str]
    tradeup_price: Optional[float]
    collection_names: List[str]
    # tradeup entries
    input_entries: List[InputEntryDict]
    output_entries: List[OutputEntryDict]
    # tradeup stats
    avg_input_float: float # average float of the input skins
    profit_odds: float # percentage for the tradeup to turn out profitable
    profit_avg_pctg: float # average profitability in percentage
    input_skins_cost: float # total cost of the input skins

class PurchasableTradeupDict(TypedDict):
    """Typed Dictionary containing information about a purchasable tradeup, showing relevant yet non-revealing information
    about the tradeup
    """
    tradeup_id: int
    tradeup_stattrak: bool
    tradeup_input_rarity: str
    tradeup_name: Optional[str]
    tradeup_price: float
    # tradeup stats
    profit_odds: float # percentage for the tradeup to turn out profitable
    profit_avg_pctg: float # average profitability in percentage
    input_skins_cost: Optional[float] # total cost of the input skins
