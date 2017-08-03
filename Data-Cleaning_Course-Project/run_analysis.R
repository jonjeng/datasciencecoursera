
####################
# First, merge the training and the test sets to create one data set.
library(plyr)
activities <- read.table('activity_labels.txt', colClasses=c('integer', 'character'))
colnames(activities) <- c('activity', 'activityName')
fnames <- read.table('features.txt', colClasses=c('integer', 'character'))
features <- fnames[,2]

setwd('./train')
df1 <- cbind(read.table('subject_train.txt'), read.table('y_train.txt'), read.table('X_train.txt'))

setwd('../test')
df2 <- cbind(read.table('subject_test.txt'), read.table('y_test.txt'), read.table('X_test.txt'))

setwd('../')
combined <- rbind(df1,df2)
cnames <- c('subject', 'activity', features)
colnames(combined) <- cnames


####################
# Next, extract only the measurements on the mean and standard deviation for each measurement.
feats <- c(1,2,grep('mean|std', cnames))
df <- combined[,feats]


####################
# Use descriptive activity names to name the activities in the data set
df <- join(df, activities, by='activity')
df <- df[,c(1,82,3:81)]


####################
# Appropriately label the data set with descriptive variable names.
cnames <- names(df)

for (i in 3:81) {
    d <- cnames[i]
    d <- sub('\\(\\)','',d)
    d <- sub('Acc','Acceleration',d)
    d <- sub('Gyro','Gyroscope',d)
    d <- sub('Mag','Magnitude',d)
    d <- sub('BodyBody','Body',d)
    if (substr(d,1,1)=='t') {
        d <- sub('-','Time-',d)
        d <- sub('^t','',d)
    }
    else if (substr(d,1,1)=='f') {
        d <- sub('-','Frequency-',d)
        d <- sub('^f','',d)
    }
    cnames[i] <- d
}

names(df) <- cnames

####################
# From the resulting data set, create a second, independent tidy data set with the average of each variable for each activity and each subject.

df_avgs <- ddply(df, c('subject','activityName'), numcolwise(mean))

write.table(df_avgs, file='tidy-data.txt', row.name=FALSE)
rm(d, cnames, feats, features, activities, combined, df1, df2, fnames)
