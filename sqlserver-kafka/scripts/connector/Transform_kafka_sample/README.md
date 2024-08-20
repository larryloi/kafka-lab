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


### Filter
```json
{
  "transforms": "unwrap, Filter",
  "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
  "transforms.Filter.type": "io.debezium.transforms.Filter",
  "transforms.Filter.negate": "false",
  "transforms.Filter.predicate": "isTableTopic",
  "transforms.Filter.condition": "value.PropertyID == 2",
  "transforms.Filter.language": "jsr223.groovy",
  "predictes": "isTableTopic",
  "predicates.isTableTopic.type": "org.apache.kafka.connect.transforms.predicates.TopicNameMatches",
  "predicates.isTableTopic.pattern": "SCL_DW_CMS_REM_VEN_RPT_ODS_DebeziumSrc01_Reporting_ODS_TG_PatronRating"
}
```
