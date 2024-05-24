from db import create_database, update_skin_price, get_all_skins
from solver_entities import Skin

# module to deal with proxies
from proxy import is_proxy_working
# measure elapsed time
import time

# thread pool mechanism
from concurrent.futures import ThreadPoolExecutor, as_completed

# module to implement task queue with skins chunks
from queue import Queue

# import valid proxies
from proxy import get_valid_proxies

# implement logging to file
import logging
# Configure logging
logging.basicConfig(filename='worker_logs.log', level=logging.INFO, filemode='w',
                    format='%(asctime)s - %(threadName)s - %(levelname)s - %(message)s')

"""
Code ran by each of the worker threads
While the task queue isn't empty, they pop a chunk of skins, and update their prices
"""
def worker_thread(task_queue, proxy=None):
    while not task_queue.empty():
        try:
            skins_chunk = task_queue.get(block=False)
        except:
            logging.error("Couldn't retrieve item from task queue")
            break

        for skin_dict in skins_chunk:
            logging.info(skin_dict)
            ret = update_skin_price(skin_dict, proxy)
            if ret:
                logging.info("Worker updated skin price")
            else:
                # update didn't go fine, so we stop
                logging.warning("Stopping worker thread")
                return
    logging.info("Worker thread finished")

"""
This function receives the proxy list and launches one worker for each proxy
We assume proxies are valid
"""
def launch_workers(proxies):
    if len(proxies) == 0:
        logging.warning("Empty proxies array")
        return False

    # we will have one workers for each proxy.
    # Each worker
    n_workers = len(proxies)

    # get the skins from db
    skins = get_all_skins()

    # chunk size represents the amount of skins each thread will process at a time
    chunk_size = len(skins) // (n_workers)

    # define the queue that holds the tasks (a task is simply a list of skins to be updated)
    task_queue = Queue()
    for i in range(0, len(skins), chunk_size):
        task_queue.put(skins[i:i + chunk_size])

    future_results = []
    with ThreadPoolExecutor(max_workers=n_workers) as executor:
        for proxy in proxies:
            result = executor.submit(worker_thread, task_queue, proxy)
            future_results.append(result)

        for future in as_completed(future_results):
            try:
                future.result()
            except Exception as e:
                print(f"Worker thread generated an exception: {e}")

    logging.info("All worker threads have finished")
    
if __name__ == '__main__':
    create_database()
    proxies = get_valid_proxies()
    start = time.time()
    launch_workers(proxies)
    end = time.time()
    logging.info(f"Elapsed time on the workers: {end-start:.2f}s")
