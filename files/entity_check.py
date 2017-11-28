import requests, json, datetime, sys

thisentityId = 0
get_base_entityurl = "https://uscgbuodo2trial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/?entityName="

headers = {
    'content-type': "application/json",
    'authorization': "Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0",
    'cache-control': "no-cache",
    'postman-token': "9a476554-526c-61b9-5b94-d5fa420d8108"
    }

get_entityurl = get_base_entityurl + sys.argv[1] + '&entityType=' + sys.argv[2]

r = requests.get(get_entityurl, headers=headers)
entity = r.json()

for entityentry in entity['items']:
        thisentityId = entityentry['entityId']

print thisentityId
