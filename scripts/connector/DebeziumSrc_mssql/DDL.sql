--- Source table in SQL Server
USE [inventory]
GO

/****** Object:  Table [INV].[invoices]    Script Date: 2024/8/26 上午 12:34:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [INV].[invoices](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[invoice_id] [nvarchar](36) NOT NULL,
	[customer_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[class] [nvarchar](1) NOT NULL,
	[qty] [int] NOT NULL,
	[price] [decimal](18, 4) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_invoices] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [inventory]
GO

/****** Object:  Table [INV].[orders]    Script Date: 2024/8/26 上午 12:34:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [INV].[orders](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [nvarchar](36) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[qty] [int] NOT NULL,
	[net_price] [int] NOT NULL,
	[issued_at] [datetime2](7) NOT NULL,
	[completed_at] [datetime] NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [inventory]
GO

/****** Object:  Table [INV].[orders_demo00]    Script Date: 2024/8/26 上午 12:34:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [INV].[orders_demo00](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[order_id] [nvarchar](36) NOT NULL,
	[supplier_id] [int] NOT NULL,
	[item_id] [int] NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[qty] [int] NOT NULL,
	[net_price] [int] NOT NULL,
	[issued_at] [datetime] NOT NULL,
	[completed_at] [datetime] NULL,
	[spec] [nvarchar](4000) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
 CONSTRAINT [PK_orders_demo00] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [inventory]
GO

/****** Object:  Table [INV].[suppliers]    Script Date: 2024/8/26 上午 12:35:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [INV].[suppliers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[type] [varchar](255) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
 CONSTRAINT [PK__supplier__3213E83F7D0FB0F6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



--- Destination table in MySQL
CREATE TABLE `mssql_INV_cp_avro_CDC_DebeziumSrc02_JdbcSink_mysql_orders_demo00` (
  `id` bigint NOT NULL,
  `order_id` text NOT NULL,
  `supplier_id` int NOT NULL,
  `item_id` int NOT NULL,
  `status` text NOT NULL,
  `qty` int NOT NULL,
  `net_price` int NOT NULL,
  `issued_at` bigint NOT NULL,
  `completed_at` bigint DEFAULT NULL,
  `spec` text,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `__op` text,
  `__table` text,
  `__source_ts_ms` datetime(3) DEFAULT NULL,
  `__deleted` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci


CREATE TABLE `mssql_INV_cp_avro_CDC_DebeziumSrc03_INV_orders_demo00` (
  `id` bigint NOT NULL,
  `order_id` text NOT NULL,
  `supplier_id` int NOT NULL,
  `item_id` int NOT NULL,
  `status` text NOT NULL,
  `qty` int NOT NULL,
  `net_price` int NOT NULL,
  `issued_at` bigint NOT NULL,
  `completed_at` bigint DEFAULT NULL,
  `spec` text,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `ingested_at` datetime(3) DEFAULT NULL,
  `__op` text,
  `__table` text,
  `__source_ts_ms` datetime(3) DEFAULT NULL,
  `__deleted` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci




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
  `updated_ts` DATETIME NULL DEFAULT CURRENT_TIMESTAMP COMMENT "",

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
"enable_persistent_index" = "true",
"storage_format" = "DEFAULT",
"compression" = "LZ4"
);

select * from mssql_INV_cp_avro_CDC_DebeziumSrc02_INV_orders_demo00



CREATE TABLE `mssql_INV_cp_avro_CDC_DebeziumSrc02_INV_orders_demo00` (
  `id` bigint(20) NOT NULL COMMENT "",
  `order_id` varchar(36) NOT NULL COMMENT "",
  `supplier_id` int(11) NOT NULL COMMENT "",
  `item_id` int(11) NOT NULL COMMENT "",
  `status` varchar(20) NOT NULL COMMENT "",
  `qty` int(11) NOT NULL COMMENT "",
  `net_price` int(11) NOT NULL COMMENT "",
  `issued_at` datetime NOT NULL COMMENT "",
  `completed_at` datetime NOT NULL COMMENT "",
  `spec` json NULL COMMENT "",
  `created_at` datetime NOT NULL COMMENT "",
  `updated_at` datetime NOT NULL COMMENT "",
  `ingested_at` datetime NOT NULL COMMENT "",
  `__db` varchar(128) NULL COMMENT "",
  `__schema` varchar(128) NULL COMMENT "",
  `__table` varchar(128) NULL COMMENT "",
  `__source_ts_ms` datetime NULL COMMENT "",
  `__ts_ms` datetime NULL COMMENT "",
  `__deleted` boolean NULL COMMENT ""
) ENGINE=OLAP 
PRIMARY KEY(`id`)
COMMENT "OLAP"
DISTRIBUTED BY HASH(`id`) BUCKETS 10 
PROPERTIES (
"replication_num" = "1",
"in_memory" = "false",
"enable_persistent_index" = "true",
"replicated_storage" = "true",
"compression" = "LZ4"
);