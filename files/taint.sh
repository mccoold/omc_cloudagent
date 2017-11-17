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
crumb=`curl "http://mccoold:A11mine1@129.146.6.189:8080/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,%22:%22,//crumb)"`
curl -H $crumb -X POST http://mccoold:A11mine1@129.146.6.189:8080/job/taint/build --data-urlencode json='{"parameter": [{"name":"CAMPAIGN", "value":"'"${ary[odoengine_name]}"'"},{"name":"ENGINE", "value":"'"${ary[odoengine_name]}"'"}]}'
