# Peer-graded Assignment: Getting and Clean Data Course Project

# This R script does the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set.
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average
#    of each variable for each activity and each subject.


# Download the file from coursera website to temporary file
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", temp)

# Read in txt files
train_data <- read.table(unz(temp, 'UCI HAR Dataset/train/X_train.txt'), header = FALSE)
train_label <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
train_subject <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))
test_data <- read.table(unz(temp, 'UCI HAR Dataset/test/X_test.txt'), header = FALSE)
test_label <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
test_subject <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
features <- read.table(unz(temp, "UCI HAR Dataset/features.txt"))
activity_labels <- read.table(unz(temp, "UCI HAR Dataset/activity_labels.txt"))

# Tidy training and test data set
## Add features as column names of train and test data set
names(train_data) <- features$V2
names(test_data) <- features$V2

## Add subject indications and labels as first and second column in train and test data set
train_data <- cbind(train_subject, train_label, train_data)
test_data <- cbind(test_subject, test_label, test_data)

## Change column names into descriptive names
colnames(train_data)[1:2] <- c("subject", "activitylabel")
colnames(test_data)[1:2] <- c("subject", "activitylabel")

# Merge the data sets
total_data <- rbind(train_data, test_data)

# Rename integer labels with character labels in activity_labels file
total_data$activitylabel <- activity_labels$V2[match(total_data$activitylabel, activity_labels$V1)]

# Keep only columns with mean or std in colname
## Select column names that contain std of mean
mean_std_cols <- grep("subject|activitylabel|mean|std", colnames(total_data), value = TRUE)

## Select these columns from total data set
mean_data <- total_data[ ,mean_std_cols]

# Take averages of each variabel for each activity and each subject in seperate data set
averages <-  aggregate(mean_data[,-c(1:2)], by = list(mean_data$subject, mean_data$activitylabel), FUN = mean)

## Use descriptive colnames
colnames(averages)[1:2] <- c("subject", "activitylabel")
