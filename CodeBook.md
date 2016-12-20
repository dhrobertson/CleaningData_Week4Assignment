## Code Book for Human Activity Recognition Using Smart Phones

Original Data Set: https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip

Original File Description: https://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.names

### File: human_act_mean_std.csv

Contains the means and standard deviations of the accelerometer readings for each subject and activity

Fields                      | Contents
----------------------------|--------------------
"subject"                   | id of subject: values 1-30
"dataCat"                   | source of data: "test"" or "train"
"activity"                  | type of activity : LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
"tBodyAccMag-mean"          | Mean of tBodyAccMag
"tBodyAccMag-std"           | Standard Deviation of tBodyAccMag
"tGravityAccMag-mean"       | Mean of tGravityAccMag   
"tGravityAccMag-std"        | Standard Deviation of tGravityAccMag
"tBodyAccJerkMag-mean"      | Mean of tBodyAccJerkMag   
"tBodyAccJerkMag-std"       | Standard Deviation of tBodyAccJerkMag
"tBodyGyroMag-mean"         | Mean of tBodyGyroMag   
"tBodyGyroMag-std"          | Standard Deviation of tBodyGyroMag
"tBodyGyroJerkMag-mean"     | Mean of tBodyGyroJerkMag  
"tBodyGyroJerkMag-std"      | Standard Deviation of tBodyGyroJerkMag
"fBodyAccMag-mean"          | Mean of fBodyAccMag
"fBodyAccMag-std"           | Standard Deviation of fBodyAccMag 
"fBodyBodyAccJerkMag-mean"  | Mean of fBodyBodyAccJerkMag
"fBodyBodyAccJerkMag-std"   | Standard Deviation of fBodyBodyAccJerkMag
"fBodyBodyGyroMag-mean"     | Mean of fBodyBodyGyroMag 
"fBodyBodyGyroMag-std"      | Standard Deviation of fBodyBodyGyroMag 
"fBodyBodyGyroJerkMag-mean" | Mean of fBodyBodyGyroJerkMag 
"fBodyBodyGyroJerkMag-std"  | Standard Deviation of fBodyBodyGyroJerkMag

### File: human_act_average.csv

Contains the averages of the accelerometer readings averaged by subject and activity

Fields                      | Contents
----------------------------|--------------------
"subject"                   | id of subject: values 1-30
"activity"                  | type of activity : LAYING SITTING STANDING WALKING WALKING_DOWNSTAIRS WALKING_UPSTAIRS
"AVGtBodyAccMag"            | Mean of tBodyAccMag for specified subject and activity
"AVGtGravityAccMag"         | Mean of tGravityAccMag
"AVGtBodyAccJerkMag"        | Mean of tBodyAccJerkMag
"AVGtBodyGyroMag"           | Mean of tBodyGyroMag
"AVGtBodyGyroJerkMag"       | Mean of tBodyGyroJerkMag
"AVGfBodyAccMag"            | Mean of fBodyAccMag
"AVGfBodyBodyAccJerkMag"    | Mean of fBodyBodyAccJerkMag
"AVGfBodyBodyGyroMag"       | Mean of fBodyBodyGyroMag
"AVGfBodyBodyGyroJerkMag"   | Mean of fBodyBodyGyroJerkMag

