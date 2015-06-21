# Getting and Cleaning Data - Course Project
# Kevin Kelly
# 21 June 2015

# Set Working Directory to Location where UCI HAR Dataset is stored locally.
setwd("C:/Users/Kevin/Desktop/Coursera Working Dir/UCI HAR Dataset");

# Load UCI HAR Datasets
features        <- read.table('./features.txt', sep = "", colClasses = c("character"))
activity_labels <- read.table('./activity_labels.txt', sep = "", col.names = c("ActivityId", "Activity_Performed"))
x_train         <- read.table('./train/X_train.txt', sep = "")
y_train         <- read.table('./train/y_train.txt', sep = "")
subject_train   <- read.table('./train/subject_train.txt', sep = "")
x_test          <- read.table('./test/X_test.txt', sep = "")
y_test          <- read.table('./test/y_test.txt', sep = "")
subject_test    <- read.table('./test/subject_test.txt', sep = "")

# 1. Merges the training and the test sets to create one data set.

# Combining Traning and Test Data
training_data      <- cbind(cbind(x_train, subject_train), y_train)
test_data          <- cbind(cbind(x_test, subject_test), y_test)
training_test_data <- rbind(training_data, test_data)

# Label columns
label_columns <- rbind(rbind(features, c(562, "Subject")), c(563, "ActivityId"))[,2]
names(training_test_data) <- label_columns

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

training_test_data_meanSD <- training_test_data[,grepl("mean|std|Subject|ActivityId", names(training_test_data))]

# 3. Uses descriptive activity names to name the activities in the data set

training_test_data_meanSD <- join(training_test_data_meanSD, activity_labels, by = "ActivityId", match = "first")
training_test_data_meanSD <- training_test_data_meanSD[,-1]

# 4. Appropriately labels the data set with descriptive names.

# Column Names & Formatting Modified for Clarity
names(training_test_data_meanSD) <- gsub('^t',"Time.",names(training_test_data_meanSD))
names(training_test_data_meanSD) <- gsub('^f',"Freq.",names(training_test_data_meanSD))
names(training_test_data_meanSD) <- gsub("\\()","",names(training_test_data_meanSD))
names(training_test_data_meanSD) <- gsub('Freq\\.',"Freq.",names(training_test_data_meanSD))
names(training_test_data_meanSD) <- gsub('\\-mean',".Mean",names(training_test_data_meanSD))
names(training_test_data_meanSD) <- gsub('\\-std',".StdDev",names(training_test_data_meanSD))
names(training_test_data_meanSD) <- gsub('GyroJerk',".Angular.Vel",names(training_test_data_meanSD))
names(training_test_data_meanSD) <- gsub('AccJerk',".Linear.Acc",names(training_test_data_meanSD))
names(training_test_data_meanSD) <- gsub('Mag',".Magtd",names(training_test_data_meanSD))

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_dataset_avg_activity = ddply(training_test_data_meanSD, c("Subject","Activity_Performed"), numcolwise(mean))
write.table(tidy_dataset_avg_activity, file = "tidy_dataset_avg_activity")
