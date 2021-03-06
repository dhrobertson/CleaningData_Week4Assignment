# CleaningData_Week4Assignment

Student: Daniel H. Robertson

Assignment Date: 18-Dec-2016

##Assignment

**Assignment Task** The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

A complete assignment includes:

1. a tidy data set as described below
2. a link to a Github repository with your script for performing the analysis
3. a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md

##Data Source & Description

**Description:** http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

**Source:** https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


##Solution and Submitted Information

File                     | Contents
-------------------------|-----------------------
run_analysis.R           | R script to download files, unzip, merge data, and create the two files
human_act_mean_std.csv   | clean data file merged for individuals and activities. See CodeBook.md for formats
human_act_average.csv    | average of clean data per individual and activity regardless of test or train
CodeBook.md              | description of variables in each of the clean files
README.md                | this file