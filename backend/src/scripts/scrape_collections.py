# script to scrape tradeupspy collections and skins
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.common.exceptions import TimeoutException, WebDriverException, StaleElementReferenceException
from urllib.parse import urljoin
import json

base_domain = "https://www.tradeupspy.com"

class NoSuchElementException(Exception):
    pass

def scrape_tradeupspy_collections(collection_name, collection_link):
    # Configure Chrome options
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--disable-gpu")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    
    # Add experimental options to suppress unnecessary errors
    chrome_options.add_experimental_option("excludeSwitches", ["enable-logging", "enable-automation"])
    chrome_options.add_experimental_option("useAutomationExtension", False)
    
    # Add a user agent to mimic regular browser traffic
    chrome_options.add_argument("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36")

    try:
        # Initialize WebDriver
        driver = webdriver.Chrome(options=chrome_options)
        
        # Increase timeout to 20 seconds for slow pages
        driver.get(collection_link)
        container_xpath = "/html/body/app-root/html/body/app-skins/div[7]/div[2]"
        
        try:
            container = WebDriverWait(driver, 20).until(
                EC.presence_of_element_located((By.XPATH, container_xpath)))
            
            div_elements = container.find_elements(By.XPATH, "./div")

            with open(f"{collection_name}.json", "w", encoding="utf-8") as jsonfile:
                collection_dict = {}
                collection_dict['collection_name'] = collection_name
                skins_data = []
                for div in div_elements:
                    try:
                        # Get name with proper formatting
                        name_element = div.find_element(By.CSS_SELECTOR, "a.skin_card_collection_name")
                        skin_name = name_element.text.replace("\n", " | ")
                        
                        # Get rarity from wrapper class
                        wrapper_div = div.find_element(By.CSS_SELECTOR, ".skin_card_wrapper")
                        rarity = wrapper_div.get_attribute("class").split(" ")[1]
                        
                        # Build full URL
                        relative_url = name_element.get_attribute("href")
                        full_url = urljoin(base_domain, relative_url)
                    
                        # Get float values
                        min_float, max_float = get_floats_from_url(driver, full_url)

                        skins_data.append({
                            "name": skin_name,
                            "quality": rarity,
                            "min_float": min_float,
                            "max_float": max_float,
                            "last_of_rarity": False # hardcode this and change later
                        })

                        print(f"Skin: {skin_name} | Rarity: {rarity} | Min Float: {min_float} | Max Float: {max_float}")
                        
                    except NoSuchElementException as e:
                        print(f"Missing element in skin card: {str(e)}")
                        continue
                collection_dict['skins'] = skins_data
                json.dump(collection_dict, jsonfile, indent=4, ensure_ascii=False)
        except TimeoutException:
            print(f"Timeout: Could not find container element for {collection_name}")
            print("Possible reasons: XPath changed, slow loading, or site structure updated")
    except WebDriverException as e:
        print(f"WebDriver Error: {str(e)}")
        print("Potential solutions: Update Chrome/Chromedriver, check firewall settings")
    except Exception as e:
        print(f"General Error: {str(e)}")
        
    finally:
        if 'driver' in locals():
            driver.quit()


def get_floats_from_url(driver, url):
    original_window = driver.current_window_handle
    min_float = max_float = -1
    retries = 3  # Number of attempts in case of a stale element error

    for attempt in range(1, retries + 1):
        try:
            # Open a new tab and switch to it
            driver.execute_script("window.open('');")
            driver.switch_to.window(driver.window_handles[-1])
            driver.get(url)
            
            # Define the XPaths for the float elements
            min_float_xpath = "/html/body/app-root/html/body/app-skins/div[6]/div[2]/div[2]/div[1]/div/div/p[1]/b"
            max_float_xpath = "/html/body/app-root/html/body/app-skins/div[6]/div[2]/div[2]/div[1]/div/div/p[2]/b"
            
            # Wait for and retrieve the min float element
            min_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, min_float_xpath))
            )
            min_float_text = min_element.text.strip()
            
            # Wait for and retrieve the max float element
            max_element = WebDriverWait(driver, 10).until(
                EC.visibility_of_element_located((By.XPATH, max_float_xpath))
            )
            max_float_text = max_element.text.strip()
            
            # Convert any "undefined" text to "N/A"
            if min_float_text.lower() != "undefined":
                min_float = float(min_float_text)
            if max_float_text.lower() != "undefined":
                max_float = float(max_float_text)
            
            # If everything went fine, break out of the retry loop
            break

        except StaleElementReferenceException:
            print(f"Stale element reference encountered for {url}, retrying (attempt {attempt}/{retries})...")
            if attempt == retries:
                print(f"Failed to retrieve floats from {url} after {retries} attempts.")
        except TimeoutException:
            print(f"Timeout occurred while loading floats from {url}")
            break
        except Exception as e:
            print(f"Error retrieving floats from {url}: {str(e)}")
            break
        finally:
            # Ensure we close the current tab and switch back to the original
            if len(driver.window_handles) > 1:
                driver.close()
                driver.switch_to.window(original_window)
    
    return min_float, max_float

if __name__ == "__main__":
    collection_name = 'Gallery'
    collection_link = 'https://www.tradeupspy.com/skins/collection/288/gallery'
    scrape_tradeupspy_collections(collection_name, collection_link)