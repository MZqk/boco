--查询未派发工单的小区
select * from tap_centralize_detail where workid is null;