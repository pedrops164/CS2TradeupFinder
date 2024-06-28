from pyomo.environ import *
from pyomo.opt import SolverFactory, OptSolver
import re
from io import StringIO

ballots_max = 100
num_of_input_skins = 10

def sanitize_variable_name(name):
    """Sanitize variable names by keeping only letters, digits, spaces, and |"""
    sanitized_name = re.sub(r"[^\w\s|]", "_", name)
    return sanitized_name

def define_collections(model, trade_up_pool, collection_names_subset, ratio):
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
            skin_name = skin.get_name()
            skin_prices, _ = skin.get_prices()
            skin_floats = skin.get_median_floats(ratio=ratio)
            num_floats = len(skin_floats)
            assert len(skin_prices) == len(skin_floats)
            
            var_name = sanitize_variable_name(f"{skin.name}_count")
            skin_count_var = Var(range(num_floats), model.input_count_set, within=Binary)
            setattr(model, var_name, skin_count_var)
            for cond, price in enumerate(skin_prices):
                if price is None:
                    for n in model.input_count_set:
                        skin_count_var[cond, n].fix(0)

            input_skin = (skin_count_var, skin_prices, skin_floats, skin_name)
            input_skins.append(input_skin)
            all_input_skins.append(input_skin)
        for skin in collection.output_skins:
            skin_name = skin.get_name()
            skin_prices, _ = skin.get_prices()
            skin_bounded_floats = skin.get_bounded_floats()
            assert len(skin_prices) == len(skin_bounded_floats)
            # set None prices to 0 so that those output skin conditions don't get chosen
            skin_prices = [0 if price is None else price for price in skin_prices]

            var_name = sanitize_variable_name(f"{skin.name}_output")
            output_var = Var(range(len(skin_bounded_floats)), within=Binary)
            setattr(model, var_name, output_var)

            output_skin = (output_var, skin_name, skin_prices, skin_bounded_floats)
            output_skins.append(output_skin)
            all_output_skins.append(output_skin)
        collection_dict[collection.name] = (input_skins, output_skins)

    return collection_dict, all_input_skins, all_output_skins

def define_objective_rule(model, all_input_skins, max_average_output_price, min_total_input_skins_cost):
    # we want to maximize profit percentage. So we want to maximize the avg output price divided by the input skins cost
    model.objective_constraints = ConstraintList()
    def new_objective_rule(model):
        """
        the objective function is model.average_output_price / model.input_skins_cost
        We want to maximize it, but this is non linear (division of two variables).
        model.average_output_price is a continuous variable, and model.input_skins_cost is a sum of weighted binary variables.
        In order to linearize this, we're going to set an auxiliary variable z equal to the objective function. z = model.average_output_price / model.input_skins_cost
        Division is harder to linearize than multiplication. So we'll do z * model.input_skins_cost = model.average_output_price.
        The first term is a product of continuous by binary, so it's easy to linearize.
        The max value of z happens when model.average_output_price is maximal and model.input_skins_cost is minimal.
        maximal for model.average_output_price depends (price of most expensive skin)
        minimal for model.input_skins_cost is the price of the cheapest input skin multiplied by 10 (10 input skins)
        The binary variable is also multiplied by count and price. Max count is 10
        So big_M = max(z) * max(count) * max(price)
        The big_M value should be as tight as it can be. Same goes for the max value of z.
        
        Additionally, we're going to create auxiliary y constraints for each binary variable in model.input_skins_cost.
        And add an additional constraint to make sure sum(y) == model.average_output_price
        
        count_variable -> binary variable {0,1}
        model.average_output_price -> continuous variable
        """
        max_z_objective = max_average_output_price / min_total_input_skins_cost
        y_variables = []
        z_objective = Var(within=NonNegativeReals, initialize=0.0)
        setattr(model, f"z_objective", z_objective)
        for (skin_count_var, skin_prices, _, skin_name) in all_input_skins:
            columns = model.input_count_set # count constants for each binary variable

            for i in range(len(skin_prices)):
                price = skin_prices[i]
                if price is not None:
                    for count in columns:
                        """
                        y = z_objective * count * price * binary_variable
                        sum(y) = model.average_output_price
                        
                        Linearization constraints, with big-M method:
                        y >= 0
                        y <= z_objective * count * price
                        y <= binary_variable * big_M
                        y >= z_objective * count * price - (1 - binary_variable) * big_M
                        """
                        big_M = (max_z_objective * num_of_input_skins * price)# + 0.1
                        print(f"big_M_{skin_name}_{i}: {big_M}")
                        binary_variable = skin_count_var[i, count] # count variable
                        # our continuous variable is the inverse of the average output price of the tradeup, multiplied by the count of the input skin and its price
                        continuous_variable = z_objective * count * price
                        y = Var(within=NonNegativeReals, initialize=0.0)
                        setattr(model, f"z_objective_{skin_name}_{i}_{count}", y)
                        model.objective_constraints.add(y >= 0)
                        model.objective_constraints.add(y <= continuous_variable)
                        model.objective_constraints.add(y <= binary_variable * big_M)
                        model.objective_constraints.add(y >= continuous_variable - (1 - binary_variable) * big_M)
                        y_variables.append(y)
        model.objective_constraints.add(sum(y_variables) == model.average_output_price)
        return z_objective
        #return model.input_skins_cost

    model.objective = Objective(rule=new_objective_rule, sense=maximize)

