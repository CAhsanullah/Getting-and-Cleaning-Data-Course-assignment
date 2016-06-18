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


#install.packages("dplyr") if not previously installed
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

# tidy variable names
average_data.names <- names(average_data)
average_data.names <- gsub('-mean', 'Mean', average_data.names)
average_date.names <- gsub('-std', 'Std', average_data.names)
average_data.names <- gsub('[()-]', '', average_data.names)
average_data.names <- gsub('BodyBody', 'Body', average_data.names)
setnames(average_data, average_data.names)
View(average_data)

#write data to file
write.csv(average_data, file = 'Cleaned data.csv')
write.table(average_data, file = 'Cleaned data.txt', row.names = FALSE)

#other approach - did not work -setup blank datatable
#new <- data.frame(matrix(NA,nrow = 1, ncol = ncol(merged) ))
#names(new) = c("subject", "Activity_Label",features[extract_features])

#nested loop calcs
#for ( sub in 1:30)
#{
#  for (index in 1:6)
 # {
  #  #grab only data of interest for this pass
   # df <- filter(merged,subject == sub & Activity_Label == activity_labels[index])
    #
    #do appropriate maths for each col
  #  for(feature in 3:ncol(merged))
   # {
    #  df[1,feature] <- mean((df[, feature]))
    #}
    #
    #append row to new table
  #  new <- rbind(new, df[1,])
  #}
#}
#
#new <- new[2:(nrow(new))]
#View(new)
