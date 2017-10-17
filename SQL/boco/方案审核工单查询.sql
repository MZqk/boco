SELECT *
  FROM (SELECT a.*, rownum rn
          FROM (select a.WorkID,
                       a.pworkid as ParentWorkID,
                       a.FID,
                       a.FK_Flow,
                       a.FK_Node,
                       b.flowcode,
                       a.nodename as FK_NodeText,
                       b.FlowTitle,
                       b.FlowNo,
                       a.wfstate as wf_state,
                       b.FlowStarter,
                       b.FlowStartTime,
                       b.FlowFinishTime,
                       a.fk_emp,
                       a.rdt,
                       a.FlowName,
                       b.StationName,
                       b.city,
                       case c.fk_type
                         when '2' then
                          '突发紧急'
                         else
                          '普通'
                       end as act_type,
                       case c.order_type
                         when '1' then
                          '参数修改'
                         when '2' then
                          '参数整改'
                         when '3' then
                          '集中分析派单'
                         when '4' then
                          '24G参数修改'
                         else
                          '参数修改'
                       end as order_type,
                       case
                         when to_date('2017-07-05 10:27:06',
                                      'yyyy-mm-dd hh24:mi:ss') -
                              b.flowstarttime < c.act_limits and
                              to_date('2017-07-05 10:27:06',
                                      'yyyy-mm-dd hh24:mi:ss') -
                              b.flowstarttime + 1 > c.act_limits then
                          '即将超时'
                         when to_date('2017-07-05 10:27:06',
                                      'yyyy-mm-dd hh24:mi:ss') -
                              b.flowstarttime < c.act_limits or
                              c.act_limits is null then
                          '未超时'
                         else
                          '已超时'
                       end timeout_state
                  FROM wf_empworks            a,
                       tap_task_overview      b,
                       tap_parameter_busiinfo c
                 WHERE 1 = 1
                   AND (a.workid = b.workid or a.fid = b.workid)
                   and b.workid = c.workid
                   AND a.fk_flow = 008
                   AND a.FK_Emp = 'liuf'
                   AND a.fk_node = 802
                 order by FlowStartTime desc, c.fk_type desc
                
                ) a
         WHERE rownum <= 20000)
 WHERE rn >= 1
 and flowstarttime < to_date('2017-06-01 00:00:00', 'yyyy-mm-dd hh24:mi:ss')
/*
 [param0=[FK_Flow,008], 
 param1=[FK_Emp,liuf], 
 param2=[NodeID,802],
  param3=[row_end_index,15],
   param4=[row_start_index,1]]
   170042528
   170042524
   */
   