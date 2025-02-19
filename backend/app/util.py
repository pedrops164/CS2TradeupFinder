""" Utilty functions module """
from backend.app.models import Tradeup
from backend.src.tradeups import calculate_tradeup_stats
from backend.app.schemas import InputEntrySchema, OutputEntrySchema
import logging

# Configure logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
    
input_entry_schema = InputEntrySchema()
output_entry_schema = OutputEntrySchema()

def set_tradeup_stats(tradeup: Tradeup):
    if not tradeup.input_entries or not tradeup.output_entries:
        tradeup.avg_input_float = None
        tradeup.input_skins_cost = None
        tradeup.avg_profitability = None
        tradeup.profit_odds = None
        raise ValueError("Tradeup has no input or output entries")
    
    input_entries_dict = [input_entry_schema.dump(input_entry) for input_entry in tradeup.input_entries]
    output_entries_dict = [output_entry_schema.dump(output_entry) for output_entry in tradeup.output_entries]
    avg_input_float, input_skins_cost, profit_avg, profit_odds = calculate_tradeup_stats(input_entries_dict, output_entries_dict, tradeup.stattrak)
    tradeup.avg_input_float = avg_input_float
    tradeup.input_skins_cost = input_skins_cost
    tradeup.avg_profitability = profit_avg
    tradeup.profit_odds = profit_odds

def get_skin_conditions_array(min_float: float, max_float: float) -> list:
    # Define CS2 condition ranges as (name, lower bound, upper bound)
    conditions = [
        ("Factory New", 0.00, 0.07),
        ("Minimal Wear", 0.07, 0.15),
        ("Field-Tested", 0.15, 0.38),
        ("Well-Worn", 0.38, 0.45),
        ("Battle-Scarred", 0.45, 1.00)
    ]
    
    result = []
    for name, lower, upper in conditions:
        # Check if the condition range overlaps with the [min_float, max_float] range.
        # There is an overlap if the condition's upper bound is greater than min_float
        # and its lower bound is less than max_float.
        if upper > min_float and lower < max_float:
            result.append(name)
    
    return result