def define_input_skins_cost_constraint(model, all_input_skins):
    input_skins_cost = 0
    for (skin_count_var, skin_prices, _, _) in all_input_skins:
        # Access the index set
        index_set = skin_count_var.index_set()
        # Get the second component of the index set
        columns = set(idx[1] for idx in index_set)

        for i in range(len(skin_prices)):
            if skin_prices[i] is not None:
                condition_cost = sum(count * skin_count_var[i, count] * skin_prices[i] for count in columns)
                input_skins_cost += condition_cost
                
    def input_skins_cost_rule(model):
        return model.input_skins_cost == input_skins_cost
    model.input_skins_cost_constraint = Constraint(rule=input_skins_cost_rule)

def define_total_skins_constraint(model, all_input_skins):
    # Total skins constraint
    
    """
    Constraints that ensure for each skin condition that at most one binary variable is activated.
    For example, for a particular skin and condition, there can't be simultaneously 3 and 5 amounts of that particular skin condition.
    """
    model.unique_skin_cond_constraints = ConstraintList()
    def total_skins_constraint(model):
        # trade up must have 10 input skins. So the sum of all skin count variables is 10
        total_count = 0
        for (skin_count_var, skin_prices,_,_) in all_input_skins:
            # Access the index set
            index_set = skin_count_var.index_set()
            # Get the second component of the index set
            columns = set(idx[1] for idx in index_set)
            for i in range(len(skin_prices)):
                skin_cond_count = sum(skin_count_var[i, count] for count in columns)
                unique_constraint = (0, skin_cond_count, 1) # 0 <= skin_cond_count <= 1
                model.unique_skin_cond_constraints.add(unique_constraint)
                skin_cond_count = sum(count * skin_count_var[i, count] for count in columns)
                total_count += skin_cond_count
        return total_count == 10
    model.total_skins_constraint = Constraint(rule=total_skins_constraint)

def define_avg_float_constraint(model, all_input_skins):
    # Average float constraint
    def avg_float_constraint(model):
        float_sum = 0
        for (skin_count_var, _, skin_float, _) in all_input_skins:
            # Access the index set
            index_set = skin_count_var.index_set()
            # Get the second component of the index set
            columns = set(idx[1] for idx in index_set)
            for i in range(len(skin_float)):
                skin_cond_float = sum(count * skin_count_var[i, count] * skin_float[i] for count in columns)
                float_sum += skin_cond_float
            
        return model.avg_input_float == float_sum / 10

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
        M = 1  # A large constant, big-M
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
    model.ballots_constraints = ConstraintList()

    collection_names = [collection_name for (collection_name,_) in list(collection_dict.items())] # skin name is in index 1 of the tuple (output_var, skin_name, skin_prices, skin_bounded_floats)
    # set the variable which holds the probabilities of the skins for each collection
    model.collection_probs_var = Var(collection_names, within=NonNegativeReals, bounds=(0,1))
    for collection_num, (collection_name, collection) in enumerate(list(collection_dict.items())):
        (input_skins, output_skins) = collection

        # set the variable that holds the number of ballots of the current collection
        collection_ballots_var = Var(within=NonNegativeIntegers, bounds=(0, ballots_max))
        setattr(model, f"collection_{collection_num}_ballots", collection_ballots_var)
        # Each input skin is a tuple (skin_count_var, skin_prices, skin_floats, skin_name))
        skin_count = 0
        for (skin_count_var,_,_,_) in input_skins:
            for (cond, count) in skin_count_var:
                skin_count += count * skin_count_var[cond, count]
        model.ballots_constraints.add(collection_ballots_var == len(output_skins) * skin_count)

        
        # map the current collection to its variables, to set the constraints later
        collection_to_vars_dict[collection_name] = collection_ballots_var

    return collection_to_vars_dict

