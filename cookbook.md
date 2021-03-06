---
title: "cookbook"
output: html_document
---

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

The R script run_analysis.R performs data clean up for a dataset described as below:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 


The data process includes the following steps:
1. combining both test and train data into a combined dataset.
2. selected measurements only related to mean or standard deviation of the parameters.
3. for each test subject and each activity they performed, an average of the measurements from step 2. were calculated to be represented in the final dataset.
4. the final dataset is written into a file named "Human_activity_tidy_data.txt".


Colnumn names.
1. "subject_ID" 
    represent the ID for the subject being tested, range from 1 to 30.

2. "activity_ID" 
   type of activity performed by the subject, a total of 6 types: WALKING, WALKING_UPSTAIRS,      WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.
   
3-81. "ave_tBodyAcc_mean_X" "ave_tBodyAcc_mean_Y" "ave_tBodyAcc_mean_Z" "ave_tBodyAcc_std_X"         "ave_tBodyAcc_std_Y" "ave_tBodyAcc_std_Z" "ave_tGravityAcc_mean_X" "ave_tGravityAcc_mean_Y" "ave_tGravityAcc_mean_Z" "ave_tGravityAcc_std_X" "ave_tGravityAcc_std_Y" "ave_tGravityAcc_std_Z" "ave_tBodyAccJerk_mean_X" "ave_tBodyAccJerk_mean_Y" "ave_tBodyAccJerk_mean_Z" "ave_tBodyAccJerk_std_X" "ave_tBodyAccJerk_std_Y" "ave_tBodyAccJerk_std_Z" "ave_tBodyGyro_mean_X" "ave_tBodyGyro_mean_Y" "ave_tBodyGyro_mean_Z" "ave_tBodyGyro_std_X" "ave_tBodyGyro_std_Y" "ave_tBodyGyro_std_Z" "ave_tBodyGyroJerk_mean_X" "ave_tBodyGyroJerk_mean_Y" "ave_tBodyGyroJerk_mean_Z" "ave_tBodyGyroJerk_std_X" "ave_tBodyGyroJerk_std_Y" "ave_tBodyGyroJerk_std_Z" "ave_tBodyAccMag_mean" "ave_tBodyAccMag_std" "ave_tGravityAccMag_mean" "ave_tGravityAccMag_std" "ave_tBodyAccJerkMag_mean" "ave_tBodyAccJerkMag_std" "ave_tBodyGyroMag_mean" "ave_tBodyGyroMag_std" "ave_tBodyGyroJerkMag_mean" "ave_tBodyGyroJerkMag_std" "ave_fBodyAcc_mean_X" "ave_fBodyAcc_mean_Y" "ave_fBodyAcc_mean_Z" "ave_fBodyAcc_std_X" "ave_fBodyAcc_std_Y" "ave_fBodyAcc_std_Z" "ave_fBodyAcc_meanFreq_X" "ave_fBodyAcc_meanFreq_Y" "ave_fBodyAcc_meanFreq_Z" "ave_fBodyAccJerk_mean_X" "ave_fBodyAccJerk_mean_Y" "ave_fBodyAccJerk_mean_Z" "ave_fBodyAccJerk_std_X" "ave_fBodyAccJerk_std_Y" "ave_fBodyAccJerk_std_Z" "ave_fBodyAccJerk_meanFreq_X" "ave_fBodyAccJerk_meanFreq_Y" "ave_fBodyAccJerk_meanFreq_Z" "ave_fBodyGyro_mean_X" "ave_fBodyGyro_mean_Y" "ave_fBodyGyro_mean_Z" "ave_fBodyGyro_std_X" "ave_fBodyGyro_std_Y" "ave_fBodyGyro_std_Z" "ave_fBodyGyro_meanFreq_X" "ave_fBodyGyro_meanFreq_Y" "ave_fBodyGyro_meanFreq_Z" "ave_fBodyAccMag_mean" "ave_fBodyAccMag_std" "ave_fBodyAccMag_meanFreq" "ave_fBodyBodyAccJerkMag_mean" "ave_fBodyBodyAccJerkMag_std" "ave_fBodyBodyAccJerkMag_meanFreq" "ave_fBodyBodyGyroMag_mean" "ave_fBodyBodyGyroMag_std" "ave_fBodyBodyGyroMag_meanFreq" "ave_fBodyBodyGyroJerkMag_mean" "ave_fBodyBodyGyroJerkMag_std" "ave_fBodyBodyGyroJerkMag_meanFreq"

numeric with range [-1, 1].
the leading "ave_" represent average calculated from multiple measurements described in data transformation step 3.

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
