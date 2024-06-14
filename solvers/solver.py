from pyomo.environ import *
from pyomo.opt import SolverFactory, OptSolver
import re

def sanitize_variable_name(name):
    """Sanitize variable names by keeping only letters, digits, spaces, and |"""
    sanitized_name = re.sub(r"[^\w\s|]", "_", name)
    return sanitized_name

def define_model_variables(model, trade_up_pool, collection_names_subset, ratio):
    # variable that contains the total cost of the input skins
    model.input_skins_cost = Var(domain=NonNegativeReals)

    # variable that contains the average price of the resulting skins of the tradeup (output skins)
    model.average_output_price = Var(domain=NonNegativeReals)

    # Dynamically create variables for input skins
    collection_dict = {} # maps collection name to collection. Collection name is unique
    all_input_skins = []
    all_output_skins = []
    for collection in trade_up_pool.collections:
        if collection_names_subset and collection.name not in collection_names_subset:
            continue
        input_skins = []
        output_skins = []
        print(collection.name)
        n_input_skins = len(collection.input_skins)
        n_output_skins = len(collection.output_skins)
        print("n_input_skins:",n_input_skins)
        print("n_output_skins:",n_output_skins)
        if n_input_skins == 0 or n_output_skins == 0:
            continue
        for skin in collection.input_skins:
            skin_prices, _ = skin.get_prices()
            skin_floats = skin.get_median_floats(ratio=ratio)
            num_floats = len(skin_floats)
            
            var_name = sanitize_variable_name(f"{skin.name}_count")
            skin_count_var = Var(range(num_floats), within=NonNegativeIntegers, bounds=(0, 10))
            setattr(model, var_name, skin_count_var)
            for i, price in enumerate(skin_prices):
                if price is None:
                    skin_count_var[i].fix(0)

            input_skins.append((skin_count_var, skin_prices, skin_floats))
            all_input_skins.append((skin_count_var, skin_prices, skin_floats))
        for skin in collection.output_skins:
            skin_name = skin.get_name()
            skin_prices, _ = skin.get_prices()
            skin_bounded_floats = skin.get_bounded_floats()

            var_name = sanitize_variable_name(f"{skin.name}_output")
            output_var = Var(range(len(skin_bounded_floats)), within=Binary)
            setattr(model, var_name, output_var)
            for i, price in enumerate(skin_prices):
                if price is None:
                    output_var[i].fix(0)

            output_skin = (output_var, skin_name, skin_prices, skin_bounded_floats)

            output_skins.append(output_skin)
            all_output_skins.append(output_skin)
        collection_dict[collection.name] = (input_skins, output_skins)

    return collection_dict, all_input_skins, all_output_skins

def define_objective_rule(model):
    # we want to maximize profit percentage. So we want to maximize the avg output price divided by the input skins cost
    def new_objective_rule(model):
        model.obj = model.average_output_price / model.input_skins_cost
        #return model.average_output_price / model.input_skins_cost
        return model.input_skins_cost

    model.objective = Objective(rule=new_objective_rule, sense=maximize)

def define_input_skins_cost_constraint(model, all_input_skins):
    input_skins_cost = sum(sum(skin_count_var[i] * skin_prices[i] for i in range(len(skin_prices)) if skin_prices[i] is not None) for (skin_count_var, skin_prices, _) in all_input_skins)
        
    def input_skins_cost_rule(model):
        return model.input_skins_cost == input_skins_cost
    model.input_skins_cost_constraint = Constraint(rule=input_skins_cost_rule)

def define_total_skins_constraint(model, all_input_skins):
    # Total skins constraint
    def total_skins_constraint(model):
        # trade up must have 10 input skins. So the sum of all skin count variables is 10
        if len(all_input_skins) > 0:
            return sum(sum(skin_count_var[i] for i in range(len(skin_prices))) for (skin_count_var, skin_prices, _) in all_input_skins) == 10
        else:
            return Constraint.Infeasible
    model.total_skins_constraint = Constraint(rule=total_skins_constraint)

def define_avg_float_constraint(model, all_input_skins):
    # Average float constraint
    def avg_float_constraint(model):
        return model.avg_input_float == sum(sum(skin_count_var[i] * skin_float[i] for i in range(len(skin_float))) for (skin_count_var, _, skin_float) in all_input_skins) / 10
        #return model.avg_input_float >= 0.0

    model.avg_float_constraint = Constraint(rule=avg_float_constraint)

