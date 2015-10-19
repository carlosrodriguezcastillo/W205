from pyspark.sql import HiveContext
from pyspark.mllib.stat import Statistics
from pyspark import SparkContext

sc = SparkContext()

sqlContext = HiveContext(sc)

initialquery = sqlContext.sql("SELECT         A.avg_procedure_score,         B.patientsurveyscore FROM         (SELECT                 p.hospitalid,                 avg(p.score) as avg_procedure_score         FROM                 procedures p         GROUP BY                 p.hospitalid) A JOIN         survey_results B ON B.hospitalid = A.hospitalid")

survey_score = initialquery.map(lambda x: x.patientsurveyscore)
avg_procedure_scores = initialquery.map(lambda x: x.avg_procedure_score)

print Statistics.corr(avg_procedure_scores, survey_score, method="pearson")
