# Getting and Cleaning Data Assignment
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.


# Load: activity labels
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]

# Load: data column names
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

# Extract only the measurements on the mean and standard deviation for each measurement.
extract_features <- grepl("mean|std", features)

# Load and process X_test & y_test data.
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) = features

X_test <- X_test[,extract_features]

# Load activity labels
y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

# Bind data
test_data <- cbind(as.data.table(subject_test), y_test, X_test)

###################################################################
# Load and process X_train & y_train data.
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

names(X_train) = features

X_train <- X_train[,extract_features]

# Load activity labels
y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

# Bind data
train_data <- cbind(as.data.table(subject_train), y_train, X_train)
##################################################################

#cleanup
rm(subject_test,subject_train,X_test,
   X_train, y_test, y_train)

#merge data sets
merged <- rbind(test_data, train_data)

#cleanup
rm(test_data, train_data)
# install.packages("dplyr") if not previously installed
library(dplyr)
merged <- select(merged, -(2))
#View(merged)

#arrange data set by subject and then activity levels
#merged <- arrange(merged, subject, Activity_Label)

#install.packages("reshape2") if not previously installed
library(reshape2)
#idenitfy rows of data

id_labels = c("subject", "Activity_Label")
data_labels =  setdiff(colnames(merged), id_labels)
melt_data = melt(merged, id= id_labels, measure.vars = data_labels)

#apply mean function to get average of dataset melt_data 
average_data = dcast(melt_data, subject + Activity_Label ~ variable, mean) 
View(average_data)



