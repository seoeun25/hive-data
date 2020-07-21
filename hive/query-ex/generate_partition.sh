#!/usr/bin/env bash

input_start=20150701
input_end=20180702

table="lz_server.read_ymd"
partition="ymd"
location="gs://brook/hive/warehouse/lz_server.db/read_ymd";

startdate=$(date -I -d $input_start) || exit -1
enddate=$(date -I -d $input_end) || exit -1

d="$startdate"
#echo "d = $d"
while  [ "$d" != "$enddate" ]; do
  #echo $d
  dt=$(date -d "$d" +%Y%m%d)
  #echo $dt
  cmd="ALTER TABLE $table ADD PARTITION ($partition = $dt) location '$location/$partition=$dt';"
  echo $cmd
  d=$(date -I -d "$d + 1 day")
done