def add_float_bound_constraints(model, all_output_skins):
    """
    These constraints serve to select the correct binary variable out of the variables that represent each float of a skin
    if a skin has 5 bounded floats variables, one for each condition (fn, mw, ft, ww, bs), and if the average float of the input skins is 0.03, then
    the variable correspondent to 'fn' will have a value of 1, and the remaining four (mw, ft, ww, bs) variables will have a value of 0

    We apply lower and upper constraints to account for the lower and upper limit of each condition class. For example, minimal wear is 0.07 to 0.15
    The specific lower and upper threshold values are defined by each skin, given that these are influenced by the skin's min and max float.

    For example, Ak-47 Redline's minimumm float is 0.1
    Therefore, for the minimal wear variable, the lower threshold is 0.1 (opposed to 0.07), and the upper threshold is 0.15

    The 'add_single_constraint' serves to make sure that for each skin, only one binary float variable is activated (the sum is 1). This is because there can't be
    two conditions of the same skin in the output of a tradeup.
    """
    def add_bound_constraints():
        M = 10  # A large constant, big-M
        # outcome skin float = ((max.float-min.float) × avg.float) + min.float
        for (output_var, _, _, skin_bounded_floats) in all_output_skins:
            min_float = skin_bounded_floats[0][0]
            max_float = skin_bounded_floats[-1][1]
            output_float = ((max_float - min_float) * model.avg_input_float) + min_float
            for i in range(len(skin_bounded_floats)):
                # define lower bound constraint
                lower_constraint = output_float >= skin_bounded_floats[i][0] - M * (1 - output_var[i])
                # define upper bound constraint
                upper_constraint = output_float <= skin_bounded_floats[i][1] + M * (1 - output_var[i])

                # add constrains to model
                model.lower_bound_constraint.add(lower_constraint)
                model.upper_bound_constraint.add(upper_constraint)

    def add_single_constraint():
        for (output_var, _, _, skin_bounded_floats) in all_output_skins:
            constraint = sum(output_var[i] for i in range(len(skin_bounded_floats))) == 1
            model.single_output_constraint.add(constraint)

    model.lower_bound_constraint = ConstraintList()
    model.upper_bound_constraint = ConstraintList()
    model.single_output_constraint = ConstraintList()
    add_bound_constraints()
    add_single_constraint()

def define_ballots_probs_variables(model, collection_dict):
    collection_to_vars_dict = {}

    for collection_num, (collection_name, collection) in enumerate(list(collection_dict.items())):
        (input_skins, output_skins) = collection

        # set the variable that holds the number of ballots of the current collection
        #collection_ballots_var = Var(within=NonNegativeIntegers)
        collection_ballots_var = len(output_skins) * sum(sum(skin_count_var[i] for i in skin_count_var) for (skin_count_var,_,_) in input_skins) # Each input skin is a tuple (skin_count_var, skin_prices, skin_floats)
        setattr(model, f"collection_{collection_num}_ballots", collection_ballots_var)

        # set the variable which holds the probabilities of the outpt skins of this collectin
        collection_output_skins_names = [skin[1] for skin in output_skins] # skin name is in index 1 of the tuple (output_var, skin_name, skin_prices, skin_bounded_floats)
        collection_probs_var = Var(collection_output_skins_names, within=NonNegativeReals, bounds=(0,1))
        setattr(model, f"collection_{collection_num}_probs", collection_probs_var)
        
        # map the current collection to its variables, to set the constraints later
        collection_to_vars_dict[collection_name] = (collection_ballots_var, collection_probs_var)

    return collection_to_vars_dict

def add_total_ballots_constraint(model, collection_to_vars_dict):
    # Constraint for total_ballots
    def total_ballots_rule(model):
        # total ballots is the sum of the ballots variable of each collection
        return model.total_ballots == sum(ballots_var for (ballots_var,_) in list(collection_to_vars_dict.values()))
    model.total_ballots_constraint = Constraint(rule=total_ballots_rule)

def add_avg_output_price_constraint(model, collection_dict, collection_to_vars_dict):
    def avg_output_price_rule(model):
        # skin prices for each collection. For example [skin_prices_collectionA, skin_prices_collectionB, ...]
        estimated_output_price = 0
        for (collection_name, collection) in list(collection_dict.items()):
            (_, output_skins) = collection
            (_, collection_probs_var) = collection_to_vars_dict[collection_name]
            for skin in output_skins:
                # each output_skin is a tuple (output_var, skin_name, skin_prices, skin_bounded_floats)
                output_var = skin[0] # output_var is at index 0
                skin_name = skin[1] # skin_name is at index 1
                prices_per_float = skin[2] # skin_prices is at index 2
                sum_prices = sum(output_var[i] * prices_per_float[i] for i in output_var if prices_per_float[i] is not None) # get the skin price with the corresponding float
                # we can index collection_probs_var by skin_name
                # we multiply the price of the skin by its probability
                estimated_output_price += collection_probs_var[skin_name] * sum_prices 

        return model.average_output_price == estimated_output_price
    model.avg_output_price_constraint = Constraint(rule=avg_output_price_rule)

