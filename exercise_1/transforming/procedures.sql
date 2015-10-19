-- ************************************************************
-- File where the procedures table is created
-- ************************************************************

DROP TABLE IF EXISTS procedures_temp_0;
DROP TABLE IF EXISTS procedures_temp_1;
DROP TABLE IF EXISTS procedures;

CREATE TABLE procedures_temp_0
STORED AS PARQUET
AS
select 
	providerid as hospitalid,
	measureid as measureid, 
	measurename as measurename, 
	CAST(score AS DOUBLE) as score,
	max(CAST(score as DOUBLE)) OVER (PARTITION BY measureid) as normalizing_score,
	CASE
		WHEN TRUE
		THEN 'care_score'
		ELSE 0
	END AS score_type
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
	max(CAST(score as DOUBLE)) OVER (PARTITION BY measureid) as normalizing_score,
	CASE
		WHEN TRUE
		THEN 'readmission_score'
		ELSE 0
	END AS score_type
from 
	readmissions 
where 
	score RLIKE '^[0-9]+(\.[0-9]*)$';


CREATE TABLE procedures_temp_1
STORED AS PARQUET
AS
SELECT
	hospitalid as hospitalid,
	measureid as measureid,
	measurename as measurename,
	score as score,
	normalizing_score as normalizing_score,
	score_type as score_type
FROM
	procedures_temp_0;

CREATE TABLE procedures
STORED AS PARQUET
AS
SELECT
	hospitalid as hospitalid,
	measureid as measureid,
	measurename as measurename,
	CASE
		WHEN (score_type = 'care_score' AND measureid NOT IN ('ED_1b','ED_2b','EDV','OP_1','OP_3b','OP_5','OP_18','OP_20','OP_21','OP_22','PC_01'))
		THEN (score / normalizing_score)
		WHEN (score_type = 'care_score' AND measureid IN ('ED_1b','ED_2b','EDV','OP_1','OP_3b','OP_5','OP_18','OP_20','OP_21','OP_22','PC_01'))
		THEN (1 - (score / normalizing_score))
		ELSE (1 - (score / normalizing_score))
	END AS score
FROM
	procedures_temp_1;
