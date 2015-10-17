DROP TABLE IF EXISTS survey_results;


CREATE TABLE survey_results
STORED AS PARQUET
AS
SELECT
	providernumber as hospitalid,
	(CAST(HCAHPSBaseScore as DOUBLE) + CAST(HCAHPSConsistencyScore as DOUBLE)) as PatientSurveyScore
FROM
	survey_responses;
