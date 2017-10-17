--±í¿Õ¼ä
select scan_start_time,count(*) from tap_gen_checkdata 
where scan_start_time>=TRUNC(sysdate - 1, 'DD')
group by scan_start_time
