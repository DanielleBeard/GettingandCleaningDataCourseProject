# Course 3 course project

##Download and open package necessary
install.packages("reshape2")
library(reshape2)
library(plyr)

filename <- "HumanActivityRecognition_dataset.zip"

## Download and unzip the dataset
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
  download.file(fileURL, filename, mode = "wb")
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

## Merges the training and the test sets to create one data set.
setwd("C:/Users/579447/Desktop/Coursera/UCI HAR Dataset")
X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/y_train.txt")
subject_train <- read.table("train/subject_train.txt")

X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/y_test.txt")
subject_test <- read.table("test/subject_test.txt")

# X data set 
X_data <- rbind(X_train, X_test)

# Y data set
Y_data <- rbind(Y_train, Y_test)

# subject data set
subject_data <- rbind(subject_train, subject_test)



## Extracts only the measurements on the mean and standard deviation for each measurement.
features <- read.table("features.txt")

# get only columns with mean() or std() in their names
mean_std_features <- grep("-(mean|std)\\(\\)", features[, 2])

# subset the desired columns
X_data <- X_data[, mean_std_features]

# correct the column names
names(X_data) <- features[mean_std_features, 2]



##Uses descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")

# update values with correct activity names
Y_data[, 1] <- activities[Y_data[, 1], 2]

# correct column name
names(Y_data) <- "activity"



## Appropriately labels the data set with descriptive variable names.

# correct column name
names(subject_data) <- "subject"

# bind all the data in a single data set
all_data <- cbind(X_data, Y_data, subject_data)



## From the data set in step 4, creates a second, independent tidy data set with the average of each 
##variable for each activity and each subject.

average_data <- ddply(all_data, .(subject, activity), function(x) colMeans(x[, 1:66]))

write.table(average_data, "average_data.txt", row.name=FALSE)





