from db import update_skin_price, get_all_skins
from entities import Skin

# module to deal with proxies
from proxy.proxy import is_proxy_working
# measure elapsed time
import time

# thread pool mechanism
from concurrent.futures import ThreadPoolExecutor, as_completed

# module to implement task queue with skins chunks
from queue import Queue
from threading import Lock, Event

# import valid proxies
from proxy.proxy import get_valid_proxies

# implement logging to file
import logging
# Configure logging
logging.basicConfig(level=logging.INFO,
                    handlers=[
                        logging.FileHandler("logs/debug.log", mode='w'),
                        logging.StreamHandler()
                    ],
                    format='%(asctime)s - %(threadName)s - %(levelname)s - %(message)s')

# Global variables to track progress
total_skins_updated = 0
total_skins = 0
update_percentage_threshold = 0
# update percentage threshold change amount at each update
update_percentage_jumps = 2
lock = Lock()
stop_event = Event()

"""
Code ran by each of the worker threads
While the task queue isn't empty, they pop a chunk of skins, and update their prices
"""
def worker_thread(task_queue, proxy=None):
    global total_skins_updated
    global total_skins
    global update_percentage_threshold
    global lock

    while not stop_event.is_set() and not task_queue.empty():
        try:
            skins_chunk = task_queue.get(block=False)
        except:
            logging.error("Couldn't retrieve item from task queue")
            break

        for skin_dict in skins_chunk:
            if stop_event.is_set():
                logging.info("Stop event set, exiting worker thread.")
                return
            logging.info(skin_dict)
            ret = update_skin_price(skin_dict, proxy) # -> method has been removed
            if ret:
                logging.info("Worker updated skin price")
                with lock:
                    total_skins_updated += 1
                    # Log progress when ratio of updated skins is a multiple of 5
                    update_percentage = (total_skins_updated / total_skins) * 100
                    if update_percentage >= update_percentage_threshold:
                        update_percentage_threshold += update_percentage_jumps
                        print(f"Progress: {update_percentage:.2f}%, skins updated={total_skins_updated}")
                        logging.info(f"Progress: {update_percentage:.2f}%, skins updated={total_skins_updated}")
            else:
                # update didn't go fine, so we stop
                logging.warning("Couldn't update at least one of the skin conditions")
                break
    logging.info("Worker thread finished")

"""
This function receives the proxy list and launches one worker for each proxy
We assume proxies are valid
"""
def launch_workers(proxies):
    global total_skins

    if len(proxies) == 0:
        logging.warning("Empty proxies array")
        return False

    # we will have one workers for each proxy.
    # Each worker
    n_workers = len(proxies)

    # get the skins from db
    skins = get_all_skins() # -> method has been deleted
    total_skins = len(skins)

    # chunk size represents the amount of skins each thread will process at a time
    chunk_size = len(skins) // ((n_workers) * 5)

    # define the queue that holds the tasks (a task is simply a list of skins to be updated)
    task_queue = Queue()
    for i in range(0, len(skins), chunk_size):
        task_queue.put(skins[i:i + chunk_size])

    future_results = []
    with ThreadPoolExecutor(max_workers=n_workers) as executor:
        for proxy in proxies:
            result = executor.submit(worker_thread, task_queue, proxy)
            future_results.append(result)

        try:
            for future in as_completed(future_results):
                try:
                    future.result()
                except Exception as e:
                    print(f"Worker thread generated an exception: {e}")
        except KeyboardInterrupt:
            logging.info("KeyboardInterrupt received, setting stop event.")
            stop_event.set()
            for future in future_results:
                future.cancel()
            # Wait for all threads to finish
            executor.shutdown(wait=True)

    logging.info("All worker threads have finished")
    
if __name__ == '__main__':
    proxies = get_valid_proxies()
    print(len(proxies))
    start = time.time()
    try:
        launch_workers(proxies)
    except KeyboardInterrupt:
        logging.info("KeyboardInterrupt received in main, setting stop event.")
        stop_event.set()
    end = time.time()
    logging.info(f"Elapsed time on the workers: {end-start:.2f}s")
