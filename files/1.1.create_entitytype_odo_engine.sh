curl -X POST \
  https://uscgbuodo2trial.itom.management.us2.oraclecloud.com/serviceapi/entityModel/metadata/entityTypes \
  -H 'authorization: Basic dXNjZ2J1b2RvdHJpYWwubWFhei5hbmp1bUBvcmFjbGUuY29tOlRlc3QhMjM0' \
  -H 'cache-control: no-cache' \
  -H 'content-type: application/json' \
  -H 'postman-token: aebd3a8c-9f1c-197f-1e9e-f464c2bc3f08' \
  -d '{
    "entityType": "usr_odo_engine",
    "category": "Applications",
    "typeDisplayName": "ODO Engine",
    "parentTargetType": "omc_entity",
    "meClass": "TARGET",
    "metricGroupTypeList": [
        {
            "entityTypeName": "usr_odo_engine",
            "metricGroupName": "engine_order_counts",
            "metricGroupDisplayName": "Engine Order Counts",
            "metricGroupClass": "PERFORMANCE",
            "columnList": [
                {
                    "metricColumnName": "total_orders",
                    "metricColumnDisplayName": "Total Orders",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                },
    		{
                    "metricColumnName": "open_orders",
                    "metricColumnDisplayName": "Open Orders",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                },
                {
                    "metricColumnName": "successful_orders",
                    "metricColumnDisplayName": "Successful Orders",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                },
    		{
                    "metricColumnName": "failed_orders",
                    "metricColumnDisplayName": "Failed Orders",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                }
            ],
            "config": false,
            "displayInUI": true,
            "fullPath": "engine_order_counts",
            "stm": true,
            "curationLevel": 1,
            "extension": false,
            "dataCollectionType": 0,
            "metricGroupType": "STANDARD",
            "rollupDisabled": 0,
            "keyColumnNames": []
        },

		{
            "entityTypeName": "usr_odo_engine",
            "metricGroupName": "capacity_utilization",
            "metricGroupDisplayName": "Capacity Utilization",
            "metricGroupClass": "PERFORMANCE",
            "columnList": [
                {
                    "metricColumnName": "large_index_pct_used",
                    "metricColumnDisplayName": "Large Index - Percent Used",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                },
    			{
                    "metricColumnName": "large_data_pct_used",
                    "metricColumnDisplayName": "Large Data - Percent Used",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                },
    			{
                    "metricColumnName": "root_filesystem_pct_used",
                    "metricColumnDisplayName": "Root File System - Percent Used",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                },
    			{
                    "metricColumnName": "order_id_pct_used",
                    "metricColumnDisplayName": "Order ID - Percent Used",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                }
            ],
            "config": false,
            "displayInUI": true,
            "fullPath": "capacity_utilization",
            "stm": true,
            "curationLevel": 1,
            "extension": false,
            "dataCollectionType": 0,
            "metricGroupType": "STANDARD",
            "rollupDisabled": 0,
            "keyColumnNames": []
        },
        
        {
            "entityTypeName": "usr_odo_engine",
            "metricGroupName": "partition_counts",
            "metricGroupDisplayName": "Partition Counts",
            "metricGroupClass": "PERFORMANCE",
            "columnList": [
                {
                    "metricColumnName": "partition_name",
                    "metricColumnDisplayName": "Partition Name",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "STR",
                    "isKey": true,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                },
    			{
                    "metricColumnName": "partition_count",
                    "metricColumnDisplayName": "Partition Count",
                    "unitType": "OMC_SYS_STANDARD_GENERAL_NA",
                    "metricColumnClass": "NUM",
                    "isKey": false,
                    "uiPriority": 1,
                    "baselineable": false,
                    "isIndexed": false,
                    "derivationMethod": "BASIC",
                    "unitStr": "n/a",
                    "alertable": false,
                    "derivationSources": [],
                    "metricColumnAliasList": [],
                    "knownValueList": [],
                    "ligDwnSmplKeys": 0,
                    "displayInUI": true
                }
            ],
            "config": false,
            "displayInUI": true,
            "fullPath": "partition_counts",
            "stm": true,
            "curationLevel": 1,
            "extension": false,
            "dataCollectionType": 0,
            "metricGroupType": "STANDARD",
            "rollupDisabled": 0,
            "keyColumnNames": []
        },
        {
    		"columnList" : [
      		{
        		"columnClass" : "NUMBER",
        		"metricColumnDisplayName" : "Status Alert Flag",
        		"metricColumnName" : "status_alert_flag"
      		},
      		{
        		"columnClass" : "STRING",
        		"metricColumnDisplayName" : "Status Alert Message",
        		"metricColumnName" : "status_alert_message"
      		}
    						],
    		"entityTypeName" : "usr_odo_engine",
    		"metricGroupClass" : "PERFORMANCE",
    		"metricGroupDisplayName" : "Engine Status Metrics",
    		"metricGroupName" : "engine_status_metrics"
  		},
    	{
      		"columnList" : [
        	{
          		"columnClass" : "STRING",
          		"metricColumnDisplayName" : "Create Date",
          		"metricColumnName" : "create_date"
        	}
      						],
      		"entityTypeName" : "usr_odo_engine",
      		"metricGroupClass" : "PERFORMANCE",
      		"metricGroupDisplayName" : "Engine Inception",
      		"metricGroupName" : "engine_inception"
    	}
    ],
    "propertyTypeList": [
    ],
    "tenantSpecific": true
}'