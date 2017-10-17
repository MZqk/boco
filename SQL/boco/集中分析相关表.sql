--1）集中分析主表 集中分列表所呈现的基本信息内容。存储所有未归档的内容。
select * from tap_centralize;
--2）集中分析主表历史表 存储所有已归档的主表内容。
select * from tap_centralize_his;
--3）集中分析业务表 所有与集中分析相关的业务字段存储的表。该表省端可以任意扩展字段，存储省端个性业务字段。
select * from tap_centralize_business;
--4）集中分析业务表历史表 存储所有已归档的业务表内容。
select * from tap_centralize_business_his;
--5）集中分析详情表 存储集中分析列表所呈现的内容对应的每个小区有那些规则，那些场景。
select * from tap_centralize_detail;
--6）集中分析详情表历史表 存储所有已归档的详情表内容。
select * from tap_centralize_detail_his;
--7）集中分析关联流程表 用来存储多个流程相关信息。
select * from tap_centralize_flow;