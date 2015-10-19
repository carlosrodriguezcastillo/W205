-- ************************************************************
-- This is the select for the top 10 procedures by score variability
-- ************************************************************

set hive.cli.print.header=true;

SELECT
	p.measureid,
	p.measurename,
	stddev(p.score) as stddev_score
FROM	
	procedures p 
GROUP BY
	p.measureid, p.measurename
ORDER BY
	stddev_score DESC
LIMIT 10;
