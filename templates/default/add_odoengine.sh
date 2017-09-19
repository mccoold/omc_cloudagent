#!/bin/sh
basedir=/home/oracle/scripts/odo
entityname=$(hostname -s)_engine
output=$basedir/odoengine.json
source $basedir/odomeIds

echo "{"                                                                                > $output
echo "    \"entityType\": \"usr_odo_engine\","  >> $output
echo "    \"entityName\": \"$entityname\","     >> $output
echo "    \"properties\": {"                                    >> $output
echo "    \"capability\": {"                                    >> $output
echo "    \"displayName\": \"Capability\","     >> $output
echo "    \"value\": \"monitoring\""                    >> $output
echo "    },"                                                                   >> $output
echo "    \"orcl_usr_gtp1\": {" >> $output
echo "    \"displayName\" : \"Campaign\"," >> $output
echo "    \"value\": \"$odocampaign_name\"" >> $output
echo "    }" >> $output
echo "    },"                                                                   >> $output
echo "    \"tags\":{" >> $output
echo "    \"campaign\" : \"$odocampaign_name\"" >> $output
echo "    },"                                                                   >> $output
echo "    \"availabilityStatus\": \"UP\","              >> $output
echo "    \"tags\": {},"                                                >> $output
echo "    \"meClass\": \"TARGET\","                     >> $output
echo "    \"agentBasedAvailability\": \"UP\""   >> $output
echo "}"                                                                                >> $output


meId=$(curl -X POST \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/tm-data/mes \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: b551b292-16a5-5e31-5c96-db63acbfcbbf' \
  -d '@/home/oracle/scripts/odo/odoengine.json' \
        | grep -o -P '(?<=\"meId\":\").*(?=\")')

meName=$(curl -X GET \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/$meId \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: 054f36fd-aee3-b8ed-d04c-c334f8615601' \
        |  grep -o -P '(?<=\"entityName\":\").*(?=\",\"properties)')

# Write variable to file - to be used later
odomeIds=$basedir/odomeIds
if [ -e "$odomeIds" ]; then
        echo "odoengine_meId"=$meId >> $odomeIds
        echo "odoengine_name"=$meName >> $odomeIds
else
        echo "#!/bin/bash" > $odomeIds
        echo "odoengine_meId"=$meId >> $odomeIds
        echo "odoengine_name"=$meName >> $odomeIds
fi