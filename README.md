# Getting and cleaning data: Course Project
This file contains a description of the data that is collected for the assignment and the added files to this repository. 

## Assignment
The assignment included the following steps:
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Data
The data is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## run_analysis.R
This is the R script I created that is called to perform the cleaning and tidying of the dataset as described in the assignment. By running the code you will download and unzip the files, merge the train and test data sets to a tidy data set and take averages for each variabel by activity and subject.

## Codebook.md
This codebook contains information on the variables in run_analysis.R and the transformations I did to create the variables. 

