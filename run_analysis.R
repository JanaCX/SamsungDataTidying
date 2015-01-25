# Project
#
# This is my working directory, but lets assume the folders are saved in your working directory so the rest of the code will look into the test and train folders automatically
# setwd("~/Documents/DataSci/3. Getting the data/Wk3/UCI HAR Dataset")
#
# Reads the variable names stored int he 'features' file. 
# gsub eliminates the characters in the names that can cause trouble such as parenthesis and '-'. We need to remove double and triple dots so we use gsub two more times
# gsbu also conveniently converts the variable into a vector, which is what we'll need later
# Note: the vector 'features' will be used to add the variable names to the "test" and "train" datasets
features<-read.table("features.txt", header=FALSE)
features<-gsub("[[:punct:]]", ".", features[,2])
features<-gsub("\\.\\.\\.", ".", features)
features<-gsub("\\.\\.", ".", features)

# Considering the size of the datasets and knowing that we are to keep only a few of the variables, we will clean the "test" and "train" datasets separately and merge last
# Dataset 'test'
# Lets read the test data: subject numbers, activity codes and the data on the 561 variable measured & assign descriptive column names. The names for the measured variables are stored in the now clean 'features' vector
Subject<-read.table("./test/subject_test.txt", header=FALSE)
Activity<-read.table("./test/y_test.txt", header=FALSE)
XTest<-read.table("./test/X_test.txt", header=FALSE)
names(Subject)<-"subject"
names(Activity)<-"ActivityCode"
names(XTest)<-features

# Adding descriptive names to activities. 
# Reads the key of the activity codes vs actual activities from the "activity_labels.txt" file and saves to a variable named "actLabels"
# Uses the 'match' function to read the Codes from the 'actLabels' dataset and adds the corresponding "activity" to the new column in the "Activity" dataframe
actLabels<-read.table("activity_labels.txt", header=FALSE)
names(actLabels)<-c("ActivityCode", "activity")
Activity$activity <- actLabels$activity[ match(Activity$ActivityCode, actLabels$ActivityCode)]

# The function 'matchcols' produces a list of all the variable names that contain the strings "mean", "Mean" and "std" (aka the data we want). Then we use unlist to produce the vector "variables" with the names of all the columns we want to keep and use "variables" as an argument for the 'subset' function.
# Even thought this vector was generated with the "test" dataset we will reuse to subset the "train" dataset since both sets have the same measurements
library(gdata)
variables<-matchcols(XTest, with=c("mean", "Mean", "std"), method="or")
variables<-unlist(variables, use.names=FALSE)
NumberOfColumnsKept<-length(variables)    # number of olumns that need to be kept
# We'll subset by the columns that contain the mean or the standard deviation of the measured variables before merging datasets to free up memory
XTest<-subset(XTest, select=variables)
# Let's complete the test dataset by adding the 'subject' and 'ActivityCode' columns to the 'XTest' dataframe
TestData<-cbind(Subject, Activity, XTest)
rm(XTest)

# Now lets prepare the "test" dataset. We'll reuse the "features" vector to assign column names to the XTrain dataset and will reuse "variables" to subset the data choosing only the columns containign the mean and std 
Subject<-read.table("./train/subject_train.txt", header=FALSE)
Activity<-read.table("./train/y_train.txt", header=FALSE)
XTrain<-read.table("./train/X_train.txt", header=FALSE)
names(Subject)<-"subject"
names(Activity)<-"ActivityCode"
Activity$activity <- actLabels$activity[ match(Activity$ActivityCode, actLabels$ActivityCode)]
names(XTrain)<-features
XTrain<-subset(XTrain, select=variables)
TrainData<-cbind(Subject, Activity, XTrain)
rm(XTrain)

# Time to merge both datasets
AllData<-rbind(TestData, TrainData)
# Sorts database, just for aesthetic purposes (and to help me check that all subjects and activities are included)
AllData<-AllData[order(AllData$subject, AllData$ActivityCode),]

# Part 5. Calculating the means of all the variables by subject and activity 
SummaryData<-aggregate(. ~ subject + ActivityCode, data = AllData, mean)
# Since I pass all of the columns to the "aggregate" function, the activity column gets coerced to numeric so i end up with weird values in this column, to fix we just need to re-match the activities using the ActivityCode column
SummaryData$activity <- actLabels$activity[ match(SummaryData$ActivityCode, actLabels$ActivityCode)]
write.table(SummaryData, file="SummaryData.txt", row.names=FALSE)
