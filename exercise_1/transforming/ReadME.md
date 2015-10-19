# Summary

The purpose of this folder is to hold the files for section two of exercise 1 for MIDS W205. This folder contains three files:

- **hospitals.sql** - Creates the hospitals table from base hospital table in Hive
- **procedures.sql** - Creates the procedures table from the base readmissions and timely and effective care tables in Hive. The main transformations that occur in this file are that the two base tables' scores are normalized (by across all like procedures) and scores are transformed such that they are all oriented in the same direction. Punctually, this means that all normalized readmissions scores were inverted by being subtracted from 1; the same transformation was applied to relevant procedures in timely and effective care (measureIDs: 'ED_1b', 'ED_2b', 'EDV', 'OP_1', 'OP_3b', 'OP_5', 'OP_18', 'OP_20', 'OP_21', 'OP_22', 'PC_01'). Finally, only numeric scores were considered in the final procedures table.
- **survey_results.sql** - Creates the survey results table from the base survey_responses table in Hive. The survey results are constructed from the Consistency and Base scores as specified in the Survey's documentation (see "HCAHPS and Hospital VBP Scoring" here: http://www.hcahpsonline.org/files/HCAHPS%20Fact%20Sheet%20May%202012.pdf).
