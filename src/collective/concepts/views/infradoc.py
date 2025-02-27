import json
import requests
from Products.Five.browser import BrowserView


class InfradocView(BrowserView):

    @property
    def applications(self):
        payload = json.dumps(
            {
                "query": "\nquery {\n  instances{\n    name\n    vhost_name\n    type\n    total_size\n    ports\n    active_port\n    server {\n      server_name\n      environment\n      internal_ip\n    }\n  }\n}\n    "
            }
        )
        response = requests.post("https://infradoc.imio.be/api", data=payload)
        apps = response.json().get("data").get("instances")
        items = []
        for a in apps:
            infos = {
                "name": a["name"],
                "url": a["vhost_name"],
                "size": a["total_size"],
            }
            items.append(infos)
        return sorted(items, key=lambda item: item["name"])
