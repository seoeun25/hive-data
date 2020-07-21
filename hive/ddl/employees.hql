CREATE EXTERNAL TABLE `employees`(
  `emp_no` bigint,
  `birth_date` string,
  `first_name` string,
  `last_name` string,
  `gender` string,
  `hire_date` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
LOCATION
  '/hive-data/warehouse/employees'
tblproperties ("skip.header.line.count"="1")
;


CREATE EXTERNAL TABLE `employees`(
  `emp_no` bigint,
  `birth_date` string,
  `first_name` string,
  `last_name` string,
  `gender` string,
  `hire_date` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
LOCATION
  '/hive-data/warehouse/employees'
tblproperties ("skip.header.line.count"="1")
;

-- csv --
CREATE TABLE `employee`
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
AS SELECT * FROM employees where hire_date >= '1999-01-01' and hire_date < '1999-01-11';
;

CREATE EXTERNAL TABLE `employee_ex`(
  `emp_no` bigint,
  `birth_date` string,
  `first_name` string,
  `last_name` string,
  `gender` string,
  `hire_date` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
LOCATION
  '/data-src/employee_ex'
;

LOAD DATA LOCAL INPATH './employee.csv' INTO TABLE employee;
LOAD DATA INPATH '/data-src/employee/employee.csv' INTO TABLE employee;

CREATE EXTERNAL TABLE `employee_dt`(
  `emp_no` bigint,
  `birth_date` string,
  `first_name` string,
  `last_name` string,
  `gender` string
)
PARTITIONED BY (hire_date string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ","
STORED AS TEXTFILE
LOCATION
  '/data-src/employee_dt'
;

INSERT INTO employee_dt partition(hire_date)
SELECT emp_no, birth_date, first_name, last_name, gender, hire_date
FROM employee;



CREATE TABLE `employee_wrap`(
  `emp_no` bigint,
  `birth_date` string,
  `first_name` string,
  `last_name` string,
  `gender` string,
  `hire_date` string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
   "separatorChar" = ",",
   "quoteChar"     = "\""
)
;
LOAD DATA LOCAL INPATH './employee.csv' INTO TABLE employee_wrap;
LOAD DATA INPATH '/hive-data/employee_wrap.csv' INTO TABLE employee_wrap;

-- orc --
CREATE TABLE `employee_orc`
STORED AS ORC
AS SELECT * FROM employees where hire_date >= '1999-03-01' and hire_date < '1999-03-11';
;

CREATE TABLE `employee_orc`(
  `emp_no` bigint,
  `birth_date` string,
  `first_name` string,
  `last_name` string,
  `gender` string,
  `hire_date` string)
STORED AS ORC
;


