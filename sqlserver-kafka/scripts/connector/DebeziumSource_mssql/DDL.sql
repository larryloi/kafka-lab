


--- Destination table in StarRocks
USE DWH;

CREATE TABLE `orders_kafka_json_02` (
  `id` bigint(20) NOT NULL COMMENT "",
  `order_id` varchar(36) NOT NULL COMMENT "",
  `supplier_id` int(11) NOT NULL COMMENT "",
  `item_id` int(11) NOT NULL COMMENT "",
  `status` varchar(20) NOT NULL COMMENT "",
  `qty` int(11) NOT NULL COMMENT "",
  `net_price` int(11) NOT NULL COMMENT "",
  `issued_at` datetime NOT NULL COMMENT "",
  `completed_at` datetime COMMENT "",
  `created_at` datetime COMMENT "",
  `updated_at` datetime COMMENT "",
  `__deleted` varchar(20) COMMENT "",
  `__op` varchar(20) COMMENT ""  
) 
PRIMARY KEY (`id`, `order_id`)
DISTRIBUTED BY HASH(`id`, `order_id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT"
);





CREATE TABLE mssql_INV_cp_avro_CDC_DebeziumSrc02_INV_orders_demo00 (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `issued_at` DATETIME NOT NULL COMMENT "",
  `completed_at` DATETIME NOT NULL COMMENT "",
  `spec` json COMMENT "",
  `created_at` DATETIME NOT NULL COMMENT "",
  `updated_at` DATETIME NOT NULL COMMENT "",

  `__db` VARCHAR(128) NULL,
  `__schema` VARCHAR(128) NULL,
  `__table` VARCHAR(128) NULL,
  `__source_ts_ms` DATETIME NULL,
  `__ts_ms` DATETIME NULL,
  `__deleted` BOOLEAN NULL
) 
  PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT"
);
