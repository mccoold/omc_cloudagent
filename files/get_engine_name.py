import requests, json, socket

## Variables

# Static Variables
thishost = socket.gethostname()
thishost = 'partyhouse3-0'
mylist = []
maxlist = 0

# URLs and Headers
get_entity = "https://uscgbuodotrial.analytics.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/"

headers = {
    'content-type': "application/json",
    'authorization': "Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0",
    'cache-control': "no-cache",
    'postman-token': "d6f9b060-5326-24fd-a711-a2373ea4396f"
    }
    
r = requests.get(get_entity, headers=headers)
entity = r.json()

#loop through all engines, find any that match the existing host name and determine its latest incarnation
for entry in reversed(entity['items']):
	if entry['entityType'] == 'usr_odo_engine' and thishost in entry['entityName']:
		mylist.append(entry['entityName'])
try:
	maxlist = (max(mylist).split(".")[1]).split("_")[0]
	#Find the latest incarnation and add one to it
	maxlist = int(maxlist) + 1
except Exception as inst:
	#if no incarnations exist, it'll be the first one
	maxlist = 0
	
print maxlist