


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
