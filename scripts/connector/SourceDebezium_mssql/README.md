
Notes:   
Search for : kafka timestamp router create another timestamp column

https://stackoverflow.com/questions/53317310/how-to-add-column-with-the-kafka-message-timestamp-in-kafka-sink-connector





### Test pass
- mssql_INV_cp_avro_CDC_DebeziumSrc02
- mssql_INV_cp_avro_CDC_DebeziumSrc02_JdbcSink_mysql_orders_demo00 (__op, __delete fields valid)
- mssql_INV_cp_avro_CDC_DebeziumSrc02_StarRockSink_orders_demo00 (cannot assign transforms.unwrap.add.fields "op";   __delete field updable)

- mssql_dbo_emps_DebeziumSrc
- mssql_dbo_emps_DebeziumSrc_StarRockSink_emps_01