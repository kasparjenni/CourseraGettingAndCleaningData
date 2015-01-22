---
title: "Coursera - Project for Getting and Cleaning Data Course"
author: "Kaspar Jenni"
date: "Thursday, January 22, 2015"
---

#Raw Data
The raw data was obtained from the Human Activity Recognition Using Smartphones Data Set at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Script
The script run_analysis() in run_analysis.R produces the output tidydata.out by doing the following function sequentially:

1. download_data(): downloading the zip file, and unizipping if and only if the data is not present
2. clean_data(): loads the data in R, merges the table and adds the names and returns the final table
3. tidy_data_set(fulldataset) using the final table of 2), takes only the mean and std values, including the aditional vectors obtained on the angle.. variable as desribed below, as it is better to have a little bit more data than not enough. The function then groups by activity and subject, and does the average by these groups. It returns a tidy data set.
4. the tidy data set is written to a file names tidydata.out localted in the data folder. Note that this was changed for Coursera into tinydata.txt with names=FALSE. Comment this line to enable the original file.

#Variables in tidydata.out
For the sake of an education coursera class, the data was averaged by activity and subject from the means and standard deviations.  This makes limited sense...

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. The body acceleration signal is obtained by subtracting the gravity from the total acceleration. The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk.XYZ, fBodyGyro.XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'.XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

- tBodyAcc.XYZ
- tGravityAcc.XYZ
- tBodyAccJerk.XYZ
- tBodyGyro.XYZ
- tBodyGyroJerk.XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc.XYZ
- fBodyAccJerk.XYZ
- fBodyGyro.XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

- mean..: Mean value
- std..: Standard deviation
- angle..: Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle.. variable:

- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

-subject: subject who performed the activity for each window sample. Its range is from 1 to 30.
-activity: WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING


Note that the difference between the original raw data names and these are that all parenthesis and hyphens are replaces by dots. Hence .XYZ, .mean.., .std.., and .meanFreq..

License:
This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the author for its use or misuse. Any commercial use is prohibited.