### Connector: sqlserver_inventory_order_DropTopicPrefix_01_DebeziumSrc
Remove: database name, schema name from the topic name
https://docs.confluent.io/platform/current/connect/transforms/regexrouter.html
https://jcustenborder.github.io/kafka-connect-documentation/projects/kafka-connect-solr/sinks/examples/CloudSolrSinkConnector.strip-prefix.html


```json
{
      "transforms": "unwrap,dropPrefix",
      "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
      "transforms.dropPrefix.type":"org.apache.kafka.connect.transforms.RegexRouter",
      "transforms.dropPrefix.regex":"sqlserver_inventory_order_DropTopicPrefix_01.inventory.INV.(.*)",
      "transforms.dropPrefix.replacement":"sqlserver_inventory_order_DropTopicPrefix_01.$1",
}
```




### Add TimestampConverter transforms in Source Connector
mysql_inventory_cp_avro_TimestampConverter_JdbcSrc

```json
{
    "transforms": "CreatedAtToDatetime,UpdatedAtToDatetime",

    "transforms.CreatedAtToDatetime.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.CreatedAtToDatetime.field": "created_at",
    "transforms.CreatedAtToDatetime.format": "yyyy-MM-dd HH:mm:ss",
    "transforms.CreatedAtToDatetime.target.type": "string",

    "transforms.UpdatedAtToDatetime.type": "org.apache.kafka.connect.transforms.TimestampConverter$Value",
    "transforms.UpdatedAtToDatetime.field": "updated_at",
    "transforms.UpdatedAtToDatetime.format": "yyyy-MM-dd HH:mm:ss",
    "transforms.UpdatedAtToDatetime.target.type": "string",
}
```