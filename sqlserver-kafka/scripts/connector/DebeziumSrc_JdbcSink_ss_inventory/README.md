
Source Connector: ss_inventory_invoice_avro_01_DebeziumSrc
Sink Connector: ss_inventory_invoice_avro_01_JdbcSink
Topics: ss_inventory_invoice_avro_01.inventory.INV.invoices
converter: io.confluent.connect.avro.AvroConverter


Source Connector: ss_inventory_invoice_json_01_DebeziumSrc
Sink Connector: ss_inventory_invoice_json_01_JdbcSink
Topics: ss_inventory_invoice_json_01.inventory.INV.invoices
converter: io.confluent.connect.json.JsonSchemaConverter



