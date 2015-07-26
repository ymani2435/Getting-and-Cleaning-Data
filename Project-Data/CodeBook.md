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

#Output Variables

The following table shows a table with all variables in the output file. The first column in the table shows the column number of the variable, the second column shows the variable name and column three shows the source variable used to compute the value of the variable.

| No     |                         Variable                        |        source variable        |
| ------ | :------------------------------------------------------ | :---------------------------- |
|      1 | subjectid                                               | subject id from subjects file |
|      2 | activityname                                            | activity id from labels file  |
|      3 | timeBodyAccelerationMeanX                               | tBodyAcc-mean()-X             |
|      4 | timeBodyAccelerationMeanY                               | tBodyAcc-mean()-Y             |
|      5 | timeBodyAccelerationMeanZ                               | tBodyAcc-mean()-Z             |
|      6 | timeBodyAccelerationStandarddeviationX                  | tBodyAcc-std()-X              |
|      7 | timeBodyAccelerationStandarddeviationY                  | tBodyAcc-std()-Y              |
|      8 | timeBodyAccelerationStandarddeviationZ                  | tBodyAcc-std()-Z              |
|      9 | timeGravityAccelerationMeanX                            | tGravityAcc-mean()-X          |
|     10 | timeGravityAccelerationMeanY                            | tGravityAcc-mean()-Y          |
|     11 | timeGravityAccelerationMeanZ                            | tGravityAcc-mean()-Z          |
|     12 | timeGravityAccelerationStandarddeviationX               | tGravityAcc-std()-X           |
|     13 | timeGravityAccelerationStandarddeviationY               | tGravityAcc-std()-Y           |
|     14 | timeGravityAccelerationStandarddeviationZ               | tGravityAcc-std()-Z           |
|     15 | timeBodyAccelerationJerkMeanX                           | tBodyAccJerk-mean()-X         |
|     16 | timeBodyAccelerationJerkMeanY                           | tBodyAccJerk-mean()-Y         |
|     17 | timeBodyAccelerationJerkMeanZ                           | tBodyAccJerk-mean()-Z         |
|     18 | timeBodyAccelerationJerkStandarddeviationX              | tBodyAccJerk-std()-X          |
|     19 | timeBodyAccelerationJerkStandarddeviationY              | tBodyAccJerk-std()-Y          |
|     20 | timeBodyAccelerationJerkStandarddeviationZ              | tBodyAccJerk-std()-Z          |
|     21 | timeBodyGyroscopeMeanX                                  | tBodyGyro-mean()-X            |
|     22 | timeBodyGyroscopeMeanY                                  | tBodyGyro-mean()-Y            |
|     23 | timeBodyGyroscopeMeanZ                                  | tBodyGyro-mean()-Z            |
|     24 | timeBodyGyroscopeStandarddeviationX                     | tBodyGyro-std()-X             |
|     25 | timeBodyGyroscopeStandarddeviationY                     | tBodyGyro-std()-Y             |
|     26 | timeBodyGyroscopeStandarddeviationZ                     | tBodyGyro-std()-Z             |
|     27 | timeBodyGyroscopeJerkMeanX                              | tBodyGyroJerk-mean()-X        |
|     28 | timeBodyGyroscopeJerkMeanY                              | tBodyGyroJerk-mean()-Y        |
|     29 | timeBodyGyroscopeJerkMeanZ                              | tBodyGyroJerk-mean()-Z        |
|     30 | timeBodyGyroscopeJerkStandarddeviationX                 | tBodyGyroJerk-std()-X         |
|     31 | timeBodyGyroscopeJerkStandarddeviationY                 | tBodyGyroJerk-std()-Y         |
|     32 | timeBodyGyroscopeJerkStandarddeviationZ                 | tBodyGyroJerk-std()-Z         |
|     33 | timeBodyAccelerationMagnitudeMean                       | tBodyAccMag-mean()            |
|     34 | timeBodyAccelerationMagnitudeStandarddeviation          | tBodyAccMag-std()             |
|     35 | timeGravityAccelerationMagnitudeMean                    | tGravityAccMag-mean()         |
|     36 | timeGravityAccelerationMagnitudeStandarddeviation       | tGravityAccMag-std()          |
|     37 | timeBodyAccelerationJerkMagnitudeMean                   | tBodyAccJerkMag-mean()        |
|     38 | timeBodyAccelerationJerkMagnitudeStandarddeviation      | tBodyAccJerkMag-std()         |
|     39 | timeBodyGyroscopeMagnitudeMean                          | tBodyGyroMag-mean()           |
|     40 | timeBodyGyroscopeMagnitudeStandarddeviation             | tBodyGyroMag-std()            |
|     41 | timeBodyGyroscopeJerkMagnitudeMean                      | tBodyGyroJerkMag-mean()       |
|     42 | timeBodyGyroscopeJerkMagnitudeStandarddeviation         | tBodyGyroJerkMag-std()        |
|     43 | frequencyBodyAccelerationMeanX                          | fBodyAcc-mean()-X             |
|     44 | frequencyBodyAccelerationMeanY                          | fBodyAcc-mean()-Y             |
|     45 | frequencyBodyAccelerationMeanZ                          | fBodyAcc-mean()-Z             |
|     46 | frequencyBodyAccelerationStandarddeviationX             | fBodyAcc-std()-X              |
|     47 | frequencyBodyAccelerationStandarddeviationY             | fBodyAcc-std()-Y              |
|     48 | frequencyBodyAccelerationStandarddeviationZ             | fBodyAcc-std()-Z              |
|     49 | frequencyBodyAccelerationJerkMeanX                      | fBodyAccJerk-mean()-X         |
|     50 | frequencyBodyAccelerationJerkMeanY                      | fBodyAccJerk-mean()-Y         |
|     51 | frequencyBodyAccelerationJerkMeanZ                      | fBodyAccJerk-mean()-Z         |
|     52 | frequencyBodyAccelerationJerkStandarddeviationX         | fBodyAccJerk-std()-X          |
|     53 | frequencyBodyAccelerationJerkStandarddeviationY         | fBodyAccJerk-std()-Y          |
|     54 | frequencyBodyAccelerationJerkStandarddeviationZ         | fBodyAccJerk-std()-Z          |
|     55 | frequencyBodyGyroscopeMeanX                             | fBodyGyro-mean()-X            |
|     56 | frequencyBodyGyroscopeMeanY                             | fBodyGyro-mean()-Y            |
|     57 | frequencyBodyGyroscopeMeanZ                             | fBodyGyro-mean()-Z            |
|     58 | frequencyBodyGyroscopeStandarddeviationX                | fBodyGyro-std()-X             |
|     59 | frequencyBodyGyroscopeStandarddeviationY                | fBodyGyro-std()-Y             |
|     60 | frequencyBodyGyroscopeStandarddeviationZ                | fBodyGyro-std()-Z             |
|     61 | frequencyBodyAccelerationMagnitudeMean                  | fBodyAccMag-mean()            |
|     62 | frequencyBodyAccelerationMagnitudeStandarddeviation     | fBodyAccMag-std()             |
|     63 | frequencyBodyAccelerationJerkMagnitudeMean              | fBodyBodyAccJerkMag-mean()    |
|     64 | frequencyBodyAccelerationJerkMagnitudeStandarddeviation | fBodyBodyAccJerkMag-std()     |
|     65 | frequencyBodyGyroscopeMagnitudeMean                     | fBodyBodyGyroMag-mean()       |
|     66 | frequencyBodyGyroscopeMagnitudeStandarddeviation        | fBodyBodyGyroMag-std()        |
|     67 | frequencyBodyGyroscopeJerkMagnitudeMean                 | fBodyBodyGyroJerkMag-mean()   |
|     68 | frequencyBodyGyroscopeJerkMagnitudeStandarddeviation    | fBodyBodyGyroJerkMag-std()    |

