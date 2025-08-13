
### MySQL
mysql> GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'SVC_DS_DEPLOY'@'%';
Query OK, 0 rows affected (0.02 sec)

mysql> GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'SVC_DS_HELPER'@'%';
Query OK, 0 rows affected (0.01 sec)

mysql> GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'SVC_DS_KAFKA'@'%';
Query OK, 0 rows affected (0.01 sec)

### Source MySQL TABLEs

-- inventory.suppliers definition

CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_created_at` (`created_at`),
  KEY `idx_updated_at` (`updated_at`),
  KEY `idx_name_type` (`name`,`type`),
  KEY `suppliers_type_IDX` (`type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- inventory.my_orders definition

CREATE TABLE `my_orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(36) NOT NULL,
  `supplier_id` int NOT NULL,
  `item_id` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `qty` int NOT NULL,
  `net_price` int NOT NULL,
  `tax_rate` float NOT NULL,
  `issued_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `spec` json DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_my_orders_order_id` (`order_id`),
  KEY `IDX_my_orders_issued_at` (`issued_at`),
  KEY `IDX_my_orders_completed_at` (`completed_at`),
  KEY `IDX_my_orders_created_at` (`created_at`),
  KEY `IDX_my_orders_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




### Destination StarRocks Tables
CREATE TABLE suppliers (
  id INT NOT NULL ,
  name VARCHAR(255) NOT NULL,
  type VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
)
  PRIMARY KEY (id)
DISTRIBUTED BY HASH(id) BUCKETS 10
PROPERTIES (
  "replication_num" = "3",
  "in_memory" = "false",
  "storage_format" = "DEFAULT"
  
);




CREATE TABLE `my_orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` varchar(36) NOT NULL,
  `supplier_id` int NOT NULL,
  `item_id` int NOT NULL,
  `status` varchar(20) NOT NULL,
  `qty` int NOT NULL,
  `net_price` int NOT NULL,
  `tax_rate` float NOT NULL,
  `issued_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL,
  `spec` json DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `IDX_my_orders_order_id` (`order_id`),
  KEY `IDX_my_orders_issued_at` (`issued_at`),
  KEY `IDX_my_orders_completed_at` (`completed_at`),
  KEY `IDX_my_orders_created_at` (`created_at`),
  KEY `IDX_my_orders_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;










CREATE TABLE mysql_inventory_cp_avro_CDC_DebeziumSrc01_my_orders (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `tax_rate` FLOAT NOT NULL COMMENT "",
  `issued_at` DATETIME NOT NULL COMMENT "",
  `completed_at` DATETIME NOT NULL COMMENT "",
  `spec` json COMMENT "",
  `created_at` DATETIME NOT NULL COMMENT "",
  `updated_at` DATETIME NOT NULL COMMENT ""
) 
  PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT"
);


CREATE TABLE mysql_inventory_cp_avro_CDC_DebeziumSrc01_my_orders_ext01 (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `tax_rate` FLOAT NOT NULL COMMENT "",
  `issued_at` DATETIME NOT NULL COMMENT "",
  `completed_at` DATETIME NOT NULL COMMENT "",
  `spec` json COMMENT "",
  `created_at` DATETIME NOT NULL COMMENT "",
  `updated_at` DATETIME NOT NULL COMMENT "",
  `OP` VARCHAR(1) NULL,
  `__table` VARCHAR(128) NULL,
  `__source_ts_ms` DATETIME NULL,
  `__server_id` BIGINT NULL,
  `__file` VARCHAR(255) NULL,
  `__pos` BIGINT NULL,
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


Error: NULL value in non-nullable column '__op'. Row: [16403, '895c2c2f-50ec-4da0-aa1f-d5ef7006eba9', 96, 4, 'delivered', 400, 3640, 7.1245, 2024-08-10 07:20:04, 2024-08-10 07:20:04, "\"{\\\"type\\\": \\\"vehicle\\\", \\\"spec\\\": {\\\"Year\\\": 2018, \\\"Make\\\": \\\"BMW\\\", \\\"Model\\\": \\\"X5\\\", \\\"Category\\\": \\\"SUV\\\"}}\"", 2024-08-10 07:20:04, 2024-08-13 00:27:24, NULL, 'my_orders', NULL, 1, 'binlog.000009', 264867232, 0, NULL]

CREATE TABLE mysql_inventory_cp_avro_CDC_DebeziumSrc01_my_orders_ext01 (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `tax_rate` FLOAT NOT NULL COMMENT "",
  `issued_at` DATETIME NOT NULL COMMENT "",
  `completed_at` DATETIME NOT NULL COMMENT "",
  `spec` json COMMENT "",
  `created_at` DATETIME NOT NULL COMMENT "",
  `updated_at` DATETIME NOT NULL COMMENT "",
  `__op` VARCHAR(45) NULL,
  `__table` VARCHAR(128) NULL,
  `__source_ts_ms` DATETIME NULL,
  `__server_id` BIGINT NULL,
  `__file` VARCHAR(255) NULL,
  `__pos` BIGINT NULL,
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


CREATE TABLE mysql_inventory_kafka_json_k_CDC_DebeziumSrc02_my_orders (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `tax_rate` FLOAT NOT NULL COMMENT "",
  `issued_at` DATETIME NOT NULL COMMENT "",
  `completed_at` DATETIME NOT NULL COMMENT "",
  `spec` VARCHAR(4096) COMMENT "",
  `created_at` DATETIME NOT NULL COMMENT "",
  `updated_at` DATETIME NOT NULL COMMENT ""
) 
  PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT"
);


CREATE TABLE mysql_inventory_kafka_json_kv_CDC_DebeziumSrc02_my_orders (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `tax_rate` FLOAT NOT NULL COMMENT "",
  `issued_at` DATETIME NOT NULL COMMENT "",
  `completed_at` DATETIME NOT NULL COMMENT "",
  `spec` VARCHAR(4096) COMMENT "",
  `created_at` DATETIME NOT NULL COMMENT "",
  `updated_at` DATETIME NOT NULL COMMENT ""
) 
  PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT"
);