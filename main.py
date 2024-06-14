from presets.tradeups import create_tradeup_from_dataframe
from db import get_tradeup_dataframe
from solvers import solver
from solvers import solver_linear
import time
import sys
import traceback
from contextlib import nullcontext

def single_tradeup_search(df, ratio_list, collection_names_subset, rarity, stattrak, write_output_file=True):
    """
    Executes a set of tradeup searches over the given subset of collection names.
    Each tradeup search envolves each of the collections given as argument, and a each of the float ratios to use in the tradeups
    """
    # rarities - "consumer_bg" < "industrial_bg" < "milspec_bg" < "restricted_bg" < "classified_bg" < "covert_bg"
    tradeup_pool = create_tradeup_from_dataframe(df, rarity, stattrak)
    # gets string representing stattrak status
    is_stattrak = 'stattrak' if stattrak else 'non_stattrak'
    # defines the name of the output file
    output_file_name = f"output/tradeup_search-{ratio}-{rarity}-{is_stattrak}.txt"
    if write_output_file:
        file = open(output_file_name, "w")
    else:
        file = None
    max_obj_value = 0
    max_obj_idx = None
    start = time.time()
    for collection_name in collection_names_subset:
        print(f"current collection_name: {collection_name}")
        objective_value = solve_subset(tradeup_pool, [collection_name], ratio, file)
        if objective_value and objective_value > max_obj_value:
            max_obj_value = objective_value
            max_obj_idx = collection_name
    end = time.time()
    if write_output_file:
        file.write(f"Solved in {end-start} seconds\n")
        file.write(f"Max obj value: {max_obj_value}, max obj idx: {max_obj_idx}\n")
        file.close()
        
def solve_tradeups_decorator(tradeup_solver):
    """
    This decorator receives a tradeup_solver function which calculates optimal tradeups in the calculated tradeup pool
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

def search_solve_tradeup(solver, df, collection_names, ratio, rarity, stattrak, write_output_file=True):
    tradeup_pool = create_tradeup_from_dataframe(df, rarity, stattrak)
    # gets string representing stattrak status
    is_stattrak = 'stattrak' if stattrak else 'non_stattrak'
    # defines the name of the output file
    output_file_name = f"output/tradeup_search-{ratio}-{rarity}-{is_stattrak}.txt"
    with open(output_file_name, "w") if write_output_file else nullcontext() as file:
        solver(tradeup_pool, collection_names, ratio, file)
        
@solve_tradeups_decorator
def tradeup_solver_single(tradeup_pool, collection_names_subset, ratio, file=None):
    """
    Calculates a set of optimal tradeups in the tradeup_pool
    Calculates one tradeup for each collection_name in collection_names_subset
    Calculation time is linear in the number of collection names, assuming all collections have roughly the same number of input and output weapons
    """
    for collection_name in collection_names_subset:
        collection_name_subset = [collection_name]
        print(f"current collection_name: {collection_name}")
        objective_value = solve_subset(tradeup_pool, collection_name_subset, ratio, file)
        yield objective_value, collection_name_subset
        
@solve_tradeups_decorator
def tradeup_solver_double(tradeup_pool, collection_names_subset, ratio, file=None):
    """
    Calculates a set of optimal tradeups in the tradeup_pool
    Calculates all pairs of tradeups for the collection names in collection_names_subset
    Calculation time is quadratic in the number of collection names, assuming all collections have roughly the same number of input and output weapons
    """
    n_collections = len(collection_names_subset)
    for i in range(1, n_collections):
        for j in range(0, i):
            collection_name_1 = collection_names_subset[i]
            collection_name_2 = collection_names_subset[j]
            collection_name_subset = [collection_name_1, collection_name_2]
            print(f"current subset: {collection_name_subset}")
            objective_value = solve_subset(tradeup_pool, collection_name_subset, ratio, file)
            yield objective_value, collection_name_subset
        
@solve_tradeups_decorator
def tradeup_solver_all(tradeup_pool, collection_names_subset, ratio, file=None):
    """
    Calculates a set of optimal tradeups in the tradeup_pool
    Calculates the optimal tradeup for all the collection names in collection_names_subset
    """
    print(f"current subset: {collection_names_subset}")
    objective_value = solve_subset(tradeup_pool, collection_names_subset, ratio, file)
    yield objective_value, collection_names_subset
            
def solve_subset(tradeup_pool, collection_subset, ratio, file=None):
    """
    Calculates the best tradeup for the given tradeup pool and subset of collections
    
    Args:
        tradeup_pool (TradeUpPool): trade up pool of collection to search on
        collection_subset (List): subset of collections to do the tradeup search on
        ratio (float): Float ratio to use on the input skins
        file (File): File to write output stats to. Defaults to None.

    Returns:
        float: Objective of the function. Returns None if it couldn't be solved
    """
    print(f"current collection subset: {collection_subset}")
    try:
        # calculate best tradeup
        objective_value, profit_pctg, input_skins_cost = solver_linear.solve_tradeup(tradeup_pool, collection_subset, ratio)
        if file:
            tradeup_output = f"subset: {collection_subset}, obj value: {objective_value}, profit_pctg: {profit_pctg}, input_skins_cost: {input_skins_cost}\n"
            file.write(tradeup_output)
        return objective_value
    except Exception as e:
        traceback.print_exc()
        if file:
            file.write(f"subset: {collection_subset}, exception caught!\n")
    return None
        
if __name__ == '__main__':
    df = get_tradeup_dataframe()
    # "consumer_bg", "industrial_bg", "milspec_bg", "restricted_bg", "classified_bg", "covert_bg"
    # ratio_list = [0.4, 0.5, 0.6]
    # rarities = ["restricted_bg", "classified_bg"]
    # collection_names_subset = range(0, 77)
    # for ratio in ratio_list:
    #     for rarity in rarities:
    #         search_solve_tradeup(tradeup_solver_double, df, collection_names_subset, ratio, rarity, stattrak=True, write_output_file=True)
    ratio = 0.7
    rarity = "industrial_bg"
    collection_names_subset = range(1, 3)
    search_solve_tradeup(tradeup_solver_all, df, collection_names_subset, ratio, rarity, stattrak=False, write_output_file=True)