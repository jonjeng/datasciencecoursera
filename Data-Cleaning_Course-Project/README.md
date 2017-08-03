# Data Cleaning Course Project
___

This repo contains a script, `run_analysis.R`, for modifying data collected using Samsung Galaxy S smartphones and for the purpose of furthering human activity recognition (available here: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)).

The script does the following:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The final dataset is placed in the local workspace under the variable name `final_df` and is additionally written to the local directory in a file titled `tidy-data.txt`

This repo additionally contains a code book describing the variables in the dataset used above.
