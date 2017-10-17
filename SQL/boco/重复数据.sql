--查询tap_centralize_detail 表的重复数据
select * from tap_centralize_detail a 
where (a.INT_ID,a.NE_TYPE,a.TECHNOLOGY,a.SCAN_START_TIME,a.DATAFROM,a.RULE_ID,a.SCENE_ID,a.flow_no)
in (select INT_ID,NE_TYPE,TECHNOLOGY,SCAN_START_TIME,DATAFROM,RULE_ID,SCENE_ID,flow_no from tap_centralize_detail
group by INT_ID,NE_TYPE,TECHNOLOGY,SCAN_START_TIME,DATAFROM,RULE_ID,SCENE_ID,flow_no having count(*) > 1) 
and rowid not in 
(select min(rowid) from tap_centralize_detail group by INT_ID,NE_TYPE,TECHNOLOGY,SCAN_START_TIME,DATAFROM,RULE_ID,SCENE_ID,flow_no 
having count(*)>1) 
