CREATE TABLE `tos_parquet`
STORED AS PARQUET
AS SELECT * FROM tos_cmpgn_ext limit 10
;

CREATE EXTERNAL TABLE `tos_parquet`(
  `cmpgn_num` string,
  `cmpgn_nm` string,
  `cmpgn_st_cd` string,
  `cmpgn_sta_dt` string,
  `cmpgn_exec_typ_cd` string,
  `extrt_dt` string,
  `ract_typ_cd` string,
  `cust_age_cd` string,
  `sex_cd` string,
  `eqp_mdl_nm` string,
  `prod_nm` string,
  `arpus` double,
  `send_cnt` bigint,
  `click_cnt` bigint)
STORED AS PARQUET
LOCATION
  '/data-src/parquet/tos_parquet'
;

