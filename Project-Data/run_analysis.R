# Source of data for this project: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# This R script does the following:


# Create output data directory if not present
if (!file.exists("./tidydata")){dir.create("./tidydata")}

# 1. Merges the training and the test sets to create one data set.

trainFile <- read.table("train/X_train.txt")
testFile <- read.table("test/X_test.txt")
mergedFile <- rbind(trainFile, testFile)

trainSubFile<- read.table("train/subject_train.txt")
testSubFile <- read.table("test/subject_test.txt")
mergedSubFile <- rbind(trainSubFile, tmp2)

trainActFile <- read.table("train/y_train.txt")
testActFile  <- read.table("test/y_test.txt")
mergedActFile  <- rbind(trainActFile , testActFile )

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

## Read in the 'features.txt' 
## This file matches up to the columns in the data.table
## with the features/measures.
features <- read.table("features.txt")
indices_of_good_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
mergedFile <- mergedFile[, indices_of_good_features]
names(mergedFile) <- features[indices_of_good_features, 2]
# gsub perform replacement of the first and all matches respectively.
names(mergedFile) <- gsub("\\(|\\)", "", names(mergedFile))
# Translate characters in character vectors, in particular from upper to lower case
names(mergedFile) <- tolower(names(mergedFile))

# 3. Uses descriptive activity names to name the activities in the data set.

# Read in activity labels
activities <- read.table("activity_labels.txt")
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
mergedActFile[,1] = activities[mergedActFile[,1], 2]
names(mergedActFile) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(mergedSubFile) <- "subject"

# Combine all test sources into one variable
cleaned <- cbind(mergedSubFile, mergedActFile, mergedFile)

# Write out interim version for verfication
write.table(cleaned, "./tidydata/merged_clean_data.txt", row.names=FALSE, sep = "\t")

# 5. Creates a 2nd, independent tidy data set with the average of each variable for each activity and each subject.

# Reshape the data to get the averages 

uniqueSubjects = unique(mergedSubFile)[,1]
numSubjects = length(unique(mergedSubFile)[,1])
numActivities = length(activities[,1])
numCols = dim(cleaned)[2]
tidydata = cleaned[1:(numSubjects*numActivities), ]

row = 1
for (s in 1:numSubjects) {
  for (a in 1:numActivities) {
    tidydata[row, 1] = uniqueSubjects[s]
    tidydata[row, 2] = activities[a, 2]
    tmp <- cleaned[cleaned$subject==s & cleaned$activity==activities[a, 2], ]
    tidydata[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
    row = row+1
  }
}

# Write the final tidy dataset into tidydata folder

write.table(tidydata, file="./tidydata/data_set_with_the_averages.txt", row.names=FALSE, sep = "\t")

