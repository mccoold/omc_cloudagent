import requests, json, socket

odocampaign_meId = ''
odoengine_meId = ''
odoengineasap_meId = ''
odoenginedbinstance_meId = ''
odoengineosm_meId = ''

print 'odoengine_meId:', odoengine_meId
print 'odoengineasap_meId:', odoengineasap_meId
print 'odoenginedbinstance_meId:', odoenginedbinstance_meId
print 'odoengineosm_meId:', odoengineosm_meId

campaignName = socket.gethostname().split('-')[0]
print 'campaignName:', campaignName

headers = {
    'content-type': "application/json",
    'authorization': "Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0",
    'cache-control': "no-cache",
    'postman-token': "d6f9b060-5326-24fd-a711-a2373ea4396f"
    }

get_campaignmeIdurl = 'https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/?entityName=' + campaignName + '&entityType=usr_odo_campaign'

r = requests.get(get_campaignmeIdurl, headers=headers)
campaignJson = r.json()

for campaignentry in campaignentity['items']:
#	print 'campaign entityid: ' + campaignentry['entityId'] + ', entity name: ' + campaignentry['entityName']
	odocampaign_meId = campaignentry['entityId']
	print 'odocampaign_meId:', odocampaign_meId

