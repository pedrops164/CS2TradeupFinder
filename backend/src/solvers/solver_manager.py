from backend.src.tradeups import create_tradeup_from_dataframe

# temporary fix for the import error on the linear solver. Problem with python version and docplex
#import numpy as np
#np.float_ = np.float64
#np.complex_ = np.complex128


from backend.src.solvers.pyomo import solver as solver_pyomo_nonlinear
from backend.src.solvers.pyomo import solver_linear
from backend.src.solvers.pyscipopt import solver_pyscipopt
from itertools import product
import time
import traceback
from contextlib import nullcontext
import json
import os
from typing import List
from backend.app.database import get_tradeup_dataframe

script_dir = os.path.dirname(__file__) #<-- absolute dir the script is in

def solve_tradeups_decorator(tradeup_solver):
    """
    Decorator for tradeup solver functions to log execution time and write results to file.
    
    Args:
        tradeup_solver (function): Function that calculates optimal tradeups in the given tradeup pool.
    """
    
    def tradeup_solver_decorator(tradeup_pool, collection_names, ratio, file=None):
        max_obj_value = 0
        max_obj_idx = None
        start = time.time()
        for objective_value, name_subset in tradeup_solver(tradeup_pool, collection_names, ratio, file):
            if objective_value and objective_value > max_obj_value:
                max_obj_value = objective_value
                max_obj_idx = name_subset
        end = time.time()
        if file:
            file.write(f"Solved in {end-start} seconds\n")
            file.write(f"Max obj value: {max_obj_value}, max obj idx: {max_obj_idx}\n")
            file.close()
            
    return tradeup_solver_decorator

class SearchSpace:
    def __init__(self, collection_names_subset: List[int], ratio: List[float], rarity: List[str], stattrak: List[bool], solve: str, write_output_file=True):
        self.collection_names_subset = collection_names_subset
        self.ratio = ratio
        self.rarity = rarity
        self.stattrak = stattrak
        self.solve = solve
        self.write_output_file = write_output_file

def search_solve_tradeup(search_space: SearchSpace):
    """
    Searches and solves tradeups for the specified collections and settings.
    
    Args:
        df (DataFrame): DataFrame containing tradeup data.
        config (dict): Configuration parameters including:
            - collection_names_subset (List[str] or range): List or range of collection names to consider.
            - ratio (float or List[float]): Float ratio or list of ratios to use on the input skins.
            - rarity (str or List[str]): Quality of the skins ('industrial_bg', etc.) or list of qualities.
            - stattrak (bool or List[bool]): Indicates whether the skins are stattrak or list of bools.
            - solve (str): Which tradeup solver to use ('single', 'double', or 'all'). Defaults to 'all'.
    """
    df = get_tradeup_dataframe()
    # Unpack the config dictionary
    collection_names_subset = search_space.collection_names_subset
    ratios = search_space.ratio
    rarities = search_space.rarity
    stattrak_values = search_space.stattrak
    solve = search_space.solve
    
    # Iterate over all combinations of ratios, rarities, and stattrak values
    for ratio, rarity, stattrak in product(ratios, rarities, stattrak_values):
        tradeup_pool = create_tradeup_from_dataframe(df, rarity, stattrak)
        is_stattrak = 'stattrak' if stattrak else 'non_stattrak'
        output_file_name = f"output/tradeup_search-{ratio}-{rarity}-{is_stattrak}.txt"
        output_file_path = os.path.join(script_dir, output_file_name)
        
        if solve == 'single':
            solver = tradeup_solver_single
        elif solve == 'double':
            solver = tradeup_solver_double
        else:  # 'all'
            solver = tradeup_solver_all

        with open(output_file_path, "w") if search_space.write_output_file else nullcontext() as file:
            solver(tradeup_pool, collection_names_subset, ratio, file)
        
