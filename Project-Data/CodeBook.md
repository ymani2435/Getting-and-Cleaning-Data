Course Project Code Book
========================



Dataset Overview
----
The original data for this process was collected from a smartphone by a variety of subjects while engaging in several activties. All subjects engaged in all activities. Raw data was gathered from the phone's accelerometer and its gyroscope. The values used in this process were derived by a variety of calculations (described below).

Source of the original data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Conceptually, this process summarizes the original data by 
1. Subsetting the data, pulling out only fields which are a mean or a standard deviation 
2. Grouping the data by the subject and activity 
3. Averaging all the data for a given subject/activity pairing.

The final dataset is written to "./tidydata/data_set_with_the_averages.txt" and can be read in with the following R command:

    verify <- read.table("./tidydata/data_set_with_the_averages.txt", sep="\t")
    verfiy

Data Cleaning Description
----
### Cleaning data labels

The input labels used abbreviated forms of descriptive terms. Abbreviations were expanded and duplications and punctuation were removed so that "tBodyAccJerk-std()-X" became "timeBodyAccelerometerJerkStdDevX" and "fBodyBodyGyroMag-mean()" became "frequencyBodyGyroscopeMagnitudeMean".

### Merging data

The data was divided in two different sets. First, it was partioned into train and test subsets. Each of those was then divided into a measurements file, a subject identifier file, and an activity code file. There was also a single activity label file which paired the numeric code to a string label.

For each of train and test data set, the measurements file as read in using the cleaned up columns from above. Then the subject id and activity id were read in and combined (via cbind) with the measurements data. Then the complete train and test sets were merged together with rbind.

### Filtering data

From the fully merged data frame, a subset of columns was extracted where the columns indicated a mean or a standard deviation, along with the subject id and activity id. The activity ids were then replaced with corresponding activity labels.

### Summarizing the data

For each subject/activity pair, all the data points for a given column were averaged together and the result data frame written to file.

Data Column Description
----
The first two columns are for identifying the person and the activity they were engaging in for the data collection.

    Subject - Identifier for the subject providing the data, ranging from 1 to 30.
    Activity - A label for the level activity of a data point. One of "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", or "LAYING".

Each subsequent column is an average of values for a give Subject/AcivityLevel in the range -1 to 1. See below for more detail on the variables and their derivation.

The label for each variable is a combination of these facets:

    time, frequency, or angle
    Body or Gravity
    Accelerometer or Gyroscope
    Jerk (or empty)
    Magnitude (or empty)
    Mean or StdDev(standard deviation)
    Freq (or empty)
    X, Y, or Z axis

Complete list of columns
----
    Subject
    Activity
    timeBodyAccelerometerMeanX
    timeBodyAccelerometerMeanY
    timeBodyAccelerometerMeanZ
    timeGravityAccelerometerMeanX
    timeGravityAccelerometerMeanY
    timeGravityAccelerometerMeanZ
    timeBodyAccelerometerJerkMeanX
    timeBodyAccelerometerJerkMeanY
    timeBodyAccelerometerJerkMeanZ
    timeBodyGyroscopeMeanX
    timeBodyGyroscopeMeanY
    timeBodyGyroscopeMeanZ
    timeBodyGyroscopeJerkMeanX
    timeBodyGyroscopeJerkMeanY
    timeBodyGyroscopeJerkMeanZ
    timeBodyAccelerometerMagnitudeMean
    timeGravityAccelerometerMagnitudeMean
    timeBodyAccelerometerJerkMagnitudeMean
    timeBodyGyroscopeMagnitudeMean
    timeBodyGyroscopeJerkMagnitudeMean
    frequencyBodyAccelerometerMeanX
    frequencyBodyAccelerometerMeanY
    frequencyBodyAccelerometerMeanZ
    frequencyBodyAccelerometerMeanFreqX
    frequencyBodyAccelerometerMeanFreqY
    frequencyBodyAccelerometerMeanFreqZ
    frequencyBodyAccelerometerJerkMeanX
    frequencyBodyAccelerometerJerkMeanY
    frequencyBodyAccelerometerJerkMeanZ
    frequencyBodyAccelerometerJerkMeanFreqX
    frequencyBodyAccelerometerJerkMeanFreqY
    frequencyBodyAccelerometerJerkMeanFreqZ
    frequencyBodyGyroscopeMeanX
    frequencyBodyGyroscopeMeanY
    frequencyBodyGyroscopeMeanZ
    frequencyBodyGyroscopeMeanFreqX
    frequencyBodyGyroscopeMeanFreqY
    frequencyBodyGyroscopeMeanFreqZ
    frequencyBodyAccelerometerMagnitudeMean
    frequencyBodyAccelerometerMagnitudeMeanFreq
    frequencyBodyAccelerometerJerkMagnitudeMean
    frequencyBodyAccelerometerJerkMagnitudeMeanFreq
    frequencyBodyGyroscopeMagnitudeMean
    frequencyBodyGyroscopeMagnitudeMeanFreq
    frequencyBodyGyroscopeJerkMagnitudeMean
    frequencyBodyGyroscopeJerkMagnitudeMeanFreq
    angletBodyAccelerometerMeangravity
    angletBodyAccelerometerJerkMeangravityMean
    angletBodyGyroscopeMeangravityMean
    angletBodyGyroscopeJerkMeangravityMean
    angleXgravityMean
    angleYgravityMean
    angleZgravityMean
    timeBodyAccelerometerStdDevX
    timeBodyAccelerometerStdDevY
    timeBodyAccelerometerStdDevZ
    timeGravityAccelerometerStdDevX
    timeGravityAccelerometerStdDevY
    timeGravityAccelerometerStdDevZ
    timeBodyAccelerometerJerkStdDevX
    timeBodyAccelerometerJerkStdDevY
    timeBodyAccelerometerJerkStdDevZ
    timeBodyGyroscopeStdDevX
    timeBodyGyroscopeStdDevY
    timeBodyGyroscopeStdDevZ
    timeBodyGyroscopeJerkStdDevX
    timeBodyGyroscopeJerkStdDevY
    timeBodyGyroscopeJerkStdDevZ
    timeBodyAccelerometerMagnitudeStdDev
    timeGravityAccelerometerMagnitudeStdDev
    timeBodyAccelerometerJerkMagnitudeStdDev
    timeBodyGyroscopeMagnitudeStdDev
    timeBodyGyroscopeJerkMagnitudeStdDev
    frequencyBodyAccelerometerStdDevX
    frequencyBodyAccelerometerStdDevY
    frequencyBodyAccelerometerStdDevZ
    frequencyBodyAccelerometerJerkStdDevX
    frequencyBodyAccelerometerJerkStdDevY
    frequencyBodyAccelerometerJerkStdDevZ
    frequencyBodyGyroscopeStdDevX
    frequencyBodyGyroscopeStdDevY
    frequencyBodyGyroscopeStdDevZ
    frequencyBodyAccelerometerMagnitudeStdDev
    frequencyBodyAccelerometerJerkMagnitudeStdDev
    frequencyBodyGyroscopeMagnitudeStdDev
    frequencyBodyGyroscopeJerkMagnitudeStdDev


