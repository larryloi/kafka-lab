### Connector: sqlserver_inventory_order_DropTopicPrefix_01_DebeziumSrc
Remove: database name, schema name from the topic name

```json
{
      "transforms": "unwrap,dropPrefix",
      "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
      "transforms.dropPrefix.type":"org.apache.kafka.connect.transforms.RegexRouter",
      "transforms.dropPrefix.regex":"sqlserver_inventory_order_DropTopicPrefix_01.inventory.INV.(.*)",
      "transforms.dropPrefix.replacement":"sqlserver_inventory_order_DropTopicPrefix_01.$1",
}
```