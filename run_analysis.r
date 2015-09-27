run_analysis3<-function()

##set the working directory
setwd("~/RProgrammingCoursera/Class3/FinalProject/Data/MergedData")

##load key libraries`
##these take a whle to load so I comment them out after the first test run
library(dplyr)
library(tidyr)
library(stringr)

##bring the data in from disk

x_data1<-read.delim("X_test.txt", header=FALSE, sep="")
x_data2<-read.delim("x_train.txt", header=FALSE, sep="")
subject1<-read.delim("subject_test.txt", header=FALSE, sep="")
subject2<-read.delim("subject_train.txt", header=FALSE, sep="")
y_data1<-read.delim("y_test.txt", header=FALSE, sep="")
y_data2<-read.delim("y_train.txt", header=FALSE, sep="")


##We are ultimately going to merge the test and training data; however, this step preserves the origin of the row
##as being either from the test or the training data

x_data1<-mutate(x_data1, observation_type="Test")
x_data2<-mutate(x_data2, observation_type="Train")

##first we merge the x_data, y_data, and subject seperately into a single file; we do the binding in an order that will
##have the master file organized so that the subjectID is first column, activityID is second column and activity measurements
##are the subsequent clumns
phase1_test<-cbind(y_data1,x_data1)
phase2_test<-cbind(subject1,phase1_test)

phase1_train<-cbind(y_data2,x_data2)
phase2_train<-cbind(subject2, phase1_train)

##next merge the train and test data into a single file

merged_master<-rbind(phase2_train,phase2_test)

##next routine creates a string vector out of features.txt, used to name the columns of merged_master
## I'm sure there is a more elegant and efficient way to do this, but this brute force method works
##Load features.txt
features<-read.delim("features2.txt", header=FALSE)

mVector=as.vector(features[1,1])  ##initializes the vector

##builds the vector
for(i in 2:ncol(merged_master)) {
     mVector[i]=as.character(features[i,1])
}

names(merged_master) <-mVector

#now to construct the penultimate data frame, containing subject, activity and all the mean and std measurements; this 
## will be called phase2_master

phase2_part1<-select(merged_master, 1:2)
phase2_part2<-select(merged_master, contains("mean", ignore.case=TRUE))
phase2_part3<-select(merged_master, contains("std", ignore.case=TRUE))
# glue them together into the phase2 file
phase2_master<-cbind(phase2_part1, phase2_part2, phase2_part3)


#put the activity labels into a lookup table

activity_labels<-read.csv("activity_labels.txt", header=TRUE)

#label the activities
phase3_master<-merge(activity_labels, phase2_master, by.x = 'X2activity', by.y = '2Activity')

phase3_master<-group_by(phase3_master, 1SubjectID, X2activity)

