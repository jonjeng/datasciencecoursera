#Data
___
The data obtained for and operated on in the script run_analysis.R is originally available on the [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
The script explicitly removes from the workspace variables containing data that is not needed for the project. As such, the data immediately accessible is but a limited subset of the original dataset of the above link. The following will describe this limited subset.

## Variables
___
After the script is run, the variables placed in the local workspace are `df` and `df_avgs`

### `df`
`df` is a data frame of size 10299 by 81. Each row contains a set of measurements corresponding to a subject performing a specific activity.
The first two columns of `df`, `subject` and `activityName`, identify the subject and activity to which the measurements correspond.
The measurements are as follows:
* `BodyAccelerationTime-mean-X`
* `BodyAccelerationTime-mean-Y`
* `BodyAccelerationTime-mean-Z`
* `BodyAccelerationTime-std-X`
* `BodyAccelerationTime-std-Y`
* `BodyAccelerationTime-std-Z`
* `GravityAccelerationTime-mean-X`
* `GravityAccelerationTime-mean-Y`
* `GravityAccelerationTime-mean-Z`
* `GravityAccelerationTime-std-X`
* `GravityAccelerationTime-std-Y`
* `GravityAccelerationTime-std-Z`
* `BodyAccelerationJerkTime-mean-X`
* `BodyAccelerationJerkTime-mean-Y`
* `BodyAccelerationJerkTime-mean-Z`
* `BodyAccelerationJerkTime-std-X`
* `BodyAccelerationJerkTime-std-Y`
* `BodyAccelerationJerkTime-std-Z`
* `BodyGyroscopeTime-mean-X`
* `BodyGyroscopeTime-mean-Y`
* `BodyGyroscopeTime-mean-Z`
* `BodyGyroscopeTime-std-X`
* `BodyGyroscopeTime-std-Y`
* `BodyGyroscopeTime-std-Z`
* `BodyGyroscopeJerkTime-mean-X`
* `BodyGyroscopeJerkTime-mean-Y`
* `BodyGyroscopeJerkTime-mean-Z`
* `BodyGyroscopeJerkTime-std-X`
* `BodyGyroscopeJerkTime-std-Y`
* `BodyGyroscopeJerkTime-std-Z`
* `BodyAccelerationMagnitudeTime-mean`
* `BodyAccelerationMagnitudeTime-std`
* `GravityAccelerationMagnitudeTime-mean`
* `GravityAccelerationMagnitudeTime-std`
* `BodyAccelerationJerkMagnitudeTime-mean`
* `BodyAccelerationJerkMagnitudeTime-std`
* `BodyGyroscopeMagnitudeTime-mean`
* `BodyGyroscopeMagnitudeTime-std`
* `BodyGyroscopeJerkMagnitudeTime-mean`
* `BodyGyroscopeJerkMagnitudeTime-std`
* `BodyAccelerationFrequency-mean-X`
* `BodyAccelerationFrequency-mean-Y`
* `BodyAccelerationFrequency-mean-Z`
* `BodyAccelerationFrequency-std-X`
* `BodyAccelerationFrequency-std-Y`
* `BodyAccelerationFrequency-std-Z`
* `BodyAccelerationFrequency-meanFreq-X`
* `BodyAccelerationFrequency-meanFreq-Y`
* `BodyAccelerationFrequency-meanFreq-Z`
* `BodyAccelerationJerkFrequency-mean-X`
* `BodyAccelerationJerkFrequency-mean-Y`
* `BodyAccelerationJerkFrequency-mean-Z`
* `BodyAccelerationJerkFrequency-std-X`
* `BodyAccelerationJerkFrequency-std-Y`
* `BodyAccelerationJerkFrequency-std-Z`
* `BodyAccelerationJerkFrequency-meanFreq-X`
* `BodyAccelerationJerkFrequency-meanFreq-Y`
* `BodyAccelerationJerkFrequency-meanFreq-Z`
* `BodyGyroscopeFrequency-mean-X`
* `BodyGyroscopeFrequency-mean-Y`
* `BodyGyroscopeFrequency-mean-Z`
* `BodyGyroscopeFrequency-std-X`
* `BodyGyroscopeFrequency-std-Y`
* `BodyGyroscopeFrequency-std-Z`
* `BodyGyroscopeFrequency-meanFreq-X`
* `BodyGyroscopeFrequency-meanFreq-Y`
* `BodyGyroscopeFrequency-meanFreq-Z`
* `BodyAccelerationMagnitudeFrequency-mean`
* `BodyAccelerationMagnitudeFrequency-std`
* `BodyAccelerationMagnitudeFrequency-meanFreq`
* `BodyAccelerationJerkMagnitudeFrequency-mean`
* `BodyAccelerationJerkMagnitudeFrequency-std`
* `BodyAccelerationJerkMagnitudeFrequency-meanFreq`
* `BodyGyroscopeMagnitudeFrequency-mean`
* `BodyGyroscopeMagnitudeFrequency-std`
* `BodyGyroscopeMagnitudeFrequency-meanFreq`
* `BodyGyroscopeJerkMagnitudeFrequency-mean`
* `BodyGyroscopeJerkMagnitudeFrequency-std`
* `BodyGyroscopeJerkMagnitudeFrequency-meanFreq`

The variable `df_avgs` is a size 180 by 81 data frame containing the average of each of the above 79 measurements for each of the 30 subjects performing the six given activities. The columns of this data frame are identical to those of `df`; namely, the first contains an identifier of the subject to whom the measurements correspond to and the second contains the activity to which the measurements correspond.
