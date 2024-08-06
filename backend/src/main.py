from backend.src.db import get_tradeup_dataframe
from backend.src.solvers.solver_manager import search_solve_tradeup, tradeup_solver_all, tradeup_solver_double, tradeup_solver_single

def solve():
    df = get_tradeup_dataframe()
    # Define configuration parameters as a dictionary
    # rarities -> "consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg", "covert_bg"
    config = {
        'collection_names_subset': range(1, 37),
        #'ratio': [0.6,0.7,0.8],
        'ratio': [0.3],
        #'rarity': ["consumer_bg", "milspec_bg", "restricted_bg"],
        'rarity': ["consumer_bg"],
        'stattrak': [False],
        'solve': 'single'  # Options: 'single', 'double', 'all'
    }
    search_solve_tradeup(df, config)

if __name__ == '__main__':
    solve()
