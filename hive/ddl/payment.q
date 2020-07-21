-- need jason serde
-- add jar or aux lib
CREATE EXTERNAL TABLE `payment`(
  `user_id` bigint, 
  `payment_id` bigint, 
  `amount` double, 
  `bonuscoin_amount` double, 
  `coinproduct_id` bigint, 
  `confirmed_at` bigint, 
  `created_at` bigint, 
  `currency` string, 
  `idapproval` string, 
  `locale` string, 
  `payment_type` string, 
  `pgcompany` string, 
  `point_amount` bigint, 
  `state` string, 
  `store` string
)
ROW FORMAT SERDE 
  'org.apache.hive.hcatalog.data.JsonSerDe' 
STORED AS TEXTFILE 
LOCATION
  '/hive-data/warehouse/payment'
;