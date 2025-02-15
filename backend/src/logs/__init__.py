import os

script_dir = os.path.dirname(__file__) #<-- absolute dir the script is in

def get_output_log_path(log_file_name):
    return os.path.join(script_dir, log_file_name)