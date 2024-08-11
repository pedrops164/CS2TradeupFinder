from pyscipopt import Model, quicksum, SCIP_PARAMSETTING, Eventhdlr, SCIP_EVENTTYPE
import re
from time import time

calls = []

def sanitize_variable_name(name):
    """Sanitize variable names by keeping only letters, digits, spaces, and |"""
    sanitized_name = re.sub(r"[^\w\s|]", "_", name)
    return sanitized_name

def define_model_variables(model, trade_up_pool, collection_names_subset, ratio):
    # variable that contains the total cost of the input skins
    input_skins_cost = model.addVar(name="input_skins_cost", vtype="C", lb=0)

    # variable that contains the average price of the resulting skins of the tradeup (output skins)
    average_output_price = model.addVar(name="average_output_price", vtype="C", lb=0)

    # Dynamically create variables for input skins
    collection_dict = {} # maps collection name to collection. Collection name is unique
    all_input_skins = []
    all_output_skins = []
    for collection in trade_up_pool.collections:
        if collection_names_subset and collection.name not in collection_names_subset:
            continue
        input_skins = []
        output_skins = []
        n_input_skins = len(collection.input_skins)
        n_output_skins = len(collection.output_skins)
        if n_input_skins == 0 or n_output_skins == 0:
            continue
        for skin in collection.input_skins:
            skin_prices, _ = skin.get_prices()
            skin_floats = skin.get_median_floats(ratio=ratio)
            num_floats = len(skin_floats)
            assert len(skin_prices) == len(skin_floats)
            
            var_name = sanitize_variable_name(f"{skin.name}_count")
            skin_count_var = [model.addVar(vtype="I", lb=0, ub=10, name=f"{var_name}_{i}") for i in range(num_floats)]
            for i, price in enumerate(skin_prices):
                if price is None:
                    #model.addCons(skin_count_var[i] == 0)
                    model.fixVar(skin_count_var[i],0)

            input_skins.append((skin_count_var, skin_prices, skin_floats))
            all_input_skins.append((skin_count_var, skin_prices, skin_floats))
        for skin in collection.output_skins:
            skin_name = skin.get_name()
            skin_prices, _ = skin.get_prices()
            skin_bounded_floats = skin.get_bounded_floats()
            assert len(skin_prices) == len(skin_bounded_floats)
            # set None prices to 0 so that those output skin conditions don't get chosen
            skin_prices = [0 if price is None else price for price in skin_prices]

            var_name = sanitize_variable_name(f"{skin.name}_output")
            output_var = [model.addVar(vtype="B", name=f"{var_name}_{i}") for i in range(len(skin_bounded_floats))]

            output_skin = (output_var, skin_name, skin_prices, skin_bounded_floats)

            output_skins.append(output_skin)
            all_output_skins.append(output_skin)
        collection_dict[collection.name] = (input_skins, output_skins)

    return collection_dict, all_input_skins, all_output_skins, input_skins_cost, average_output_price

def define_objective(model, average_output_price, input_skins_cost):
    # Objective: maximize the avg output price divided by the input skins cost
    model.setObjective(average_output_price / input_skins_cost, "maximize")

def define_constraints(model, all_input_skins, input_skins_cost, average_output_price):
    input_skins_cost_expr = quicksum(quicksum(skin_count_var[i] * skin_prices[i] for i in range(len(skin_prices)) if skin_prices[i] is not None) for (skin_count_var, skin_prices, _) in all_input_skins)
    model.addCons(input_skins_cost == input_skins_cost_expr)

    # Total skins constraint: the sum of all skin count variables is 10
    if len(all_input_skins) > 0:
        total_skins_expr = quicksum(quicksum(skin_count_var[i] for i in range(len(skin_prices))) for (skin_count_var, skin_prices, _) in all_input_skins)
        model.addCons(total_skins_expr == 10)
    else:
        raise ValueError("No input skins available to trade.")

    # Average float constraint
    avg_input_float = model.addVar(name="avg_input_float", vtype="C", lb=0, ub=1)
    avg_float_expr = quicksum(quicksum(skin_count_var[i] * skin_float[i] for i in range(len(skin_float))) for (skin_count_var, _, skin_float) in all_input_skins) / 10
    model.addCons(avg_input_float == avg_float_expr)

    return avg_input_float