The source variables consist of the following parts:
The first letter defines the domain: t for time or f for frequency
The next part defines the source variable: BodyAcc (BodyAcceleration), GravityAcc (GravityAcceleration) or BodyGyro (BodyGyroscope)
The next (optional) part describes the method that was used to derive the variable: Mag (Magnitued), Jerk or JerkMag (JerkMagnitude)
The part after the dash describes the function that was used to compute the feature mean (Mean) or std (Standarddeviation)
In case of three axial measurements, the last part of the variable defines the axis (X, Y or Z)

#Output Variable Units

* subject: identifier of an observed volunteer within an age bracket of 19-48 years.
    * Data type: Numeric
    * Value range: 1 - 30
* activity: Label string of the observed activity a person was performing
    * Data type: factor
    * Labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
* Rows 3 - 68: Means of selected features per subject and activity
    * Data type: The feature means have the same units as their input data. Due to the normalization they do not have units attached
    * Value range: [-1, 1]

#Tidy Data

The tidy data set contains :

* Subject : Identifier of the subject who carried out the experiment. Its range is from 1 to 30. 
* Activity : Activity label: Walking, Walking Upstairs, Walking Downstairs, Sitting, Standing, Laying
* Mean of all other variables are measurement collected from the accelerometer and gyroscope 3-axial raw signal (numeric value)

The data set is written to the file 'tidydata.txt'.
The tidy data set a set of variables for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 69 columns – 33 Mean variables + 33 Standard deviation variables + 1 Subject( 1 of of the 30 test subjects) + ActivityName + ActivityNum . The tidy data set’s first row is the header containing the names for each column.



