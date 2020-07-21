#!/usr/bin/env bash

input_start=20161102
input_end=20170808

table="actdb.purchase_count_ymd"
partition="ymd"
location="gs://brook/hive/warehouse/actdb.db/purchase_count_ymd";

startdate=$(date -I -d $input_start) || exit -1
enddate=$(date -I -d $input_end) || exit -1

d="$startdate"
#echo "d = $d"
while  [ "$d" != "$enddate" ]; do
  #echo $d
  dt=$(date -d "$d" +%Y%m%d)
  #echo $dt
  cmd="hive -f purchase3_migration.q --hiveconf dt_daily=$dt '"
  echo $cmd
  `$cmd`
  d=$(date -I -d "$d + 1 day")
done