def add_float_bound_constraints(model, all_output_skins, avg_input_float):
    for (output_var, _, _, skin_bounded_floats) in all_output_skins:
        min_float = skin_bounded_floats[0][0]
        max_float = skin_bounded_floats[-1][1]
        output_float = ((max_float - min_float) * avg_input_float) + min_float
        for i in range(len(skin_bounded_floats)):
            # Lower bound constraint
            model.addCons(output_float >= skin_bounded_floats[i][0] - (1 - output_var[i]))
            # Upper bound constraint
            model.addCons(output_float <= skin_bounded_floats[i][1] + (1 - output_var[i]))

        # Single output constraint: Only one binary variable is active
        model.addCons(quicksum(output_var) == 1)

def define_ballots_probs_variables(model, collection_dict):
    collection_to_vars_dict = {}
    for collection_num, (collection_name, collection) in enumerate(list(collection_dict.items())):
        (input_skins, output_skins) = collection

        # Collection ballots variable: cannot be an expression
        collection_ballots_var = model.addVar(name=f"collection_{collection_num}_ballots", vtype="I", lb=0)

        # Collection probabilities variable
        collection_output_skins_names = [skin[1] for skin in output_skins]
        collection_probs_var = {name: model.addVar(vtype="C", lb=0, ub=1, name=f"prob_{name}") for name in collection_output_skins_names}

        # Add constraints to link `collection_ballots_var` to the input skins counts
        ballots_expr = quicksum(len(output_skins) * quicksum(skin_count_var[i] for i in range(len(skin_count_var)))
                                for (skin_count_var, _, _) in input_skins)
        model.addCons(collection_ballots_var == ballots_expr)

        collection_to_vars_dict[collection_name] = (collection_ballots_var, collection_probs_var)

    return collection_to_vars_dict

def add_total_ballots_constraint(model, collection_to_vars_dict):
    total_ballots = model.addVar(name="total_ballots", vtype="I", lb=10, ub=80)
    total_ballots_expr = quicksum(ballots_var for (ballots_var, _) in list(collection_to_vars_dict.values()))
    model.addCons(total_ballots == total_ballots_expr)
    return total_ballots

def add_avg_output_price_constraint(model, collection_dict, collection_to_vars_dict, average_output_price):
    estimated_output_price_expr = 0
    for (collection_name, collection) in list(collection_dict.items()):
        (_, output_skins) = collection
        (_, collection_probs_var) = collection_to_vars_dict[collection_name]
        for skin in output_skins:
            output_var = skin[0] 
            skin_name = skin[1]
            prices_per_float = skin[2] 
            sum_prices = quicksum(output_var[i] * prices_per_float[i] for i in range(len(prices_per_float)) if prices_per_float[i] is not None)
            estimated_output_price_expr += collection_probs_var[skin_name] * sum_prices

    model.addCons(average_output_price == estimated_output_price_expr)

def add_ballots_per_collection_constraints(model, collection_dict, collection_to_vars_dict, total_ballots):
    for (collection_name, collection) in list(collection_dict.items()):
        (_, output_skins) = collection
        (collection_ballots_var, collection_probs_var) = collection_to_vars_dict[collection_name]
        for skin in output_skins:
            skin_name = skin[1]
            model.addCons(collection_ballots_var == collection_probs_var[skin_name] * len(output_skins) * total_ballots)

class MyEvent(Eventhdlr):
    def __init__(self, min_obj_value):
        super().__init__()
        self.min_obj_value = min_obj_value

    def eventinit(self):
        self.model.catchEvent(SCIP_EVENTTYPE.BESTSOLFOUND, self)

    def eventexit(self):
        self.model.dropEvent(SCIP_EVENTTYPE.BESTSOLFOUND, self)

    def eventexec(self, event):
        #self.model.eventexec(SCIP_EVENTTYPE.BESTSOLFOUND, self)
        #print(self.model.getBestSol())
        print(f"Obj val - {self.model.getObjVal()}")
        dual_bound = self.model.getDualbound()
        print(f"getDualbound - {dual_bound}")
        
        if dual_bound < self.min_obj_value:
            print(f"Dual bound {dual_bound} is below minimum objective value {self.min_obj_value:.3f}. Interrupting.")
            self.model.interruptSolve()


