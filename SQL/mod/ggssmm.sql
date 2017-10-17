SELECT omc_id, SUM(count_8), SUM(count_9), SUM(count_10)
FROM (
	SELECT b.omc_id, COUNT(a.int_id) AS count_8, 0 AS count_9, 0 AS count_10
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = to_date('2017-06-15 08:00:00', 'yyyy-mm-dd hh24:mi:ss')
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
	UNION
	SELECT b.omc_id, 0 AS count_8, COUNT(a.int_id) AS count_9, 0 AS count_10
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = to_date('2017-06-15 09:00:00', 'yyyy-mm-dd hh24:mi:ss')
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
	UNION
	SELECT b.omc_id, 0 AS count_8, 0 AS count_9, COUNT(a.int_id) AS count_10
	FROM tpa_mr_qoe_cell_ne a, cell b
	WHERE a.scan_start_time = to_date('2017-06-08 10:00:00', 'yyyy-mm-dd hh24:mi:ss')
		AND a.int_id = b.int_id
	GROUP BY b.omc_id
)
GROUP BY omc_id