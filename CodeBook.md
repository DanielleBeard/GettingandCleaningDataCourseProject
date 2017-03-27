---
title: "CodeBook.md"
author: "DanielleBeard"
date: "March 27, 2017"
output:
  html_document: default
  pdf_document: default
---

## Project Details 

run_analysis.R executes the instructions given by the project description.  

The five steps given are: 

1. Merges the training and the test sets to create one data set.(Used rbind() to address)

2. Extracts only the measurements on the mean and standard deviation for each measurement. (Correct names are assigned by using those given in features.txt)

3. Uses descriptive activity names to name the activities in the data set (Activity data is given values 1 through 6 with the names and IDs are matched from those given in activity_labels.txt)

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.(New output dataset with name averages_data.txt is created with 180 rows)

## Variables 

* X_train, Y_train, X_test, Y_test, subject_train and subject_test include the data given from the dataset

* X_data, Y_Data and subject_data merge the previously listed datasets

* features.txt included the correct names for X_data

    - X_data with the correct names are applied to the columns of mean_and_std_features

* previous process was also applied to activity_labels.txt 

* all_data merged X_data, Y_data and subject_data

* average_data contains the averages that are stored in average_data.txt. (ddply() is used to apply colMeans())
