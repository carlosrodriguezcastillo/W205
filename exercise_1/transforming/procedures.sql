DROP TABLE IF EXISTS procedures_temp;
DROP TABLE IF EXISTS procedures;

CREATE TABLE procedures_temp
STORED AS PARQUET
AS
select 
	providerid as hospitalid,
	measureid as measureid, 
	measurename as measurename, 
	CAST(score AS DOUBLE) as score,
	max(CAST(score as DOUBLE)) OVER (PARTITION BY measureid) as normalizing_score
from 
	effective_care 
where 
	score RLIKE '^[0-9]+(\.[0-9]*)$' AND 
	sample RLIKE '^[0-9]+(\.[0-9]*)$'

UNION ALL

select 
	providerid as hospitalid, 
	measureid as measureid, 
	measurename as measurename, 
	CAST(score AS DOUBLE) as score,
	max(CAST(score as DOUBLE)) OVER (PARTITION BY measureid) as normalizing_score 
from 
	readmissions 
where 
	score RLIKE '^[0-9]+(\.[0-9]*)$';


CREATE TABLE procedures
STORED AS PARQUET
AS
SELECT
	hospitalid as hospitalid,
	measureid as measureid,
	measurename as measurename,
	score as score,
	normalizing_score as normalizing_score,
	CASE
		WHEN normalizing_score > 1000
		THEN 'care_score'
		ELSE 'readmission_score'
	END AS score_type
FROM
	procedures_temp;
