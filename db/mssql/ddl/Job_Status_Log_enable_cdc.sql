use schematic_test_src
GO

EXEC sys.sp_cdc_enable_db  
GO


EXEC sys.sp_cdc_enable_table @source_schema =  N'SourceSchema', @source_name =  N'Job_Status_Log', 
@role_name =  NULL, @supports_net_changes =  0;


EXEC sys.sp_cdc_disable_table @source_schema =  N'SourceSchema', @source_name =  N'Job_Status_Log', 
@role_name =  NULL, @supports_net_changes =  0;