DROP TABLE IF EXISTS effective_care;
DROP TABLE IF EXISTS hospital_base;
DROP TABLE IF EXISTS measure_dates;
DROP TABLE IF EXISTS readmissions;
DROP TABLE IF EXISTS survey_responses;

CREATE EXTERNAL TABLE hospital_base (
   ProviderID string,
   HospitalName string,
   Address string,
   City string,    
   State string, 
   ZIPCode string, 
   CountyName string, 
   PhoneNumber string, 
   HospitalType string, 
   HospitalOwnership string, 
   EmergencyServices string) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
      "separatorChar" = ',',
      "quoteChar" = '"',
      "escapeChar" = '\\'
)
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/hospitals';

CREATE EXTERNAL TABLE effective_care (
	ProviderID string,
	HospitalName string,
	Address string,
	City string,
	State string,
	ZIPCode string,
	CountyName string,
	PhoneNumber string,
	Condition string,
	MeasureID string,
	MeasureName string,
	Score string,
	Sample string,
	Footnote string,
	MeasureStartDate string,
	MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ',',
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE LOCATION
'/user/w205/hospital_compare/effective_care';

CREATE EXTERNAL TABLE measure_dates (
	MeasureName string,
	MeasureID string,
	MeasureStartQuarter string,
	MeasureStartDate string,
	MeasureEndQuarter string,
	MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ',',
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/measure_dates';

CREATE EXTERNAL TABLE readmissions (
	ProviderID string,
	HospitalName string,
	Address string,
	City string,
	State string,
	ZIPCode string,
	CountyName string,
	PhoneNumber string,
	MeasureName string,
	MeasureID string,
	ComparedToNational string,
	Denominator string,
	Score string,
	LowerEstimate string,
	HigherEstimate string,
	Footnote string,
	MeasureStartDate string,
	MeasureEndDate string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ',',
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/readmissions';

CREATE EXTERNAL TABLE survey_responses (
	ProviderNumber string COMMENT 'This is analogous to ProviderID',
	HospitalName string,
	Address string,
	City string,
	State string,
	ZIPCode string,
	CountyName string,
	CommunicationWithNursesAchievementPoints string,
	CommunicationWithNursesImprovementPoints string,
	CommunicationWithNursesDimensionScore string,
	CommunicationWithDoctorsAchievementPoints string,
	CommunicationWithDoctorsImprovementPoints string,
	CommunicationWithDoctorsDimensionScore string,
	ResponsivenessOfHospitalStaffAchievementPoints string,
	ResponsivenessOfHospitalStaffImprovementPoints string,
	ResponsivenessOfHospitalStaffDimensionScore string,
	PainManagementAchievementPoints string,
	PainManagementImprovementPoints string,
	PainManagementDimensionScore string,
	CommunicationAboutMedicinesAchievementPoints string,
	CommunicationAboutMedicinesImprovementPoints string,
	CommunicationAboutMedicinesDimensionScore string,
	CleanlinessAndQuietnessOfHospitalEnvironmentAchievementPoints string,
	CleanlinessAndQuietnessOfHospitalEnvironmentImprovementPoints string,
	CleanlinessAndQuietnessOfHospitalEnvironmentDimensionScore string,
	DischargeInformationAchievementPoints string,
	DischargeInformationImprovementPoints string,
	DischargeInformationDimensionScore string,
	OverallRatingOfHospitalAchievementPoints string,
	OverallRatingOfHospitalImprovementPoints string,
	OverallRatingOfHospitalDimensionScore string,
	HCAHPSBaseScore string,
	HCAHPSConsistencyScore string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
	"separatorChar" = ',',
	"quoteChar" = '"',
	"escapeChar" = '\\'
)
STORED AS TEXTFILE LOCATION '/user/w205/hospital_compare/survey_responses';

