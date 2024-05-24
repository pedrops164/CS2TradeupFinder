#from solver_entities import *
import time  # Import the time module to access time functions
import requests  # Import the requests library to handle HTTP requests

# Initialize a global variable to store the time of the last request
# Steam bans this ip for some time if it gets more than 20 requests in one minute.
last_request_time = None

def updateSkinPrice(skin):
    skin_name = skin.get_name()
    bounded_floats = skin.get_bounded_floats()

    # Define condition names based on typical float ranges
    condition_names = {
        (0, 0.07): 'Factory New',
        (0.07, 0.15): 'Minimal Wear',
        (0.15, 0.37): 'Field-Tested',
        (0.37, 0.45): 'Well-Worn',
        (0.45, 1): 'Battle-Scarred'
    }

    # List to hold the available conditions for this skin
    available_conditions = []

    # Map bounded_floats to condition names
    print(bounded_floats)
    for start, end in bounded_floats:
        # Check each defined condition range to see if it matches or intersects
        for range_key, condition_name in condition_names.items():
            if start >= range_key[0] and end <= range_key[1]:
                # If the ranges intersect, add the condition name if it's not already included
                if condition_name not in available_conditions:
                    available_conditions.append(condition_name)

    print(available_conditions)
    for condition in available_conditions:
        lowest_price = makeRequest(skin.stattrak, skin_name, condition)
        if lowest_price != "N/A":
            skin.updateConditionPrice(condition, lowest_price)
            print(f"Updated skin {skin_name}'s price to {lowest_price}")

def makeRequest(is_StatTrak, skin_name, skin_condition):
    print(f"Making request: {skin_name}, {skin_condition}, {is_StatTrak}")
    global last_request_time  # Declare the variable as global to modify it
    statTrak = "StatTrak%E2%84%A2 " if is_StatTrak else ""

    attempts = 0
    max_attempts = 5

    while attempts < max_attempts:
        # Calculate the time since the last request
        current_time = time.time()
        if last_request_time is not None:
            elapsed_time = current_time - last_request_time
            delay = 3 - elapsed_time
            if delay > 0:
                time.sleep(delay)

        # Update the last_request_time to the current time just before making the request
        last_request_time = time.time()

        # Construct the URL
        # example: http://steamcommunity.com/market/priceoverview/?appid=730&currency=3&market_hash_name=StatTrak%E2%84%A2 M4A1-S | Hyper Beast (Minimal Wear)
        # this url returns a json {"success":true,"lowest_price":"261,35&#8364; ","volume":"11","median_price":"269,52&#8364; "}
        # we only need lowest_price
        url = f"http://steamcommunity.com/market/priceoverview/?appid=730&currency=3&market_hash_name={statTrak}{skin_name} ({skin_condition})"

        try:
            # Make the HTTP request
            response = requests.get(url)
            response.raise_for_status()  # Raises an HTTPError for bad responses

            # Parse the JSON response
            data = response.json()
            if data["success"] and "lowest_price" in data:
                # Clean up the price string
                price_str = data["lowest_price"].replace(",", ".").replace("€", "").strip()
                # Replace any non-numeric, non-dot characters
                price_str = ''.join([c for c in price_str if c.isdigit() or c == '.'])

                # Try to convert the cleaned string to float
                if price_str:  # Ensure the string is not empty
                    return float(price_str)
                else:
                    raise ValueError("Price string is empty after cleaning.")
        except requests.RequestException as e:
            # Handle any errors that occur during the request
            print(f"Attempt {attempts + 1} failed: {e}")

        # Increment the attempt counter
        attempts += 1
        time.sleep(3)  # Ensure to wait at least 3 seconds before retrying

    # Return Not Available if all retries are exhausted
    return "N/A"

# if __name__ == '__main__':
#     skin_input1 = Skin("SCAR-20 | Jungle Slipstream", 0, 0.5)
#     updateSkinPrice(skin_input1)
#     prices = list(skin_input1.prices.values())
#     print(prices)