@solve_tradeups_decorator
def tradeup_solver_single(tradeup_pool, collection_names_subset, ratio, file=None):
    """
    Calculates a set of optimal tradeups in the tradeup_pool for each collection name in the subset.
    
    Args:
        tradeup_pool (TradeUpPool): Trade up pool of collections to search on.
        collection_names_subset (List[str]): Subset of collection names to do the tradeup search on.
        ratio (float): Float ratio to use on the input skins.
        file (File): File to write output stats to. Defaults to None.
    
    Yields:
        Tuple[float, List[str]]: Objective value and the collection name subset.
    """
    best_objective_value = 0
    for collection_name in collection_names_subset:
        collection_name_subset = [collection_name]
        objective_value = solve_subset(tradeup_pool, collection_name_subset, ratio, file, min_obj_value=best_objective_value)
        if objective_value is not None and objective_value > best_objective_value:
            best_objective_value = objective_value
        yield objective_value, collection_name_subset
        
@solve_tradeups_decorator
def tradeup_solver_double(tradeup_pool, collection_names_subset, ratio, file=None):
    """
    Calculates a set of optimal tradeups in the tradeup_pool for all pairs of collection names in the subset.
    
    Args:
        tradeup_pool (TradeUpPool): Trade up pool of collections to search on.
        collection_names_subset (List[str]): Subset of collection names to do the tradeup search on.
        ratio (float): Float ratio to use on the input skins.
        file (File): File to write output stats to. Defaults to None.
    
    Yields:
        Tuple[float, List[str]]: Objective value and the collection name subset.
    """
    best_objective_value = 0
    n_collections = len(collection_names_subset)
    for i in range(1, n_collections):
        for j in range(0, i):
            collection_name_1 = collection_names_subset[i]
            collection_name_2 = collection_names_subset[j]
            collection_name_subset = [collection_name_1, collection_name_2]
            objective_value = solve_subset(tradeup_pool, collection_name_subset, ratio, file, min_obj_value=best_objective_value)
            if objective_value is not None and objective_value > best_objective_value:
                best_objective_value = objective_value
            yield objective_value, collection_name_subset
        
@solve_tradeups_decorator
def tradeup_solver_all(tradeup_pool, collection_names_subset, ratio, file=None):
    """
    Calculates a set of optimal tradeups in the tradeup_pool for the entire subset of collection names.
    
    Args:
        tradeup_pool (TradeUpPool): Trade up pool of collections to search on.
        collection_names_subset (List[str]): Subset of collection names to do the tradeup search on.
        ratio (float): Float ratio to use on the input skins.
        file (File): File to write output stats to. Defaults to None.
    
    Yields:
        Tuple[float, List[str]]: Objective value and the collection name subset.
    """
    objective_value = solve_subset(tradeup_pool, collection_names_subset, ratio, file)
    yield objective_value, collection_names_subset
            
def solve_subset(tradeup_pool, collection_subset, ratio, file=None, min_obj_value=0):
    """
    Calculates the best tradeup for the given tradeup pool and subset of collections.
    
    Args:
        tradeup_pool (TradeUpPool): Trade up pool of collections to search on.
        collection_subset (List[str]): Subset of collections to do the tradeup search on.
        ratio (float): Float ratio to use on the input skins.
        file (File): File to write output stats to. Defaults to None.
    
    Returns:
        float: Objective value of the function. Returns None if it couldn't be solved.
    """
    print(f"current collection subset: {collection_subset}")
    try:
        # calculate best tradeup
        objective_value, profit_pctg, input_skins_cost, elapsed_time, results_dict = solver_pyscipopt.solve_tradeup(tradeup_pool, collection_subset, ratio, min_obj_value)
        if file:
            tradeup_output = f"subset: {collection_subset}, obj value: {objective_value:.3f}, profit_pctg: {profit_pctg:.2f}, input_skins_cost: {input_skins_cost:.2f}, time: {elapsed_time:.2f}\n"
            file.write(tradeup_output)
            json.dump(results_dict, file, indent=4)
            file.write("\n\n")
        return objective_value
    except Exception as e:
        traceback.print_exc()
        if file:
            file.write(f"subset: {collection_subset}, exception caught!\n\n")
    return None