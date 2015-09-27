==================================================================
Course Project: Coursera Getting and Cleaning Data 
Robert Bennett
bobbennett150@gmail.com
==================================================================
The purpose of this project is to create a normalized summary data frame from a repository of data created by the Non-Linear Complex Systems Laboratory.
The goal of this data collection was to determine whether normal human actions such as sitting, standing, walking etc. could be ascertained from 
data derived from cellphone accelerometer and gyroscope data.  The experiment included 30 subjects.

 The original data included:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.



The data was originally scraped from
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


This repository creates a function that integrates, summarizes, and tidies the data into a single file with mean measurements for each participant for each activity

The data creation routine called "run_analysis.r"  takes the data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The function assumes that you have the following files in your search path:

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

This data is licensed under the Creative Commons License, 2015 by Robert Bennett.
# GettingCleaningDataCourseProject 