def add_ballots_per_collection_constraints(model, collection_dict, collection_to_vars_dict):
    model.ballots_per_collection_constraint = ConstraintList()
    for (collection_name, collection) in list(collection_dict.items()):
        (_, output_skins) = collection
        (collection_ballots_var, collection_probs_var) = collection_to_vars_dict[collection_name]
        for skin in output_skins:
            skin_name = skin[1] # skin_name is at index 1
            constraint = collection_ballots_var == collection_probs_var[skin_name] * len(output_skins) * model.total_ballots
            model.ballots_per_collection_constraint.add(constraint)
            
def calculate_profit_percentage(model, collection_dict, collection_to_vars_dict):
    profit_percentage = 0
    for (collection_name, collection) in list(collection_dict.items()):
        (_, output_skins) = collection
        (_, collection_probs_var) = collection_to_vars_dict[collection_name]
        for skin in output_skins:
            output_var = skin[0] # output_var is at index 0
            skin_name = skin[1] # skin_name is at index 1
            prices_per_float = skin[2] # skin_prices is at index 2
            skin_price = sum(output_var[i] * prices_per_float[i] for i in output_var if prices_per_float[i] is not None) # get the skin price with the corresponding float
            probs_var = collection_probs_var[skin_name]
            if skin_price() > model.input_skins_cost() * 1.13:
                profit_percentage += probs_var()
    return profit_percentage
            
def solve_tradeup(trade_up_pool, collection_names_subset=None, ratio=0.5):
    model = ConcreteModel()

    collection_dict, all_input_skins, all_output_skins = define_model_variables(model, trade_up_pool, collection_names_subset, ratio)
    if len(all_input_skins) == 0 or len(all_output_skins) == 0:
        # can't solve if there are no input or output skins
        return 0
    collection_to_vars_dict = define_ballots_probs_variables(model, collection_dict)
    
    model.avg_input_float = Var(domain=NonNegativeReals, bounds=(0,1))
    model.total_ballots = Var(domain=NonNegativeIntegers, bounds=(10, 80))
    define_objective_rule(model)

    define_input_skins_cost_constraint(model, all_input_skins)
    define_total_skins_constraint(model, all_input_skins)
    define_avg_float_constraint(model, all_input_skins)
    add_float_bound_constraints(model, all_output_skins)
    add_total_ballots_constraint(model, collection_to_vars_dict)

    add_avg_output_price_constraint(model, collection_dict, collection_to_vars_dict)
    add_ballots_per_collection_constraints(model, collection_dict, collection_to_vars_dict)
    # bonmin seems to work but is only for convex problems MINLP. non-convex finds only local solution
    #solver = SolverFactory('bonmin') # finds local max
    solver = SolverFactory('couenne') # finds global max
    # Adding options to the solver to enable the intermediate solution callback

    result = solver.solve(model, tee=True)

    # Display results
    # model.pprint() 
    
    # print count variables
    for (skin_count_var, _, _) in all_input_skins:
        if any(skin_count_var[idx]() > 0 for idx in skin_count_var):
            print(skin_count_var)
            for index in skin_count_var:
                print(" ", index, skin_count_var[index].value)
    
    # print all output variables
    for (output_var, _, _, _) in all_output_skins:
        print(output_var)
        for index in output_var:
            print(" ", index, output_var[index].value)
            
    # print input skins cost
    print(f"Input skins cost: {model.input_skins_cost.value}")
            
    # print output skins cost
    print(f"Average output price: {value(model.average_output_price)}")
            
    # print average input float
    print(f"Average input float: {model.avg_input_float.value}")
            
    # print total ballots
    print(f"Total ballots: {model.total_ballots.value}")
    
    # print probs var
    for (collection_name, _) in list(collection_dict.items()):
        (_, collection_probs_var) = collection_to_vars_dict[collection_name]
        print(f"Collection name: {collection_name}")
        if any(collection_probs_var[idx].value > 0 for idx in collection_probs_var):
            for index in collection_probs_var:
                print(" ", index, collection_probs_var[index].value)
                
    # Display the final objective function value
    final_objective_value = value(model.objective)
    print(f"Objective value: {model.obj()}")
                
    # Display the Profit percentage, that is, the odds of getting profit on this tradeup (including steam tax)
    profit_pctg = calculate_profit_percentage(model, collection_dict, collection_to_vars_dict)
    print(f"Profit percentage: {profit_pctg}")
    return final_objective_value, profit_pctg, model.input_skins_cost.value
