

-- Source Views
USE inventory;

	CREATE VIEW INV.vw_orders_1tbl AS
	SELECT 
    id,
    order_id,
	supplier_id,
	item_id,
	[status],
	qty,
	net_price,
	qty * net_price AS ttl_price,
	issued_at,
	completed_at,
	created_at
	FROM inventory.INV.orders;



USE inventory;

CREATE VIEW INV.vw_orders_demo00_vehicle AS
SELECT o.id
  , o.order_id
  , o.supplier_id
  , s.name AS supplier
  , o.item_id
  , o.status
  , o.qty
  , o.net_price
  , o.qty * o.net_price AS ttl_price
  , issued_at
  , JSON_VALUE(o.spec, '$.spec.Year') AS Year
  , JSON_VALUE(o.spec, '$.spec.Make') AS Make
  , JSON_VALUE(o.spec, '$.spec.Model') AS Model
  , JSON_VALUE(o.spec, '$.spec.Category') AS Category
  FROM INV.orders_demo00 o
  JOIN INV.suppliers s ON s.id = o.supplier_id
WHERE JSON_VALUE(o.spec, '$.type') = 'vehicle';



--- Destination table in StarRocks
USE DWH;

CREATE TABLE `orders_kafka_json_01` (
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


CREATE TABLE `vw_order_cp_avro_01_by_id_query` (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
  `ttl_price` INT COMMENT "",
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


CREATE TABLE order_cp_avro_01_by_id_query (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
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


CREATE TABLE cp_avro_01__orders (
  `id` BIGINT NOT NULL COMMENT "",
  `order_id` VARCHAR(36) NOT NULL COMMENT "",
  `supplier_id` INT NOT NULL COMMENT "",
  `item_id` INT NOT NULL COMMENT "",
  `status` VARCHAR(20) NOT NULL COMMENT "",
  `qty` INT NOT NULL COMMENT "",
  `net_price` INT NOT NULL COMMENT "",
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
----
