
select workid from tmp_delcanshu
where flowstarttime < to_date('2017-06-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
--where order_type like '%�����޸�%'
and (order_type like '%�����޸�%'
or order_type like '%��������%'
or order_type like '%���з����ɵ�%'
or order_type like '%2/4����ϵ�˲�%')
--and flowstarttime < to_date('2017-06-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')