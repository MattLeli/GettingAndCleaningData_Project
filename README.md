# Getting and Cleaning Data

This repository was created to demonstrate my ability to collect, work with and clean a data set.



## Project Summary


This project uses a data from a study titled: Human Activity Recognition Using Smartphones.
The data can be found at ( http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )



The `run_analysis.R` script can be run on the data (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and it 
will complete the following steps:

 
1. Merges the training and the test sets to create one data set.
 
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 
3. Uses descriptive activity names to name the activities in the data set
 
4. Appropriately labels the data set with descriptive variable names. 
 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.



## This repository contains 3 main files:

  
`run_analysis.R` - This script is used to manipulate the data and perform the required analysis on the sample data.
 
`tidy_data.txt` - This is the final output from the `run_analysis.R` script.  It contains an organized, condensed analysis of the sample data. 
`CodeBook.md` - Contains the definitions of each of the columns in the `tidy_dat.txt` file produced by the R script.



## Please Note

 - You must have the `reshape2` package installed to run the `run_analysis.R` script.
  