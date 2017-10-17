
/*tpd_eutrancell_4_q*/
select scan_start_Time,count(*) from tpd_eutrancell_4_q
where scan_start_time>=TRUNC(sysdate-1,'DD')
group by scan_start_Time
having count(*)>1000
order by scan_start_Time