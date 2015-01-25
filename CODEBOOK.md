#CODEBOOK

Here are some variables that I used in my script _run\_analysis.R_

_feature\_names_ contains names of features
_activity\_names_ contains descriptive the names of activities
_subject\_train_ contains the list of subjects from the training set
_subject\_test_ contains the list of subjects from the test set

_X\_train_ contains the observations from the training set
_y\_train_ contains the labels of the training set

_X\_test_ contains the observations from the test set
_y\_test_ contains the labels of the test set

_data\_set_ contains merged data set

_mean\_idx_ contains indexes of columns in untidy data set with measurements on the mean
_old\_names\_mean_ contains the initial descriptive names of the measurements on the mean
_new\_names\_mean_ contains corrected descriptive names of the measurements on the mean

_std\_idx_ contains indexes of columns in untidy data set with measurements on the standard deviation
_old\_names\_std_ contains the initial descriptive names of the measurements on the standard deviation
_new\_names\_std_ contains corrected descriptive names of the measurements on the standard deviation

_activity\_idx_ contains the index of the column in untidy data set with the activity name
_subject\_idx_ contains the index of the column in untidy data set with the subject id

_tidy\_data_ contains tidy data with the average of each variable for each activity and each subject

