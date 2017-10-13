#!/bin/sh
export ORACLE_HOME=/u01/app/oracle/product/11.2.0/db_1
export ORACLE_SID=DB11G

basedir=/home/oracle/scripts/odo
source $basedir/odomeIds

$ORACLE_HOME/bin/sqlplus ordermgmt/Password123 @/home/oracle/scripts/odo/odoengine_metric_ordersummary.sql
$ORACLE_HOME/bin/sqlplus ordermgmt/Password123 @/home/oracle/scripts/odo/odoengine_metric_partition_count.sql

$basedir/odoengine_capacity.sh
$basedir/collect_status.sh

curl -X POST \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/metrics/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/octet-stream' \
  -d '@/home/oracle/scripts/odo/odoengine_metric_capacity.json'
curl -X POST \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/$odoengine_meId/metricGroups \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '@/home/oracle/scripts/odo/odoengine_metric_ordersummary.json'
curl -X POST \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/$odoengine_meId/metricGroups \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '@/home/oracle/scripts/odo/odoengine_metric_partition_count.json'

# Status Checks
curl -X PUT \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '@/home/oracle/scripts/odo/status_asap.json'
curl -X PUT \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '@/home/oracle/scripts/odo/status_dbinstance.json'
curl -X PUT \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '@/home/oracle/scripts/odo/status_odoengine.json'
curl -X PUT \
  https://uscgbuodotrial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/data/entities/ \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -d '@/home/oracle/scripts/odo/status_osm.json'
