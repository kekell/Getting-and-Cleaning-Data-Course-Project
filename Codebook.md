---
title: "Codebook"
author: "kekell"
date: "June 21, 2015"
output: html_document
---


###Input Used for this Project

One of the most exciting areas in all of data science right now is wearable computing. 
Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to
attract new users. The data linked to from the course website represent data collected from the accelerometers
from the Samsung Galaxy S smartphone. 

###Source of Data for Project

Data for this project is sourced from the **UCI Machine Learning Repository** 
File Used: *Human Activity Recognition Using Smartphones Data Set* 

####A full description is available at the site where the data was obtained: 

<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

####Here are the data for the project: 

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> 


###Script Creatred for Project

Using the *UCI HAR Dataset* as input described above for this project, an R script has been created titled: *run_analysis.R*


###Project Purpose

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 


###Project Goals

####The goals of this prohect are to prepare **tidy data** that can be used for later analysis. 

This project will be graded by your peers on a series of **"yes/no"** questions related to the project. You will be required to submit the following: 

1. Create a **tidy data set** as described below
2. Provide a **link to a Github repository** with your script for performing the analysis
3. Create a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called **CodeBook.md.** 
4. Include a **README.md** in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  


###Data Variables used in this Project 

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed *six activities* wearing a smartphone (Samsung Galaxy S II) on the waist.

1. WALKING
2. WALKING UPSTAIRS
3. WALKING DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 
3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data
manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was
selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

####For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.


####The dataset includes the following files:

* 'README.txt'
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels. 


####The following files are available for the train and test data. Their descriptions are equivalent. 

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. 

* The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


##Initial Data

The data corresponds to the results of an experiment carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a Samsung Galaxy S II. For each record it is provided:

* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
* Triaxial Angular velocity from the gyroscope.
* A 561-feature vector with time and frequency domain variables.
* Its activity label.
* An identifier of the subject who carried out the experiment.


####The relevant information about the files follows:

* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.


####And for both the train and test data the following files are given:

* 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

* 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. 

* The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

* 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.

* 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


*Additional descriptions regarding the physical meaning of the data can be found in README.txt within the data folder "UCI HAR Dataset".*


##Script Output 

The R script **run_analysis.R** generates the following tidy data set outpu:

* 'tidy_dataset_avg_activity.txt'

This file contains the desired data of averages on *81 variables* for *180 observations.* 

The first two (2) variables contain the *Subject* ID number and the specific *Activity_Performed.* 
The remaining 79 variables correspond to the average of each variable for each subject and each activity performed.
