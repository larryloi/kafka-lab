
--- MySQL Source tables

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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci




--- StarRocks Destination Table


CREATE TABLE `mysql_inventory_cp_avro_CDC_DebeziumSrc01_suppliers` (
  `id` BIGINT NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` datetime ,
  `updated_at` datetime 
) 
  PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT");

CREATE TABLE `mysql_inventory_cp_avro_JdbcSrc01_suppliers` (
  `id` BIGINT NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created_at` datetime ,
  `updated_at` datetime ,
  `CREATED_AT` datetime ,
  `UPDATED_AT` datetime 
) 
  PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT");




CREATE TABLE mysql_inventory_cp_avro__my_orders (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `tax_rate` FLOAT NOT NULL COMMENT "",
  `issued_at` DATETIME NOT NULL COMMENT "",
  `completed_at` DATETIME COMMENT "",
  `created_at` DATETIME NOT NULL COMMENT ""
) 
  PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT"
);


CREATE TABLE mysql_inventory_cp_avro_JdbcSrc01_my_orders (
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

### changed datetime column to varchar
CREATE TABLE mysql_inventory_cp_avro__my_orders_A (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `tax_rate` FLOAT NOT NULL COMMENT "",
  `issued_at` VARCHAR(25) COMMENT "",
  `spec` VARCHAR(4096) COMMENT "",
  `completed_at` VARCHAR(25) COMMENT "",
  `created_at` VARCHAR(25) COMMENT ""
) 
  PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"storage_format" = "DEFAULT"
);


CREATE TABLE mysql_inventory_cp_avro_CDC_DebeziumSrc01_JdbcSink_mssql_my_orders (
    id BIGINT NOT NULL,
    order_id VARCHAR NOT NULL,
    supplier_id INT NOT NULL,
    item_id INT NOT NULL,
    status VARCHAR NOT NULL,
    qty INT NOT NULL,
    net_price INT NOT NULL,
    tax_rate FLOAT NOT NULL,
    issued_at DATETIME NOT NULL,
    completed_at DATETIME NULL,
    spec VARCHAR NULL,
    created_at DATETIME NULL,
    updated_at DATETIME NULL,
    __op VARCHAR NULL,
    __table VARCHAR NULL,
    __source_ts_ms DATETIME NULL,
    __server_id BIGINT NULL,
    __file VARCHAR NULL,
    __pos BIGINT NULL,
    __deleted VARCHAR NULL,
    PRIMARY KEY (id)
) ENGINE=OLAP
DUPLICATE KEY(id)
DISTRIBUTED BY HASH(id) BUCKETS 10
PROPERTIES (
    "replication_num" = "3",
    "in_memory" = "false",
    "storage_format" = "DEFAULT"
);
