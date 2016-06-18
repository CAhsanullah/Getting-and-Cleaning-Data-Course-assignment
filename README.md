# Getting and Cleaning Data Assignment
Create one R script called run_analysis.R that does the following:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement.
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately label the data set with descriptive activity names.
 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# Procedure
1.  Load activity labels
2.  Load data column names
3.  Extract only the measurements on the mean and standard deviation for each measurement.
4.  Load and process X_test & y_test data.
5.  Load activity labels
6.  Bind data
7.  Load and process X_train & y_train data.
8.  Load activity labels
9.  Bind data
10. Merge data sets
11. Install.packages("dplyr") if not previously installed
12. Arrange data set by subject and then activity levels
13. Install.packages("reshape2") if not previously installed
14. Idenitfy rows of data
15. Apply mean function to get average of dataset melt_data 
16. Tidy variable names
17. Write tidy data to file




