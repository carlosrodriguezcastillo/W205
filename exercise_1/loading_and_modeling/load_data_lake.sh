ls -alF /data
cd /data
mkdir exercise_1
cd exercise_1
mkdir raw_hospital_data
cd raw_hospital_data/
wget -O raw_hospital_data.zip "https://data.medicare.gov/views/bg9k-emty/files/Ma46xU4I05xsIKuEqLLi-N-s7GoO2ZefzJ7SYyTIKjA?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip"
unzip raw_hospital_data.zip
sudo -u hdfs hadoop fs -ls -R /
cd ~
ls
./start-hadoop.sh
for i in `cd /etc/init.d && ls hadoop-hdfs*`; do service $i restart; done
/usr/lib/hadoop/libexec/init-hdfs.sh
sudo -u hdfs hadoop fs -ls -R /
sudo -u hdfs hdfs dfs -ls /user
sudo -u hdfs hdfs dfs -mkdir /user/carlos
sudo -u hdfs hdfs dfs -mkdir /user/w205
sudo –u hdfs hdfs dfs –chown w205 /user/w205
sudo -u hdfs hdfs dfs –chown w205 /user/w205
sudo -u hdfs hdfs dfs -chown w205 /user/w205
cd /data/exercise_1/raw_hospital_data/
cd ..
mkdir hospital_data
cp "raw_hospital_data/Hospital General Information.csv" hospital_data/hospitals.csv
cp "raw_hospital_data/Timely and Effective Care - Hospital.csv" hospital_data/effective_care.csv
cp "raw_hospital_data/Readmissions and Deaths - Hospital.csv" hospital_data/readmissions.csv
cp "raw_hospital_data/Measure Dates.csv" hospital_data/measure_dates.csv
cp "raw_hospital_data/hvbp_hcahps_08_06_2015.csv" hospital_data/survey_responses.csv
cd hospital_data/
mkdir processed_hospital_data
tail -n +2 hospitals.csv > processed_hospital_data/hospitals.csv
tail -n +2 effective_care.csv > processed_hospital_data/effective_care.csv
tail -n +2 readmissions.csv > processed_hospital_data/readmissions.csv
tail -n +2 measure_dates.csv > processed_hospital_data/measure_dates.csv
tail -n +2 survey_responses.csv > processed_hospital_data/survey_responses.csv
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/measures_dates
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/survey_responses
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/effective_care
sudo -u w205 hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
sudo -u w205 hdfs dfs -ls /user/w205/
sudo -u w205 hdfs dfs -put processed_hospital_data/survey_responses.csv /user/w205/hospital_compare/survey_responses
sudo -u w205 hdfs dfs -put processed_hospital_data/measure_dates.csv /user/w205/hospital_compare/measure_dates
sudo -u w205 hdfs dfs -ls /user/w205/hospital_compare
sudo -u w205 hdfs dfs -ls /user/w205/
sudo -u w205 hdfs dfs -du /user/w205/
sudo -u w205 hdfs dfs -du /user/w205/
sudo -u w205 hdfs dfs -put processed_hospital_data/measure_dates.csv /user/w205/hospital_compare/measure_dates
sudo -u w205 hdfs dfs -put processed_hospital_data/survey_responses.csv /user/w205/hospital_compare/survey_responses
sudo -u w205 hdfs dfs -put processed_hospital_data/readmissions.csv /user/w205/hospital_compare/readmissions
sudo -u w205 hdfs dfs -put processed_hospital_data/effective_care.csv /user/w205/hospital_compare/effective_care
sudo -u w205 hdfs dfs -put processed_hospital_data/hospitals.csv /user/w205/hospital_compare/hospitals
sudo -u w205 hdfs dfs -du /user/w205/
sudo -u w205 hdfs dfs -du /user/w205/hospital_compare
sudo -u w205 hdfs dfs -du /user/w205/hospital_compare
