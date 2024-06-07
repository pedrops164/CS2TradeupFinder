from pyomo.environ import *
from pyomo.opt import SolverFactory, SolverStatus, TerminationCondition
from presets.tradeups import load_tradeup_2
import re

def sanitize_variable_name(name):
    """Sanitize variable names by keeping only letters, digits, spaces, and |"""
    sanitized_name = re.sub(r"[^\w\s|]", "_", name)
    return sanitized_name

def define_model_variables(model, trade_up_pool):
    
    # variable that contains the total cost of the input skins
    model.input_skins_cost = Var(domain=NonNegativeReals)

    # variable that contains the average price of the resulting skins of the tradeup (output skins)
    model.average_output_price = Var(domain=NonNegativeReals)

    # Dynamically create variables for input skins
    collection_dict = {} # maps collection name to collection. Collection name is unique
    all_input_skins = []
    all_output_skins = []
    for collection in trade_up_pool.collections:
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
            skin_floats = skin.get_median_floats(ratio=0.2)
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
        return model.average_output_price / model.input_skins_cost

    model.objective = Objective(rule=new_objective_rule, sense=maximize)

def solve_tradeup(trade_up_pool=load_tradeup_2()):
    model = ConcreteModel()

    collection_dict, all_input_skins, all_output_skins = define_model_variables(model, trade_up_pool)

    input_skins_cost = sum(sum(skin_count_var[i] * skin_prices[i] for i in range(len(skin_prices)) if skin_prices[i] is not None) for (skin_count_var, skin_prices, _) in all_input_skins)
        
    def input_skins_cost_rule(model):
        return model.input_skins_cost == input_skins_cost
    model.input_skins_cost_constraint = Constraint(rule=input_skins_cost_rule)

    define_objective_rule(model)

    # Total skins constraint
    def total_skins_constraint(model):
        # trade up must have 10 input skins. So the sum of all skin count variables is 10
        if len(all_input_skins) > 0:
            return sum(sum(skin_count_var[i] for i in range(len(skin_prices))) for (skin_count_var, skin_prices, _) in all_input_skins) == 10
        else:
            return Constraint.Infeasible
    model.total_skins_constraint = Constraint(rule=total_skins_constraint)

    model.avg_input_float = Var(domain=NonNegativeReals, bounds=(0,1))
    """
    Average float constraint
    """
    def avg_float_constraint(model):
        return model.avg_input_float == sum(sum(skin_count_var[i] * skin_float[i] for i in range(len(skin_float))) for (skin_count_var, _, skin_float) in all_input_skins) / 10
        #return model.avg_input_float >= 0.0

    model.avg_float_constraint = Constraint(rule=avg_float_constraint)




    M = 10  # A large constant, big-M

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



    model.total_ballots = Var(domain=NonNegativeIntegers, bounds=(10, 80))

    collection_to_vars_dict = {}

    collection_num = 0
    for (collection_name, collection) in list(collection_dict.items()):
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

        # create the collection count
        collection_num += 1

    # Constraint for total_ballots
    def total_ballots_rule(model):
        # total ballots is the sum of the ballots variable of each collection
        return model.total_ballots == sum(ballots_var for (ballots_var,_) in list(collection_to_vars_dict.values()))
    model.total_ballots_constraint = Constraint(rule=total_ballots_rule)

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

    model.ballots_per_collection_constraint = ConstraintList()
    def add_ballots_per_collection_constraints():
        for (collection_name, collection) in list(collection_dict.items()):
            (_, output_skins) = collection
            (collection_ballots_var, collection_probs_var) = collection_to_vars_dict[collection_name]
            for skin in output_skins:
                skin_name = skin[1] # skin_name is at index 1
                constraint = collection_ballots_var == collection_probs_var[skin_name] * len(output_skins) * model.total_ballots
                model.ballots_per_collection_constraint.add(constraint)
    add_ballots_per_collection_constraints()


    # bonmin seems to work but is only for convex problems MINLP. non-convex finds only local solution
    solver = SolverFactory('bonmin')
    # Adding options to the solver to enable the intermediate solution callback
    result = solver.solve(model, tee=True)

    # Display results
    model.pprint()

    # Print the optimized values of the variables
    for v in model.component_objects(Var, active=True):
        print("Variable", v)
        varobject = getattr(model, str(v))
        for index in varobject:
            print(" ", index, varobject[index].value)
