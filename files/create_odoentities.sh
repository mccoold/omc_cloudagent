#!/bin/sh
basedir=/home/oracle/scripts/odo

$basedir/add_odocampaign.sh
$basedir/add_odoengine.sh
$basedir/add_odoengineasap.sh
$basedir/add_odoenginedbinstance.sh
$basedir/add_odoengineosm.sh
$basedir/add_associations.sh


source $basedir/odomeIds

# Create ODO Engine's Group
curl -X POST \
 https://uscgbuodo2trial.analytics.management.us2.oraclecloud.com/serviceapi/tm-data/groups/ \
  -H 'authorization: Basic dXNjZ2J1b2RvMnRyaWFsLm1hYXouYW5qdW1Ab3JhY2xlLmNvbTpUZXN0ITIzNA==' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '{
        "groupName": "'"$odoengine_name"'",
        "groupDisplayName": "'"$odoengine_name"'",
        "groupType": "Dynamic",
        "tagBasedCriteria" : { "key":"campaign","value":"'"$odoengine_name"'" },
                "tags" : {
                        "campaign" : "'"$odoengine_name"'"
        }
}'

#touch success script for chef
touch $basedir/success
