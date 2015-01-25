library(dplyr)


#----------- Get some names -----------#

#read the list of names of features
feature_names <- read.table("./UCI HAR Dataset/features.txt")

#read the names of activities
activity_names <- read.table("./UCI HAR Dataset/activity_labels.txt")

#set the proper column names
names(activity_names) <- c("activity_id", "activity_name")

#read the list of subjects from the training set
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

#read the list of subjects from the test set
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")


#----------- Get the training set -----------#

#read the training set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")

#set the features names as column names of the thaining set
names(X_train) <- features_names[,2]

#read the labels of the training set
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

#set the proper column names
names(y_train) <- "label_id"

#add labels to the training set
X_train$activity_id <- y_train$label_id

#add subjects to the training set
X_train$subject_id <- subject_train[,1]

#define each label with proper activity names
X_train <- merge(X_train, activity_names, by.x="activity_id", by.y="activity_id", all=TRUE)


#----------- Get test set -----------#

#read the test set
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")

#set the features names as column names of the test set
names(X_test) <- features_names[,2]

#read the labels of the test set
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

#set the proper column names
names(y_test) <- "label_id"

#add labels to the test set
X_test$activity_id <- y_test$label_id

#add subjects to the test set
X_test$subject_id <- subject_test[,1]

#define each label with proper activity names
X_test <- merge(X_test, activity_names, by.x="activity_id", by.y="activity_id", all=TRUE)


#----------- Merge sets -----------#

data_set <- rbind(X_train, X_test)


#----------- Look for the measurements on mean -----------#

#get indeces of measurements on the mean
mean_idx <- grep("mean\\(\\)", names(data_set))

#get old names of these measurements 
old_names_mean <- names(data_set[, mean_idx])

#replace "-mean()" with "Mean"
new_names_mean <- gsub("-mean\\(\\)", "Mean", old_names_mean)

#replace "-X" with "X", "-Y" with "Y" and "-Z" with "Z"
new_names_mean <- gsub("-", "", new_names_mean)


#----------- Look for the measurements on standard deviation -----------#

#get indeces of measurements on the standard deviation
std_idx <- grep("std\\(\\)", names(data_set))

#get old names of these measurements 
old_names_std <- names(data_set[, std_idx])

#replace "-std()" with "Std"
new_names_std <- gsub("-std\\(\\)", "Std", old_names_std)

#replace "-X" with "X", "-Y" with "Y" and "-Z" with "Z"
new_names_std <- gsub("-", "", new_names_std)


#----------- Cleaning the data -----------#

#replace old names of the proper columns with the new ones
names(data_set)[c(mean_idx, std_idx)] <- c(new_names_mean, new_names_std)

#catch indeces of columns with subject id and activity name
activity_idx <- match("activity_name", names(data_set))
subject_idx <- match("subject_id", names(data_set))

#leave only those columns that were collected with the mean() and std()
data_set <- data_set[, c(subject_idx, mean_idx, std_idx, activity_idx)]


#----------- Getting the tidy data -----------#

#get summarizing over columns
tidy_data <- aggregate(data_set[c(2:(dim(data_set)[2]-1))], by=data_set[c("subject_id","activity_name")], FUN=mean)

#Some modification of names of coulumns
names(tidy_data)[3:dim(tidy_data)[2]] <- paste("Mean of", names(cdata)[3:dim(tidy_data)[2]])

