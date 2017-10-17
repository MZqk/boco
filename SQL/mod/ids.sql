/*tap_ao_ids_eutrancell*/
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tap_ao_ids_eutrancell
where scan_start_time>=TRUNC(sysdate-1,'DD')
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
