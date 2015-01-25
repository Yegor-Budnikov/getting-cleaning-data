# Welcome to my repo getting-cleaning-data
This is public repo for the project of the course Getting and Cleaning Data on Coursera

Now I would like to tell you how the things in this repo operate.
## run_analysis.R

This script contains several steps.
### Import
In this script library _dplyr_ is used.

### Getting some names
In this part I read the list of names of features into the variable _feature\_names_, read the names of activities into the variable _activity\_names_ and read the list of subjects from the training and test set into the variables _subject\_train_ and _subject\_test_ respectively.

### Getting the training set
In this part I read the training set into the variable _X\_train_, set the features names as column names of the training set, read the labels of the training set into the variable _y\_train_, add these labels to the training set, add subjects to the training set and define each label with a proper activity name.

### Getting the test set
In this part I read the test set into the variable _X\_test_, set the features names as column names of the test set, read the labels of the test set into the variable _y\_test_, add these labels to the test set, add subjects to the test set and define each label with a proper activity name.

### Merging sets
In this part I merge the training and the test sets into the variable _data\_set_.

### Looking for the measurements on mean
In this part I get indeces of measurements that cantain "mean()" in the name and form the vector _new\_names\_mean_ that contains new names for the mean measurements.

### Looking for the measurements on standard deviation
In this part I get indeces of measurements that cantain "std()" in the name and form the vector _new\_names\_std_ that contains new names for the std measurements.

### Cleaning the data
In this part I replace old names of the proper columns with the new ones, catch indeces of columns with subject id and activity name into the variables _activity\_idx_ and _subject\_idx_ and leave in the variable _data\_set_ leave only those columns that were collected with the _mean()_ and _std()_.

### Getting the tidy data
In this part I get summary over the columns of _data\_set_ with the function _aggregate_, put this tidy data into the variable _tidy\_data_ and modify the column names in the tidy data a bit.

