select count(*) from tco_pro_cell a,cell b
where a.int_id=b.int_id
and a.ant_height is null