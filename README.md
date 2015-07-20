# Getting-and-Cleaning-Data
Repository for Cousera: https://class.coursera.org/getdata-030

run_analysis.R code should execute the following:
   
   1)  Merges the training and the test sets to create one data set.
 
   2)  Extracts only the measurements on the mean and standard deviation for each measurement. 
 
   3)  Uses descriptive activity names to name the activities in the data set
 
   4)  Appropriately labels the data set with descriptive variable names. 
   
   5)  From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

 Addtional instruction
 
 Please upload the tidy data set created in step 5 of the instructions. 

 Please upload your data set as a txt file created with write.table() using row.name=FALSE 
 (do not cut and paste a dataset directly into the text box, as this may cause errors saving your submission).

Repository structure
====================
Directory /project_data, contains all files needed for evaluation by run_analysis.R

* README.md, a file to explain the project scope

* Codebook.md, contains the description of variables produced by run_analysis.R

* run_analysis.R, is the R script that produces the tidyData.txt file 

* tidyData.txt is the file generated by run_analysis.R, which contains the output the script

* data set processed from /project_data

Running the run_analysis.R script
===============================

1) create a directory on your local machine where you would like to clone the repository

2) change directory into what you created in step 1

3) clone this repository : git clone https://github.com/ymani2435/Getting-and-Cleaning-Data

4) change directory into the Getting-and-Cleaning-Data directory

5) start R from the command line

6) source("run_analysis.R") 

run_analysis.R script assessment
====================================
Review the run_analysis.R script in the root of the cloned repository.

This run_analysis.R script is commented with explainations of the step and expected output.
