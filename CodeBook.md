run_analysis.R is a script to performs the next 5 diferent steps:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) From the data set in step 4, creates a second, 
independent tidy data set with the average of each variable for each activity and each subject.

To achieve the objectives in each step we assign the next Variables

Containing the data from the main file https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip :

subject_trainset
subject_testset
x_trainset 
y_trainset
x_testset
y_testset

and after of that:

x_dataset
y_dataset
subject_dataset

the x_dataset dataset was used to extract the data and wasin mean_and_sd_features.
The last step was applied where was necessary.

Big dataset:

y_dataset
x_dataset
subject_dataset 

averages_dataset contains the relevant averages asked in the 5 step using ddply() from the plyr package and stored in .txt

to sum up:
To merge data was used rbind() function.
result of that, we address those files to have the same number of columns and entities.
After, it  was used to get some columns with the mean and standard deviation measures following the second step. 
Consequently, these columns they are given the correct names, taken from featureees.txt.