def add_total_ballots_constraint(model, collection_to_vars_dict):
    # Constraint for total_ballots
    def total_ballots_rule(model):
        # total ballots is the sum of the ballots variable of each collection
        return model.total_ballots == sum(ballots_var for ballots_var in list(collection_to_vars_dict.values()))
    model.total_ballots_constraint = Constraint(rule=total_ballots_rule)

def add_avg_output_price_constraint(model, collection_dict):
    def avg_output_price_rule(model):
        # skin prices for each collection. For example [skin_prices_collectionA, skin_prices_collectionB, ...]
        
        # in the big M method, M is the upper bound of the continuous variable. In this case the range is [0,1], but it multiplies by
        # the price, therefore the upper bound is the max price. We'll put M=3000 to make sure
        z_variables = []
        model.z_constraints = ConstraintList()
        for (collection_name, collection) in list(collection_dict.items()):
            (_, output_skins) = collection
            prob = model.collection_probs_var[collection_name]
            for skin in output_skins:
                # each output_skin is a tuple (output_var, skin_name, skin_prices, skin_bounded_floats)
                # we can index collection_probs_var by skin_name
                # we multiply the price of the skin by its probability
                output_var = skin[0] # output_var is at index 0
                skin_name = skin[1] # skin_name is at index 1
                prices_per_float = skin[2] # skin_prices is at index 2
                for i in output_var:
                    if prices_per_float[i] is not None:
                        """
                        z = collection_probs_var[skin_name] * sum_prices   ->   Non Linear! Need to linearize!
                        collection_probs_var is a continuous variable, range [0,1]
                        sum_prices is a binary variable, {0,1}
                        Linearization constraints, with big-M method:
                        z >= 0
                        z <= sum_prices * M <=> z <= sum_prices
                        z <= collection_probs_var
                        z >= collection_probs_var - (1 - sum_prices) * M <=> collection_probs_var - (1 - sum_prices)
                        """
                        ov = output_var[i] # binary variable, range {0,1}
                        pf = prices_per_float[i] # parameter (constant), non negative real
                        big_M = pf
                        #big_M = max_average_output_price
                        z = Var(within=NonNegativeReals, initialize=0.0) # z = ov * prob * pf
                        setattr(model, f"z_{skin_name}_{i}", z)
                        model.z_constraints.add(z >= 0)
                        model.z_constraints.add(z <= ov * big_M)
                        model.z_constraints.add(z <= prob*pf)
                        model.z_constraints.add(z >= prob*pf - (1 - ov)*big_M)
                        z_variables.append(z)
                    else:
                        output_var[i].fix(0)

        return model.average_output_price == sum(z_variables)
    model.avg_output_price_constraint = Constraint(rule=avg_output_price_rule)