def solve_tradeup(trade_up_pool, collection_names_subset=None, ratio=0.5, min_obj_value=0.5):
    """Find the best tradeup in the givel tradeup pool.

    Args:
        trade_up_pool (_type_): Pool that contains collections to search in
        collection_names_subset (_type_, optional): subset of collections to use in the search. Defaults to None.
        ratio (float, optional): ratio of the float of input skins. Defaults to 0.5.
        min_obj_value (float, optional): stop if obj value is below this. Defaults to 0.5.

    Returns:
        _type_: _description_
    """
    model = Model()
    # Set the verbosity level to 0 to suppress solver output
    model.setIntParam('display/verblevel', 0)

    # Set a time limit of 20 minutes (1200 seconds)
    model.setRealParam('limits/time', 1200.0)

    #model.setPresolve(SCIP_PARAMSETTING.AGGRESSIVE)
    model.setSeparating(SCIP_PARAMSETTING.FAST)
    #model.setHeuristics(SCIP_PARAMSETTING.AGGRESSIVE)

    collection_dict, all_input_skins, all_output_skins, input_skins_cost, average_output_price = define_model_variables(model, trade_up_pool, collection_names_subset, ratio)
    if len(all_input_skins) == 0 or len(all_output_skins) == 0:
        # can't solve if there are no input or output skins
        return
    
    collection_to_vars_dict = define_ballots_probs_variables(model, collection_dict)
    
    avg_input_float = define_constraints(model, all_input_skins, input_skins_cost, average_output_price)
    add_float_bound_constraints(model, all_output_skins, avg_input_float)
    total_ballots = add_total_ballots_constraint(model, collection_to_vars_dict)
    add_avg_output_price_constraint(model, collection_dict, collection_to_vars_dict, average_output_price)
    add_ballots_per_collection_constraints(model, collection_dict, collection_to_vars_dict, total_ballots)
    
    #define_objective(model, average_output_price, input_skins_cost)
    # Define an auxiliary variable to handle the division in the objective function
    obj_var = model.addVar(name="objective_variable", vtype="C", lb=0, ub=model.infinity())
    model.addCons(obj_var * input_skins_cost == average_output_price)
    model.setObjective(obj_var, "maximize")

    # Instantiate and include the event handler
    eventhdlr = MyEvent(min_obj_value)
    model.includeEventhdlr(eventhdlr, "BESTSOLFOUND", "python event handler to catch BESTSOLFOUND")
    start = time()
    # Solve the model
    model.optimize()
    end = time()
    elapsed_solver_time = end-start

    results_dict = {
        "status": model.getStatus(),
        "skin_count_vars": {},
        "collection_probs_vars": {},
    }

    if model.getStatus() == "optimal":
        print("Optimal solution found.")
    else:
        print(f"Solver finished with status {model.getStatus()}")

    # Collect and print count variables
    for (skin_count_var, _, _) in all_input_skins:
        if any(model.getVal(var) > 0 for var in skin_count_var):
            count_var_values = {str(var): model.getVal(var) for var in skin_count_var if model.getVal(var) > 0}
            results_dict["skin_count_vars"][str(skin_count_var)] = count_var_values
    
    # Collect and print probabilities
    for collection_name, _ in collection_dict.items():
        _, collection_probs_var = collection_to_vars_dict[collection_name]
        prob_var_values = {name: model.getVal(collection_probs_var[name]) for name in collection_probs_var if model.getVal(collection_probs_var[name]) > 0}
        results_dict["collection_probs_vars"][collection_name] = prob_var_values
                
    # Get final objective function value
    final_objective_value = model.getObjVal()
    # Calculate the Profit percentage
    profit_percentage = calculate_profit_percentage(model, collection_dict, collection_to_vars_dict, input_skins_cost)

    return final_objective_value, profit_percentage, model.getVal(input_skins_cost), elapsed_solver_time, results_dict

def calculate_profit_percentage(model, collection_dict, collection_to_vars_dict, input_skins_cost):
    profit_percentage = 0
    for (collection_name, collection) in list(collection_dict.items()):
        (_, output_skins) = collection
        (_, collection_probs_var) = collection_to_vars_dict[collection_name]
        for skin in output_skins:
            output_var = skin[0]
            skin_name = skin[1]
            prices_per_float = skin[2]
            skin_price = sum(model.getVal(output_var[i]) * prices_per_float[i] for i in range(len(prices_per_float)) if prices_per_float[i] is not None)
            probs_var = model.getVal(collection_probs_var[skin_name])
            if skin_price > model.getVal(input_skins_cost) * 1.13:
                profit_percentage += probs_var
    return profit_percentage