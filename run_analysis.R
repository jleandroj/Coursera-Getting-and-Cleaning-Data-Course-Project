library(plyr)

#1)Merges the training and the test sets to create one data set.
x_trainset <- read.table("train/X_train.txt")
y_trainset <- read.table("train/y_train.txt")
# 1.a subject train data set
subject_trainset <- read.table("train/subject_train.txt")
x_testset <- read.table("test/X_test.txt")
y_testset <- read.table("test/y_test.txt")
# 1.b subject test data set
subject_testset <- read.table("test/subject_test.txt")
# 1.c 'x' data set
x_dataset <- rbind(x_trainset, x_testset)
# 1.e 'y' data set
y_dataset <- rbind(y_trainset, y_testset)
# 1.f 'subject' data set
subject_dataset <- rbind(subject_trainset, subject_testset)

# 2) Extract only the measurements on the mean and standard deviation for each measurement
features <- read.table("features.txt")
# 2.a) columns with mean() or std() in their names
mean_and_sd_features <- grep("-(mean|std)\\(\\)", features[, 2])
# 2.b) subset the desired columns
x_dataset <- x_dataset[, mean_and_sd_features]
# 2.c) correct the column names
names(x_dataset) <- features[mean_and_sd_features, 2]

# 3) Use descriptive activity names to name the activities in the data set
activities <- read.table("activity_labels.txt")
# 3.a)update values with correct activity names
y_dataset[, 1] <- activities[y_dataset[, 1], 2]
# 3.b) correct column name
names(y_dataset) <- "activity"

# 4) Appropriately label the data set with descriptive variable names
# 4.a)correct column name
names(subject_dataset) <- "subject"
# 4.b) bind all the data in a single data set
all_dataset <- cbind(x_dataset, y_dataset, subject_dataset)

# 5)Create a second, independent tidy data set with the average of each variable
# for each activity and each subject

# 65 <- 68 columns but last two (activity & subject)
averages_dataset <- ddply(all_dataset, .(subject, activity), function(x) colMeans(x[, 1:65]))
write.table(averages_dataset, "averages_data.txt", row.name=FALSE)
