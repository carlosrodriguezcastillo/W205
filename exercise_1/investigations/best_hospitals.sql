-- ************************************************************
-- This is the select for the top 10 hospitals for constistently high
-- scores in procedures
-- ************************************************************

set hive.cli.print.header=true;

SELECT
	h.hospitalid,
	h.hospitalname,
	avg(p.score) as avg_score
FROM
	procedures p
	JOIN
		hospitals h ON
		p.hospitalid = h.hospitalid
GROUP BY
	h.hospitalid, h.hospitalname
HAVING
	count(1) >= 30
ORDER BY
	avg_score DESC
LIMIT 10;
