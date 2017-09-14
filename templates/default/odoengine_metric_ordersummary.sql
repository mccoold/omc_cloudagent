spool on;
set heading off;
set feedback off;
set verify off;
spool /home/oracle/scripts/odo/odoengine_metric_ordersummary.json;
SELECT
'[
  {
    "collectionTs" : "'||to_char(sysdate,'YYYY-MM-DD"T"HH24:MI:SS"Z"')||'",
    "entityType" : "usr_odo_engine",
    "metricGroup" : "engine_order_counts",
    "metricNames" : [
          "total_orders",
          "open_orders",
          "successful_orders",
          "failed_orders"
    ],
    "metricValues" : [
      [
        ' || (select count(1) as total_orders from om_order_header) || ',
        ' || (select count(1) as open_orders from om_order_header where ord_state_id in (1,2,4,5,6,8)) || ',
                ' || (select count(1) as successful_orders from om_order_header where ord_state_id in (3,7,9)) || ',
                ' || (select count(1) as failed_orders from om_order_header where ord_state_id in (10)) || '
      ]
    ]
  }
]'
FROM
    dual;
spool off;
exit;