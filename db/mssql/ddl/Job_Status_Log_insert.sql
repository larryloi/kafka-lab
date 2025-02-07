
INSERT INTO [schematic_test_src].[SourceSchema].[Job_Status_Log]
([ETL_Procedure],[ETL_Parameter],[ETL_StartTime],[ETL_CompleteTime],[ETL_Status],[ETL_Status_Description],
[ETL_UpdatedRecordCount],[ETL_ProcessDetail],[ETL_StepsDetail],[ETL_Execute_By],[ETL_Batch_ID],[DP_Records_Insert_DateTime])
VALUES
('OpenercloserAdj- (Delta Update API DATA)','Venetian', '2023-09-21 15:55:58.4433333',
'2023-09-21 15:55:58.6166667', 1, 'Completed', 1, '2023-09-16 10:50:22.547', 
'[
{"Step":"Create Job status Log","status": "Completed","Endrime":"2023-08-21 15:55:58.457","RowCount":1, "Details":""},
{"Step": "Get Last Process Time", "Status":"Completed", "EndTime": "2023-08-21 15:55:58.460", "RowCount": 1, "Details": "Aug 10 2023 12:00AM"},
{"Step": "Get delta data","Status": "Completed", "EndTime": "2023-08-21 15:55:58.467","RowCount": 1, "Details": "Aug 10 2023 12:00AM"} ,
{"Step": "Insert delta data into Master query - openCloser","Status":"Completed","EndTime":"2023-08-21 15:55:58.617", "RowCount":3, "Details": 3},
{"step": "update Max Processdatetime", "Status":"completed", "Endrime":"2023-08-21 15:55:58.617","RowCount":1, "Details": "2023-08-16 10:50:22.547"}
]',
'VENETIANQA\gigi.1iu', 'openerCloserAdj-(Delta Update API DATA)_ 20230821 1555584430','2023-08-21 15:55:58.4500000');
