library(reshape2)

# Data is divided in Training (21 volunteers) & Test (9 volunteers) data sets

# Objective 1 - merge training & Test data sets.

# load the data
subject_train <- read.table('./train/subject_train.txt')
subject_test <- read.table('./test/subject_test.txt')
x_train <- read.table("./train/X_train.txt")
x_test <- read.table("./test/X_test.txt")
y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")

#include column names for subject train & test data set
names(subject_train) <- 'subjectid'
names(subject_test) <- 'subjectid'

# For X train & test data set, use Features files
features <- read.table('features.txt')

# apply the 2nd column i.e. V2 to X data set
names(x_train) <- features$V2
names(x_test) <- features$V2

# the y train & test represent the activity files, apply the names for them as well
names(y_train) <- 'activity'
names(y_test) <- 'activity'

# Now onto objective 1.. merge
# first combine the subject, train & test into 1 dataset, do the same for test and finally merge all of them together
# subject & activity first followed by the long list of x variables
train <- cbind(subject_train, y_train, x_train) 
test <- cbind(subject_test, y_test, x_test)
mergeddata <- rbind(train,test)

#str(mergeddata)

# Objective 2. Find column names with only mean & standard deviation of each measurement
#names(mergeddata)
# tried grep -- only gave me the columns, what i need is all columns with true or false, hence grepl
neededcolumns <- grepl('mean', ignore.case = TRUE, names(mergeddata)) |
  grepl('std', ignore.case = TRUE, names(mergeddata))

# also the 1st 2 i.e. subject & activity need to be included
neededcolumns[1:2] <- TRUE

# now get only the neccessary columns
necdata <- mergeddata[, neededcolumns]


# Objective 3 & 4 - tag with descriptive activity names & labels
necdata$activity <- factor(necdata$activity, labels=c("Walking",
                    "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

# Objective 5 - create a second dataset with the average mean and standard deviation
# of each variable

melteddata <- melt(necdata, id=c('subjectid', 'activity')) # does a transpose function as in excel

tidydata <- dcast(melteddata, subjectid+activity ~ variable, mean)

# write tidy data set to file for uploading with row names = false
write.csv(tidydata, file= 'tidy.txt', row.names = FALSE)