import requests

def parse_proxy(proxy):
    parts = proxy.split(':')
    host_port = f"{parts[0]}:{parts[1]}"
    auth = f"{parts[2]}:{parts[3]}"
    proxy_dict = {
        "http": f"http://{auth}@{host_port}",
        "https": f"https://{auth}@{host_port}"
    }
    return proxy_dict

def test_proxy(proxy):
    try:
        response = requests.get("http://httpbin.org/ip", proxies=proxy, timeout=50)
        if response.ok:
            print(f"Proxy {proxy} is working. Your IP: {response.json()['origin']}")
        else:
            print(f"Proxy {proxy} returned status code {response.status_code}")
    except Exception as e:
        print(f"Error occurred while testing proxy {proxy}: {e}")

def main():
    proxies1 = [
        "proxy.oculus-proxy.com:31111:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff37a5428df5e031b2de5f91a04a71886b4:ty17xt2fsa51",
        "proxy.oculus-proxy.com:31112:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff3de8fae4b85b0248a7dd4757970a136ac:ty17xt2fsa51",
        "proxy.oculus-proxy.com:31113:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff372cf2c75a16ed0e7cf5b73323405fc74:ty17xt2fsa51",
        "proxy.oculus-proxy.com:31114:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff360d92886df70f38376a364f109a386bd:ty17xt2fsa51",
        "proxy.oculus-proxy.com:31111:ba13396172373555b0b863c3af19140fd93154a3ee470ef8bb78cd17ceaec67bd6dc4c0cfb157a8d0f7ed79b209e585e93988eb7a06cbf4aa12b7acc096ffff3978b6e4153a9869546b9d6a9669502fd:ty17xt2fsa51",
    ]
    proxies2 = [
        "proxy.oculus-proxy.com:31111:ba13396172373555b0b863c3af19140fa79dd45b15617524a7707463c9777d5e33346905767042b6bdbc168f19665a20766dbe8bb616315047447a6f667dfeeade6919ec478b932d328c7e11888c8483:x618mohexz37",
        "proxy.oculus-proxy.com:31112:ba13396172373555b0b863c3af19140fa79dd45b15617524a7707463c9777d5e33346905767042b6bdbc168f19665a20766dbe8bb616315047447a6f667dfeea66ff332230e44241ee1dfd10aa7deaaa:x618mohexz37",
        "proxy.oculus-proxy.com:31113:ba13396172373555b0b863c3af19140fa79dd45b15617524a7707463c9777d5e33346905767042b6bdbc168f19665a20766dbe8bb616315047447a6f667dfeea57b70ae5b1df08fcd02f1f4ee44eeeae:x618mohexz37",
        "proxy.oculus-proxy.com:31114:ba13396172373555b0b863c3af19140fa79dd45b15617524a7707463c9777d5e33346905767042b6bdbc168f19665a20766dbe8bb616315047447a6f667dfeea9254a5341f673b5e9a3d35cfce53e0e8:x618mohexz37",
        "proxy.oculus-proxy.com:31111:ba13396172373555b0b863c3af19140fa79dd45b15617524a7707463c9777d5e33346905767042b6bdbc168f19665a20766dbe8bb616315047447a6f667dfeea701d855533522b40ad283b5fee57a781:x618mohexz37",
    ]

    for proxy in proxies1:
        test_proxy(parse_proxy(proxy))
    for proxy in proxies2:
        test_proxy(parse_proxy(proxy))

if __name__ == "__main__":
    main()