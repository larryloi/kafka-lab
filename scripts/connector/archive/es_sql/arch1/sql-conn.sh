#!/bin/bash

curl -i -X POST -H "Accept:application/json" -H "Content-Type:application/json" localhost:8083/connectors/ -d '
{
  "name": "src_sql_DB_Ecommerce_emp_v1",
  "config": {
    "connector.class": "io.debezium.connector.sqlserver.SqlServerConnector",

    "key.converter":"org.apache.kafka.connect.storage.StringConverter",
    "key.converter.schema.registry.url":"http://schema-registry:8081",

    "value.converter":"org.apache.kafka.connect.json.JsonConverter",
    "value.converter.schema.registry.url":"http://schema-registry:8081",

    "topic.prefix": "v1",
    "poll.interval.ms": "15000",
    "tasks.max": "1",

    "database.hostname": "192.168.50.102",
    "database.port": "1433",
    "database.user": "sa",
    "database.password": "Vg6gEcSGL7p8KbCN",
    "database.names": "DB_Ecommerce",
    "database.encrypt": "false",

    "table.include.list": "dbo.emp",

    "schema.history.internal.kafka.bootstrap.servers": "broker:29092",
    "schema.history.internal.kafka.topic": "schemahistory.DB_Ecommerce.emp.v1",

    "errors.log.enable": "true",
    "errors.log.include.messages": "true"




  }
}'
