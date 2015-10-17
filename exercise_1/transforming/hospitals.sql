DROP TABLE IF EXISTS hospitals;

CREATE TABLE hospitals
STORED AS PARQUET
AS

SELECT
	providerid as hospitalid,
	hospitalname as hospitalname,
	state as state
FROM
	hospital_base;

