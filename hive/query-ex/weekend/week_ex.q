create table week_ex as
select userid,
(CASE WHEN ymd=20170417 THEN 1 ELSE 0 END) as mon,
(CASE WHEN ymd=20170418 THEN 1 ELSE 0 END) as tue, 
(CASE WHEN ymd=20170419 THEN 1 ELSE 0 END) as wed, 
(CASE WHEN ymd=20170420 THEN 1 ELSE 0 END) as thu, 
(CASE WHEN ymd=20170421 THEN 1 ELSE 0 END) as fri,
(CASE WHEN ymd=20170422 THEN 1 ELSE 0 END) as sat,
(CASE WHEN ymd=20170423 THEN 1 ELSE 0 END) as sun
FROM brook00.uservisit_o
WHERE ymd >=20170417 AND ymd <=20170423
;



select userid, 
sum(mon) as mon, sum(tue) as tue, sum(wed) as wed, sum(thu) as thu, sum(fri) as fri, sum(sat) as sat, sum(sun) as sun
from (
select userid,
(CASE WHEN ymd=20170417 THEN 1 ELSE 0 END) as mon,
(CASE WHEN ymd=20170418 THEN 1 ELSE 0 END) as tue, 
(CASE WHEN ymd=20170419 THEN 1 ELSE 0 END) as wed, 
(CASE WHEN ymd=20170420 THEN 1 ELSE 0 END) as thu, 
(CASE WHEN ymd=20170421 THEN 1 ELSE 0 END) as fri,
(CASE WHEN ymd=20170422 THEN 1 ELSE 0 END) as sat,
(CASE WHEN ymd=20170423 THEN 1 ELSE 0 END) as sun
FROM brook00.uservisit_o
WHERE ymd >=20170417 AND ymd <=20170423
)
;

select tbl.userid, 
sum(tbl.mon) as mon, sum(tbl.tue) as tue, sum(tbl.wed) as wed, sum(tbl.thu) as thu, sum(tbl.fri) as fri, sum(tbl.sat) as sat, sum(tbl.sun) as sun
from (
select userid,
(CASE WHEN ymd=20170417 THEN 1 ELSE 0 END) as mon,
(CASE WHEN ymd=20170418 THEN 1 ELSE 0 END) as tue, 
(CASE WHEN ymd=20170419 THEN 1 ELSE 0 END) as wed, 
(CASE WHEN ymd=20170420 THEN 1 ELSE 0 END) as thu, 
(CASE WHEN ymd=20170421 THEN 1 ELSE 0 END) as fri,
(CASE WHEN ymd=20170422 THEN 1 ELSE 0 END) as sat,
(CASE WHEN ymd=20170423 THEN 1 ELSE 0 END) as sun
FROM brook00.uservisit_o
WHERE ymd >=20170417 AND ymd <=20170423
) tbl
group by tbl.userid
;

