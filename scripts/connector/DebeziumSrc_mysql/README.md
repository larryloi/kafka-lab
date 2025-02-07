
### Test passed

mysql_inventory_cp_avro_CDC_DebeziumSrc01
mysql_inventory_cp_avro_CDC_DebeziumSrc01_JdbcSink_mssql_my_orders
mysql_inventory_cp_avro_CDC_DebeziumSrc01_StarRocks_my_orders
mysql_inventory_cp_avro_CDC_DebeziumSrc01_StarRocks_suppliers








----------------
```json
{
    "sink.properties.strip_outer_array": "true",
    "sink.properties.format": "json",
}

{}
    "transforms": "unwrap,addfield,CreatedAtToDatetime,UpdatedAtToDatetime,RenameField",

    "transforms.RenameField.type": "org.apache.kafka.connect.transforms.ReplaceField$Value",
    "transforms.RenameField.renames": "__op:__OP,__delete:__DELETE",

    "transforms.addfield.type": "com.starrocks.connector.kafka.transforms.AddOpFieldForDebeziumRecord",
    "transforms.unwrap.add.fields": "op",
    "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
    "transforms.unwrap.drop.tombstones": "true",
    "transforms.unwrap.delete.handling.mode": "rewrite",
}

{
    "transforms.addfield.type": "com.starrocks.connector.kafka.transforms.AddOpFieldForDebeziumRecord",
    "transforms.addfield.field": "__op",
    "transforms.addfield.value": "r",

    "transforms.RenameField.type": "org.apache.kafka.connect.transforms.ReplaceField$Value",
    "transforms.RenameField.renames": "__op:__OP,__delete:__DELETE",
}

{

    "transforms": "unwrap,addfield,CreatedAtToDatetime,UpdatedAtToDatetime,IssuedAtToDatetime,CompletedAtToDatetime",

    "transforms.addfield.type": "com.starrocks.connector.kafka.transforms.AddOpFieldForDebeziumRecord",
    "transforms.unwrap.type": "io.debezium.transforms.ExtractNewRecordState",
    "transforms.unwrap.drop.tombstones": "true",
    "transforms.unwrap.delete.handling.mode": "rewrite",
}

```