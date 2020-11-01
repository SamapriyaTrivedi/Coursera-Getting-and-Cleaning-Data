# Coursera - Getting and Cleaning Data

## Assignment Problem
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

## Dataset Description
The data is taken from UCI HAR Dataset. Here, six datasets are used, x_train.txt, x_test.txt, y_train.txt, y_test.txt, subject_train.txt and subject_test.txt.
The features.txt contains the correct variable name, which corresponds to each column of x_train.txt and x_test.txt. 
The activity_labels.txt contains the desciptive names for each activity label, which corresponds to each number in the y_train.txt and y_test.txt.

## Project Introduction
The script run_analysis.R uses the data.table package for renaming column and reading in files. It performs 5 major steps including:

1)  Merging the training and the test sets to create one data set.

2)  Extracting only the measurements on the mean and standard deviation for each measurement.

3)  Using descriptive activity names to name the activities in the data set

4)  Appropriately labeling the data set with descriptive activity names.

5)  Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

## Final 'Tidy Data' 
The final tidy data is produced inside the run_analysis.R and this data is stored as text filed 'tidydata.txt'.