def add_ballots_per_collection_constraints(model, collection_dict, collection_to_vars_dict):
    model.ballots_per_collection_constraints = ConstraintList()
    for (collection_name_1, collection_1) in list(collection_dict.items()):
        (input_skins_1, output_skins_1) = collection_1
        n_output_skins_1 = len(output_skins_1) # constant
        collection_ballots_var_1 = collection_to_vars_dict[collection_name_1]
        prob_var = model.collection_probs_var[collection_name_1]
        z_variables = []
        """
        constraint = collection_ballots_var == prob_var * n_output_skins * model.total_ballots -> Non Linear constraint!
        We need to linearize it. To do that, we need to loop through each of the ballots var
        
        model.total_ballots is a sum of binary variables, where each binary variable is multiplied by a constant (which is the number of output
        skins in the respective output collection). These binary variables are the count variables of the input skins.
        So we loop through the input skins and create constraints for each of the input skins' count variables
        """
        for (collection_name_2, collection_2) in list(collection_dict.items()):
            (input_skins_2, output_skins_2) = collection_2
            n_output_skins_2 = len(output_skins_2) # constant
            for (skin_2_count_var,_,_,input_skin_2_name) in input_skins_2:
                for (cond, count) in skin_2_count_var:
                    if skin_2_count_var[cond, count].fixed:
                        #print(f"{input_skin_2_name},{cond},{count} is fixed")
                        continue
                    """
                    model.total_ballots = sum(ballots_var)
                    ballots_var_i = n_output_skins_i * sum(skin_count)
                    skin_count_i = sum(count_j * skin_count_var_j)
                    
                    We have
                    w = prob_var * n_output_skins_1 * model.total_ballots -> non linearity to solve. Not solvable in this format. Simplifying below
                                        \/
                    y = prob_var * n_output_skins_1 * ballots_var_i = prob_var * n_output_skins_1 * n_output_skins_i * sum(skin_count)
                                        \/
                    x = prob_var * n_output_skins_1 * n_output_skins_i * skin_count_i = prob_var * n_output_skins_1 * n_output_skins_i * sum(count_j * skin_count_var_j)
                                        \/
                    z = prob_var * n_output_skins_1 * n_output_skins_i * count_j * skin_count_var_j -> Not Linear, can convert to linear
                    prob_var is a continuous variable [0,1], and skin_count_var_j is a binary variable {0,1}
                    
                    Need to define big_M which will be upper bound of prob_var multiplied by the constants
                    Upper bound of n_output_skins is 9, so upper bound of n_output_skins^2 is 81 whatever the collection is
                    upper_bound of count_j is 10 because it represents the number of skins that the binary variable activates. Given that a tradeup
                    has a maximum of 10 input skins, the max of count if 10 whatever the skin is.
                    So an upperbound of prob_var * n_output_skins_1 * n_output_skins_i * count_j can be 1*81*10 = 810,
                    but we round to 1000 for good measure
                        
                        Linearization constraints, with big-M method:
                        z >= 0
                        z <= skin_count_var * M
                        z <= prob_var * n_output_skins_1 * n_output_skins_j * count_j
                        z >= prob_var * n_output_skins_1 * n_output_skins_j * count_j - (1 - skin_count_var) * M <=>
                    """
                    continuous_var_constants = n_output_skins_1 * n_output_skins_2 * count
                    big_M = continuous_var_constants # upper bound of continuous var is 1 (range is [0,1]), and we multiply it by the constants to make big_M
                    #big_M = 1000
                    z = Var(within=NonNegativeReals, initialize=0.0) # z = ov * prob * pf
                    model.ballots_per_collection_constraints.add(z >= 0)
                    model.ballots_per_collection_constraints.add(z <= skin_2_count_var[cond, count] * big_M)
                    model.ballots_per_collection_constraints.add(z <= prob_var * n_output_skins_1 * n_output_skins_2 * count)
                    model.ballots_per_collection_constraints.add(z >= prob_var * n_output_skins_1 * n_output_skins_2 * count - (1 - skin_2_count_var[cond, count])*big_M)
                    z_variables.append(z)
                    setattr(model, f"z_{collection_name_1}_{collection_name_2}_{input_skin_2_name}_{cond}_{count}", z)
        collection_ballots_constraint = collection_ballots_var_1 == sum(z_variables)
        model.ballots_per_collection_constraints.add(collection_ballots_constraint)
            
