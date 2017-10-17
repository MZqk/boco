
/*GSM*/
/*用这个语句核查小时粒度的，更换时间，查8、9、10、18、19、20的数据*/
--当天8、9、10数据（数据要在当天14点后才能生成）
SELECT omc_id, SUM(count_8), SUM(count_9), SUM(count_10)
FROM (
	SELECT b.omc_id, COUNT(a.int_id) AS count_8, 0 AS count_9, 0 AS count_10
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = TRUNC(sysdate) +08/(24)
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
	UNION
	SELECT b.omc_id, 0 AS count_8, COUNT(a.int_id) AS count_9, 0 AS count_10
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = TRUNC(sysdate) +09/(24)
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
	UNION
	SELECT b.omc_id, 0 AS count_8, 0 AS count_9, COUNT(a.int_id) AS count_10
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = TRUNC(sysdate) +10/(24)
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
)
GROUP BY omc_id;
--前一天18、19、20数据
SELECT omc_id, SUM(count_18), SUM(count_19), SUM(count_20)
FROM (
	SELECT b.omc_id, COUNT(a.int_id) AS count_18, 0 AS count_19, 0 AS count_20
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = TRUNC(sysdate - 1) +18/(24)
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
	UNION
	SELECT b.omc_id, 0 AS count_18, COUNT(a.int_id) AS count_19, 0 AS count_20
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = TRUNC(sysdate - 1) +19/(24)
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
	UNION
	SELECT b.omc_id, 0 AS count_18, 0 AS count_19, COUNT(a.int_id) AS count_20
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = TRUNC(sysdate - 1) +20/(24)
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
)
GROUP BY omc_id;
/*用这个语句查前一天sum_level=11天六忙时粒度的数据*/
select b.omc_id,count(a.int_id)
from tpa_mr_qoe_cell_ne a,cell b
where a.scan_start_time=TRUNC(sysdate-1,'DD')
and a.int_id=b.int_id 
and a.sum_level=11
group by b.omc_id;
/*这是查资源数据*/
select omc_id,count(*) from cell 
group by omc_id
order by omc_id;
