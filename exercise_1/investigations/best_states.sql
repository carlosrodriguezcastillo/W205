-- ************************************************************
-- This is the select for the top 10 states for quality of care
-- ************************************************************

set hive.cli.print.header=true;

SELECT
	h.state,
	avg(p.score) as avg_score
FROM	
	procedures p 
	JOIN
		hospitals h ON
		p.hospitalid = h.hospitalid
GROUP BY
	h.state
HAVING
	count(1) >= 30
ORDER BY
	avg_score DESC
LIMIT 10;