def calculate_profit_percentage(model, collection_dict):
    profit_percentage = 0
    for (collection_name, collection) in list(collection_dict.items()):
        (_, output_skins) = collection
        collection_probs_var = model.collection_probs_var[collection_name]
        probs_var = collection_probs_var[collection_name]
        for skin in output_skins:
            output_var = skin[0] # output_var is at index 0
            skin_name = skin[1] # skin_name is at index 1
            prices_per_float = skin[2] # skin_prices is at index 2
            skin_price = sum(output_var[i] * prices_per_float[i] for i in output_var if prices_per_float[i] is not None) # get the skin price with the corresponding float
            if skin_price() > model.input_skins_cost() * 1.13:
                profit_percentage += probs_var()
    return profit_percentage
       
def solve_tradeup(trade_up_pool, collection_names_subset=None, ratio=0.5, log=False):
    model = ConcreteModel()
    
    model.input_count_set = Set(initialize=list(range(1,11)))
    
    # variable that contains the total cost of the input skins
    model.input_skins_cost = Var(domain=NonNegativeReals)
    # variable that contains the average price of the resulting skins of the tradeup (output skins)
    model.average_output_price = Var(domain=NonNegativeReals)
    # variable that contains the average input float
    model.avg_input_float = Var(domain=NonNegativeReals, bounds=(0,1))

    collection_dict, all_input_skins, all_output_skins = define_collections(model, trade_up_pool, collection_names_subset, ratio)
    if len(all_input_skins) == 0 or len(all_output_skins) == 0:
        # can't solve if there are no input or output skins
        return 0
    
    max_input_skin_price = max(max(skin_prices) for (_,skin_prices,_,_) in all_input_skins)
    min_total_input_skins_cost = num_of_input_skins * min(min(skin_prices) for (_,skin_prices,_,_) in all_input_skins)
    max_output_skin_price = max(max(skin_prices) for (_,_,skin_prices,_) in all_output_skins)
    
    collection_to_vars_dict = define_ballots_probs_variables(model, collection_dict)
    
    define_objective_rule(model, all_input_skins, max_output_skin_price, min_total_input_skins_cost)

    define_input_skins_cost_constraint(model, all_input_skins)
    define_total_skins_constraint(model, all_input_skins)
    define_avg_float_constraint(model, all_input_skins)
    add_float_bound_constraints(model, all_output_skins)
    
    #model.total_ballots = Var(domain=NonNegativeIntegers, bounds=(10, 90))
    #add_total_ballots_constraint(model, collection_to_vars_dict)
    add_avg_output_price_constraint(model, collection_dict)
    add_ballots_per_collection_constraints(model, collection_dict, collection_to_vars_dict)
    
    solver = SolverFactory('gurobi') # linear solver
    result = solver.solve(model, tee=True, symbolic_solver_labels=True)

    if log:
        # Display results
        model.pprint() 
        var_textbuffer = StringIO()
        constraint_textbuffer = StringIO()
        for v in model.component_objects(Var, descend_into=True):
            v.pprint(var_textbuffer)
            var_textbuffer.write('\n')
            
        for v in model.component_objects(Constraint, descend_into=True):
            v.pprint(constraint_textbuffer)
            constraint_textbuffer.write('\n')
        with open('logs/vars.txt', 'w') as outputfile_vars:
            outputfile_vars.write(var_textbuffer.getvalue())
        with open('logs/constraints.txt', 'w') as outputfile_constraints:
            outputfile_constraints.write(constraint_textbuffer.getvalue())
    
    # print count variables
    for (skin_count_var, _, _, _) in all_input_skins:
        #if any(skin_count_var[idx]() > 0 for idx in skin_count_var):
        print(skin_count_var)
        for index in skin_count_var:
            if skin_count_var[index].value > 0:
                print(" ", index, skin_count_var[index].value)
    
    # print all output variables
    for (output_var, _, _, _) in all_output_skins:
        print(output_var)
        for index in output_var:
            print(" ", index, output_var[index].value)
    
    # print input skins cost
    print(f"Input skins cost: {model.input_skins_cost.value}")
            
    # print average input float
    print(f"Average input float: {model.avg_input_float.value}")
                
    # Display the final objective function value
    final_objective_value = value(model.objective)
    print(f"Objective value: {final_objective_value}")
    return final_objective_value, 0, model.input_skins_cost.value
    # return final_objective_value, profit_pctg, model.input_skins_cost.value
