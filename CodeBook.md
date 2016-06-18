# Data:
Description of variables, data and transformations used to clean up the data in assigned course project for the Johns Hopkins Getting and Cleaning Data Course.
Source Data:
A full description of the data used in this project can be found at:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data for this project can be found at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Data Set Information (From Human Activity Recognition Using Smartphones Data Set)

Experiments have been carried out with a group of 30 test subjects (volunteers). Each person performed six activities: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING, while wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, data was captured on 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.”

#Attribute Information:
For each record in the dataset it is provided:
  -	Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
  -	Triaxial Angular velocity from the gyroscope.
  -	A 561-feature vector with time and frequency domain variables.
  -	Its activity label.
  -	An identifier of the subject who carried out the experiment.

# Files Used:
  - features.txt
  -	activity_labels.txt
  -	subject_train.txt
  -	x_train.txt
  -	y_train.txt
  -	subject_test.txt
  -	x_test.txt
  -	y_test.txt

# Changes made 
Parts of variable names were renames to make more readable:
  The following text replacements were made:
    - Replaced '-mean' with 'Mean' 
    - Replaced '-std' with 'Std' 
    - Removed '-()'
    - Replaced 'BodyBody' with 'Body'

#Examples: 
  - Original: tBodyAcc-mean()-X
  - New: tBodyAccMeanX
  - Original: tBodyAcc-std()-Z
  - New: tBodyAccStdZ
