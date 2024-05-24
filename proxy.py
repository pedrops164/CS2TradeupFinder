import requests

proxies = [
        "proxy.oculus-proxy.com:31111:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff37a5428df5e031b2de5f91a04a71886b4:ty17xt2fsa51",
        "proxy.oculus-proxy.com:31112:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff3de8fae4b85b0248a7dd4757970a136ac:ty17xt2fsa51",
        "proxy.oculus-proxy.com:31113:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff372cf2c75a16ed0e7cf5b73323405fc74:ty17xt2fsa51",
        "proxy.oculus-proxy.com:31114:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff360d92886df70f38376a364f109a386bd:ty17xt2fsa51",
        "proxy.oculus-proxy.com:31111:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff3978b6e4153a9869546b9d6a9669502fd:ty17xt2fsa51",
]

# Function to parse proxy strings and create a proxy dictionary
def parse_proxy(proxy):
    parts = proxy.split(':')
    host_port = f"{parts[0]}:{parts[1]}"
    auth = f"{parts[2]}:{parts[3]}"
    proxy_dict = {
        "http": f"http://{auth}@{host_port}",
        "https": f"https://{auth}@{host_port}"
    }
    return proxy_dict

# Function to check if a proxy is working
def is_proxy_working(proxy):
    try:
        response = requests.get('http://httpbin.org/ip', proxies=proxy, timeout=10)
        if response.status_code == 200:
            print(f"Proxy successful: {proxy}")
            return True
        else:
            print(f"Proxy failed with status code {response.status_code}")
    except Exception as e:
        print(f"Proxy failed with exception {e}")
    return False

def get_valid_proxies():
    # Parse all proxies
    parsed_proxies = [parse_proxy(proxy) for proxy in proxies]
    valid_proxies = [proxy for proxy in parsed_proxies if is_proxy_working(proxy)]
    return parsed_proxies