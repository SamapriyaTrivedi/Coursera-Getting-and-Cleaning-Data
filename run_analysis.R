############ Step 1 ############ 
###### Merging the training and the test sets to create one data set.

# Trainings tables:
x_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

# Testing tables:
x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# Feature vector:
features <- read.table('./data/UCI HAR Dataset/features.txt')

# Activity labels:
activityLabels = read.table('./data/UCI HAR Dataset/activity_labels.txt')

colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"
colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"
colnames(activityLabels) <- c('activityId','activityType')

# Merging all data in one set
mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)


############ Step 2 ############ 
###### Extracting only the measurements on the mean and standard deviation for each measurement.

# Vectors for ID, Mean and Standard Deviation
colNames <- colnames(setAllInOne)

mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | 
                  grepl("mean.." , colNames) | grepl("std.." , colNames))

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]


############ Step 3 ############ 
###### Using descriptive activity names to name the activities in the data set

setWithActivityNames <- merge(setForMeanAndStd, activityLabels,
                              by='activityId', all.x=TRUE)

############ Step 4 ############
###### Appropriately labeling the data set with descriptive activity names.

features <- read.table('./data/UCI HAR Dataset/features.txt')

mean_and_std <- (grepl("activityId" , colNames) | grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | grepl("std.." , colNames))

setForMeanAndStd <- setAllInOne[ , mean_and_std == TRUE]


############ Step 5 ############ 
###### Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

TidySet <- aggregate(. ~subjectId + activityId, setWithActivityNames, mean)
TidySet <- TidySet[order(TidySet$subjectId, TidySet$activityId),]

# Writing this tidy data set in txt file
write.table(TidySet, "tidydata.txt", row.name=FALSE)