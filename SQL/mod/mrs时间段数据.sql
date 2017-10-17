--average延迟八小时
select a.scan_start_time, count(*) 
from tla_average_eutr a,eutrancell b,region_city c
where scan_start_time>=TRUNC(sysdate-1,'DD')
and a.int_id=b.int_id                      
and b.city_id=c.city_id
and sum_level=0
group by scan_start_time
order by scan_start_time;
--rsrp延迟五小时
select a.scan_start_time, count(*) 
from tla_rsrp_eutr a,eutrancell b,region_city c
where scan_start_time>=TRUNC(sysdate-1,'DD')
and a.int_id=b.int_id                      
and b.city_id=c.city_id
and sum_level=0
group by scan_start_time
order by scan_start_time;