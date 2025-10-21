
Notes:   
Search for : kafka timestamp router create another timestamp column

https://stackoverflow.com/questions/53317310/how-to-add-column-with-the-kafka-message-timestamp-in-kafka-sink-connector





### Test passed
- mssql_INV_cp_avro_CDC_DebeziumSrc02
- mssql_INV_cp_avro_CDC_DebeziumSrc02_JdbcSink_mysql_orders_demo00 (__op, __delete fields valid)
- mssql_INV_cp_avro_CDC_DebeziumSrc02_StarRockSink_orders_demo00 (cannot assign transforms.unwrap.add.fields "op";   __delete field updable)

---

- mssql_dbo_emps_DebeziumSrc
- mssql_dbo_emps_DebeziumSrc_StarRockSink_emps_01
```SQL
-- Starrocks Sink table
CREATE TABLE `emps` (
  `id` int(11) NOT NULL COMMENT "",
  `dept_id` int(11) NULL COMMENT "",
  `first_name` varchar(65533) NULL COMMENT "",
  `last_name` varchar(65533) NULL COMMENT "",
  `hired_at` datetime NULL COMMENT "",
  `email` varchar(65533) NULL COMMENT ""
) ENGINE=OLAP
PRIMARY KEY(`id`)
DISTRIBUTED BY HASH(`id`) BUCKETS 1
PROPERTIES (
"compression" = "LZ4",
"enable_persistent_index" = "true",
"fast_schema_evolution" = "true",
"replicated_storage" = "true",
"replication_num" = "3"
);

```