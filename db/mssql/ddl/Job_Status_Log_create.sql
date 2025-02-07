USE [schematic_test_src]
GO

/****** Object:  Table [SourceSchema].[Job_Status_Log]    Script Date: 2023/10/13 上午 11:35:47 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [SourceSchema].[Job_Status_Log](
	[JobLogId] [bigint] IDENTITY(1,1) NOT NULL,
	[ETL_Procedure] [nvarchar](255) NOT NULL,
	[ETL_Parameter] [nvarchar](512) NULL,
	[ETL_StartTime] [datetime2](7) NOT NULL,
	[ETL_CompleteTime] [datetime2](7) NULL,
	[ETL_Status] [int] NULL,
	[ETL_Status_Description] [nvarchar](100) NULL,
	[ETL_UpdatedRecordCount] [int] NULL,
	[ETL_ProcessDetail] [nvarchar](2000) NULL,
	[ETL_StepsDetail] [nvarchar](max) NULL,
	[ETL_Execute_By] [nvarchar](255) NULL,
	[ETL_Batch_ID] [nvarchar](100) NULL,
	[DP_Records_Insert_DateTime] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[JobLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

