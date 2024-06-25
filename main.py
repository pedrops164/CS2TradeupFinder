from db import get_tradeup_dataframe
from solvers.solver_manager import search_solve_tradeup, tradeup_solver_all, tradeup_solver_double, tradeup_solver_single

if __name__ == '__main__':
    df = get_tradeup_dataframe()
    # Define configuration parameters as a dictionary
    # rarities -> "consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg", "covert_bg"
    config = {
        'collection_names_subset': range(1, 37),
        #'ratio': [0.6,0.7,0.8],
        'ratio': [0.3, 0.5, 0.75],
        'rarity': ["consumer_bg", "milspec_bg", "restricted_bg"],
        'stattrak': [False],
        'solve': 'double'  # Options: 'single', 'double', 'all'
    }
    search_solve_tradeup(df, config)