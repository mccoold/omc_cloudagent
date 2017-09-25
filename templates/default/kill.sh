#!/bin/bash
getArray() {
    array=() # Create array
    while IFS= read -r line # Read a line
    do
        array+=("$line") # Append line to the array
    done < "$1"
}

getArray "/home/oracle/scripts/odo/odomeIds"
declare -A ary
for line in "${array[@]}"
do
     key=${line%%=*}
     value=${line#*=}
     ary[$key]=$value
done

#
# curl command to mark DB down
#
curl -X PUT \
 https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 42e7d718-24a9-ede4-ee14-cd7296fbe370' \
  -d '{
    "collectionTs" : "2017-09-20T02:35:01Z",
    "entityId": "'"${ary[odoenginedbinstance_meId]}"'",
    "entityName" : "'"${ary[odoenginedbinstance_name]}"'",
    "entityType" : "omc_oracle_db_instance",
    "entityDisplayName" : "'"${ary[odoenginedbinstance_name]}"'",
    "namespace" : "EMAAS",
    "availabilityStatus": "DOWN"
}'

#
# Curl Command to mark OSM down

curl -X PUT \
 https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 42e7d718-24a9-ede4-ee14-cd7296fbe370' \
  -d '{
    "collectionTs" : "2017-09-20T02:35:01Z",
    "entityId": "'"${ary[odoengineosm_meId]}"'",
    "entityName" : "'"${ary[odoengineosm_name]}"'",
    "entityType" : "usr_odo_engine_osm",
    "entityDisplayName" : "'"${ary[odoengineosm_name]}"'",
    "namespace" : "EMAAS",
    "availabilityStatus": "DOWN"
}'


#
# Curl for ASAP

curl -X PUT \
 https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 42e7d718-24a9-ede4-ee14-cd7296fbe370' \
  -d '{
    "collectionTs" : "2017-09-20T02:35:01Z",
    "entityId": "'"${ary[odoengineasap_meId]}"'",
    "entityName" : "'"${ary[odoengineasap_name]}"'",
    "entityType" : "usr_odo_engine_asap",
    "entityDisplayName" : "'"${ary[odoengineasap_name]}"'",
    "namespace" : "EMAAS",
    "availabilityStatus": "DOWN"
}'

#
# Curl for Engine
curl -X PUT \
 https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 42e7d718-24a9-ede4-ee14-cd7296fbe370' \
  -d '{
    "collectionTs" : "2017-09-20T02:35:01Z",
    "entityId": "'"${ary[odoengine_meId]}"'",
    "entityName" : "'"${ary[odoengine_name]}"'",
    "entityType" : "usr_odo_engine",
    "entityDisplayName" : "'"${ary[odoengine_name]}"'",
    "namespace" : "EMAAS",
    "availabilityStatus": "DOWN"
}'


