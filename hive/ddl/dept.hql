CREATE EXTERNAL TABLE `dept_csv`(
  `dept_no` string,
  `dept_name` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
LOCATION
  '/hive-data/warehouse/dept_csv'
tblproperties ("skip.header.line.count"="1")
;


-- csv managed table --
CREATE TABLE `dept`
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
AS SELECT * FROM dept_csv;
;



