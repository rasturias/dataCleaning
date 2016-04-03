## This R Script will process data from the data provided in
## https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
## and crate Tidy data in the following steps
#  1. Merges the training and the test sets to create one data set.
#  2. Extracts only the measurements on the mean and standard deviation 
#     for each measurement.
#  3. Uses descriptive activity names to name the activities in the data set
#  4. Appropriately labels the data set with descriptive variable names.
#  5. From the data set in step 4, creates a second, independent tidy data 
#     set with the average of each variable for each activity and each subject.


run_analysis <- function (trainingSetPath = "train/",
                          testSetPath = "test/",
                          dataLabelsFile = "features.txt",
                          activityLabelsFile = "activity_labels.txt" ) {
        
        # Load Files with the corresponding Labels
        
        dataLabels <- read.table(dataLabelsFile, header = FALSE)
        activityLabels <- read.table(activityLabelsFile, header = FALSE)
        
        trainingSetFile <- read.table(paste(trainingSetPath,"X_train.txt", sep = "")
                                                , header = FALSE, 
                                                col.names = dataLabels$V2)
        
        #append the subjects to the training set
        
        trainingSetFile <- cbind(trainingSetFile, read.table(
                             paste(trainingSetPath,
                                 "subject_train.txt", sep = ""), 
                                      header = FALSE, 
                                      col.names = "subject"))

        #append the activity to the training set
        
        trainingSetFile <- cbind(trainingSetFile, read.table(
                                paste(trainingSetPath,
                                "y_train.txt", sep = ""), 
                                header = FALSE, 
                                col.names = "activity"))
        
        

        testSetFile <- read.table(paste(testSetPath,"X_test.txt", sep = ""), 
                                      header = FALSE, 
                                      col.names = dataLabels$V2)
        
        #append the subjects to the test set
        
        testSetFile <- cbind(testSetFile, read.table(paste(testSetPath,
                                                    "subject_test.txt", sep = ""), 
                                                     header = FALSE, 
                                                     col.names = "subject"))
        
        #append the activity to the test set
        
        testSetFile <- cbind(testSetFile, read.table(paste(testSetPath,
                                                      "y_test.txt", sep = ""), 
                                                       header = FALSE, 
                                                       col.names = "activity"))
        
                
        # 1. Merge training and test sets to create one data set.
        
        MergedDataSet <- rbind(trainingSetFile,testSetFile)
        #MergedDataSet
        
        # 2. Extracts only the measurements on the mean and standard deviation 
        #    for each measurement.
        meansAndStdSet <- MergedDataSet[
                                (grepl("mean\\(\\)|std\\(\\)|activity|subject",
                                       dataLabels$V2))]
        #meansAndStdSet
        
        #3. Uses descriptive activity names to name the activities in the data set
        for (i in 1:nrow(activityLabels)){
                
                meansAndStdSet$activity[ 
                                meansAndStdSet$activity == as.integer(activityLabels[i,1]) 
                                        ] <- as.character(activityLabels[i,2])
        }
        
        #meansAndStdSet
        
        #  4. Appropriately labels the data set with descriptive variable names.
        for (i in 1:ncol(meansAndStdSet)){
                
                #remove character .
                names(meansAndStdSet)[i] <- 
                        tolower(gsub("\\.","",names(meansAndStdSet)[i]))
                
                #replace t prefix for time
                names(meansAndStdSet)[i] <- 
                        tolower(gsub("^t","time",names(meansAndStdSet)[i]))
                
                #replace f prefix for frecuency
                names(meansAndStdSet)[i] <- 
                        tolower(gsub("^f","frequency",names(meansAndStdSet)[i]))
                
                                
        }        
        
        #meansAndStdSet
        
        #  5. From the data set in step 4, creates a second, independent tidy data 
        #     set with the average of each variable for each activity and each subject.
        
        tidyData <- 
                aggregate(meansAndStdSet[, 1:66],
                          list(meansAndStdSet$subject, 
                               meansAndStdSet$activity), mean)
        
        names(tidyData)[1] <- "subject"
        names(tidyData)[2] <- "activity"
        
        #return result
        tidyData
}