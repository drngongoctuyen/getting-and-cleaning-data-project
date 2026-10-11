## run_analysis.R
## Getting and Cleaning Data - Course Project
##
## Creates a tidy data set from the "Human Activity Recognition Using
## Smartphones" (UCI HAR) data. The script:
##   1. Merges the training and the test sets into one data set.
##   2. Extracts only the mean and standard deviation measurements.
##   3. Uses descriptive activity names for the activities.
##   4. Labels the data set with descriptive variable names.
##   5. Creates a second, independent tidy data set with the average of
##      each variable for each activity and each subject.

## Download and unzip the data if it is not already in the working directory
data_dir <- "UCI HAR Dataset"
if (!file.exists(data_dir)) {
        zip_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(zip_url, "dataset.zip", mode = "wb")
        unzip("dataset.zip")
}

## Read the feature names and the activity labels
features <- read.table(file.path(data_dir, "features.txt"),
                       col.names = c("index", "feature"),
                       stringsAsFactors = FALSE)
activities <- read.table(file.path(data_dir, "activity_labels.txt"),
                         col.names = c("code", "activity"),
                         stringsAsFactors = FALSE)

## Helper: read one set ("train" or "test") as subject + activity code + 561 features
read_set <- function(set) {
        subject <- read.table(file.path(data_dir, set, paste0("subject_", set, ".txt")),
                              col.names = "subject")
        code <- read.table(file.path(data_dir, set, paste0("y_", set, ".txt")),
                           col.names = "code")
        x <- read.table(file.path(data_dir, set, paste0("X_", set, ".txt")))
        cbind(subject, code, x)
}

## Step 1: merge the training and the test sets
merged <- rbind(read_set("train"), read_set("test"))

## Step 2: keep only the mean() and std() measurements
keep <- grep("mean\\(\\)|std\\(\\)", features$feature)
data <- merged[, c(1, 2, keep + 2)]

## Step 4 (names): build descriptive variable names from the feature names
var_names <- features$feature[keep]
var_names <- gsub("\\(\\)", "", var_names)
var_names <- gsub("^t", "Time", var_names)
var_names <- gsub("^f", "Frequency", var_names)
var_names <- gsub("BodyBody", "Body", var_names)
var_names <- gsub("Acc", "Accelerometer", var_names)
var_names <- gsub("Gyro", "Gyroscope", var_names)
var_names <- gsub("Mag", "Magnitude", var_names)
var_names <- gsub("-mean", "Mean", var_names)
var_names <- gsub("-std", "Std", var_names)
var_names <- gsub("-", "", var_names)
names(data) <- c("subject", "code", var_names)

## Step 3: replace the activity codes with descriptive activity names
data$activity <- factor(data$code,
                        levels = activities$code,
                        labels = activities$activity)
data <- data[, c("subject", "activity", var_names)]

## Step 5: average of each variable for each activity and each subject
tidy <- aggregate(data[, var_names],
                  by = list(subject = data$subject, activity = data$activity),
                  FUN = mean)
tidy <- tidy[order(tidy$subject, tidy$activity), ]

## Write the tidy data set
write.table(tidy, "tidy_data.txt", row.names = FALSE)
