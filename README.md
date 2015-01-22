#README.md
##by Kaspar Jenni
##date: 01/22/2015

### Introduction

This is an assignment for the coursera class Getting and Cleaning Data

Task:
1. You should create one R script called run_analysis.R that does the following. 
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Uses descriptive activity names to name the activities in the data set
5. Appropriately labels the data set with descriptive variable names. 
6. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Script

tidydata.out is a tidy data set following the rules described above.
readin R with:
>read.table("tidydata.out")
CodeBook.md explains how the script works and describes the variables in tidydata.out
run_analysis.R contains the script

to launch it in R:
> source("run_analysis.R")
> run_analysis()

### Grading

This assignment will be graded via peer assessment.
