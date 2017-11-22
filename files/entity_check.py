import requests, json, datetime, sys

thisentityId = 0
get_base_entityurl = "https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/?entityName="

headers = {
    'content-type': "application/json",
    'authorization': "Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0",
    'cache-control': "no-cache",
    'postman-token': "d6f9b060-5326-24fd-a711-a2373ea4396f"
    }

get_entityurl = get_base_entityurl + sys.argv[1] + '&entityType=' + sys.argv[2]

r = requests.get(get_entityurl, headers=headers)
entity = r.json()

for entityentry in entity['items']:
        thisentityId = entityentry['entityId']

print thisentityId
