CREATE EXTERNAL TABLE `dialogstat_row_output_v2`(  
   `timestamp` timestamp,                           
   `site` string,                                   
   `login_time` string,                             
   `req_time` string,                               
   `max_rsp_time` string,                           
   `min_rsp_time` string,                           
   `rsp_duration` string,                           
   `req_rsp_duration` string,                       
   `dialogsessionid` string,                        
   `dialogtransactionid` string,                    
   `user_id` string,                                
   `provider` string,                               
   `provider_usn` string,                           
   `user_unique_id` string,                         
   `new_account` string,                            
   `menu_id` string,                                
   `keyword` string,                                
   `svc_type` string,                               
   `roleinstance` string,                           
   `browser` string,                                
   `browser_version` string,                        
   `device_model` string,                           
   `device_name` string,                            
   `os_version` string,                             
   `content` string,                                
   `prompt_id` string,                              
   `intent` string,                                 
   `prompt_id_first` string,                        
   `prompt_id_last` string,                         
   `intent_first` string,                           
   `intent_last` string,                            
   `restart` string,                                
   `rsp_content` string,                            
   `rsp_payload` string,                            
   `rsp_count` string,                              
   `session_start_time` string,                     
   `session_end_time` string,                       
   `session_duration` string,                       
   `session_state` string,                          
   `scenario` string,                               
   `intent_str_first` string,                       
   `intent_str_last` string,                        
   `prompt_group_first` string,                     
   `prompt_field_first` string,                     
   `prompt_group_last` string,                      
   `prompt_field_last` string,                      
   `prompt_case_first` string,                      
   `prompt_case_last` string,                       
   `conn_loc` string,                               
   `keyword_str` string,                            
   `menu_id_str` string,                            
   `svc_type_str` string,                           
   `state` string)                                  
 PARTITIONED BY (                                   
   `dt` string,                                     
   `type` string)                                   
 ROW FORMAT SERDE                                   
   'org.apache.hadoop.hive.ql.io.parquet.serde.ParquetHiveSerDe'  
 STORED AS INPUTFORMAT                              
   'org.apache.hadoop.hive.ql.io.parquet.MapredParquetInputFormat'  
 OUTPUTFORMAT                                       
   'org.apache.hadoop.hive.ql.io.parquet.MapredParquetOutputFormat' 
 LOCATION                                           
   '/data-src/mi/commbot/dialogStat_row_output_v2'

alter table dialogStat_row_output_v2 add partition (dt='2020-09-07', type='prd');
alter table dialogStat_row_output_v2 add partition (dt='2020-12-09', type='prd');
alter table dialogStat_row_output_v2 add partition (dt='2020-12-09', type='qa');
alter table dialogStat_row_output_v2 add partition (dt='2020-11-20', type='prd');

;
alter table order_items add partition (year=2013, month=1);