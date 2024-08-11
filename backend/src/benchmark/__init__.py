import time
from datetime import datetime
import os
import gc
import statistics

from backend.src.solvers.solver_manager import SearchSpace
from backend.src.main import solve

log_file_name = 'benchmarks_log.txt'
script_dir = os.path.dirname(__file__) #<-- absolute dir the script is in
output_file_path = os.path.join(script_dir, log_file_name)

# decorator to measure time and register results
def benchmark_time(log_file=output_file_path, num_runs=5, warmup_runs=1):
    def decorator(func):
        def wrapper(*args, **kwargs):
            times = []
            # Warm-up runs
            for _ in range(warmup_runs):
                func(*args, **kwargs)

            # Measured runs
            for _ in range(num_runs):
                start_time = time.time()
                result = func(*args, **kwargs)
                end_time = time.time()
                times.append(end_time - start_time)

            average_time = statistics.mean(times)
            log_message = f"Function '{func.__name__}' average over {num_runs} runs: {average_time:.4f} seconds\n"
            with open(log_file, 'a') as file:
                file.write(log_message)
            return result
        return wrapper
    return decorator

# BENCHMARKS

@benchmark_time()
def benchmark1():
    gc.collect()
    search_space = SearchSpace(range(1,37), [0.3], ["milspec_bg"], [False], 'single')
    solve(search_space)

@benchmark_time()
def benchmark2():
    gc.collect()
    search_space = SearchSpace(range(1,10), [0.5], ["milspec_bg"], [False], 'double')
    solve(search_space)

@benchmark_time()
def benchmark3():
    gc.collect()
    search_space = SearchSpace(range(1,10), [0.3], ["industrial_bg"], [False], 'all')
    solve(search_space)

def run_benchmarks(name=None):
    current_time = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    log_message = f"\n{current_time} - {name}\n"
    with open(output_file_path, 'a') as file:
        file.write(log_message)

    benchmark1()
    benchmark2()
    benchmark3()
