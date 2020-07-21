CREATE EXTERNAL TABLE brook02.week(
  `mon` int, 
  `tue` int, 
  `wed` int, 
  `thu` int, 
  `fri` int, 
  `sat` int, 
  `sun` int 
)
ROW FORMAT DELIMITED
   FIELDS TERMINATED BY ','
LOCATION
  'gs://brook/hive/warehouse/brook02.db/week'
  ;