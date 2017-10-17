--hadoop
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from Tla_rsrp_eutr a,eutrancell b,region_city c
where scan_start_time>=TRUNC(sysdate-1,'DD')
and a.int_id=b.int_id
and b.city_id=c.city_id
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')


