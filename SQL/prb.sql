/*tpd_eutr_prb_q*/
select to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss'),count(*) from tpd_eutr_prb_q
where scan_start_time>=TRUNC(sysdate-1,'DD')
group by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')
having count(*)>1000
order by to_char(scan_start_time,'yyyy-mm-dd hh24:mi:ss')