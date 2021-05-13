CREATE EXTERNAL TABLE `dept_header`(
  `dept_no` string,
  `dept_name` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
LOCATION
  '/data-src/dept_header'
tblproperties ("skip.header.line.count"="1")
;

CREATE EXTERNAL TABLE `dept`(
  `dept_no` string,
  `dept_name` string,
  `fruit` string
)
PARTITIONED BY (con_date string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
LOCATION
  '/data-src/dept'
;
alter table dept add partition (con_date='2021-04-25');
alter table dept add partition (con_date='2021-04-26');
alter table dept add partition (con_date='2021-04-27');
// add column 한 후에 fruit 컬럼의 데이터가 null이 됨. 새로 schema 생성.
ALTER TABLE dept ADD COLUMNS (`fruit` string);
alter table dept add partition (con_date='2021-04-29');




-- csv managed table --
CREATE TABLE `dept`
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
AS SELECT * FROM dept_csv;
;



