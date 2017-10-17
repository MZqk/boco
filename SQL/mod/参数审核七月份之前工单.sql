
select workid from tmp_delcanshu
where flowstarttime < to_date('2017-06-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
--where order_type like '%参数修改%'
and (order_type like '%参数修改%'
or order_type like '%参数整改%'
or order_type like '%集中分析派单%'
or order_type like '%2/4关联系核查%')
--and flowstarttime < to_date('2017-06-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')