#setting the working directory to course project folder
setwd("~/Desktop/Coursera/Getting Cleaning data Spring2014 JHU/project")

#read in the labels for data
features <- read.table(file = "UCI HAR Dataset/features.txt")
activity_labels <- read.table(file = "UCI HAR Dataset/activity_labels.txt")
features[,2] <- as.character(features[,2])
features[,2] <- gsub("-", "_", features[,2])
features[,2] <- gsub("\\(\\)", "", features[,2])

#read all related datasets
subject_test <- read.table(file = "UCI HAR Dataset/test/subject_test.txt", col.names = "subject_ID")
X_test <- read.table(file = "UCI HAR Dataset/test/X_test.txt", col.names = features[, 2])
Y_test <- read.table(file = "UCI HAR Dataset/test/Y_test.txt", col.name = "activity_ID")

subject_train <- read.table(file = "UCI HAR Dataset/train/subject_train.txt", col.names = "subject_ID")
X_train <- read.table(file = "UCI HAR Dataset/train/X_train.txt", col.names = features[, 2])
Y_train <- read.table(file = "UCI HAR Dataset/train/Y_train.txt", col.name = "activity_ID")

#subset the measurement values only related to means and std
X_test <- X_test[ , grep("_mean|_std", features[ ,2])]
X_train <- X_train[ , grep("_mean|_std", features[ ,2])]

#switch activity ID into activity names
gsub2 <- function(pattern, replacement, x, ...){
    for (i in (1:length(pattern)))
        x <- gsub(pattern[i], replacement[i], x, ...)
    x
}

Y_test$activity_ID <- gsub2(activity_labels[ ,1], activity_labels[, 2], Y_test$activity_ID) 
Y_train$activity_ID <- gsub2(activity_labels[, 1], activity_labels[, 2], Y_train$activity_ID)

#merge data
test_data <- cbind(subject_test, cbind(Y_test, X_test))
train_data <- cbind(subject_train, cbind(Y_train, X_train))
combined_data <- rbind(test_data, train_data)

#remove all objects from memory except combined_data
rm(list=(ls()[ls()!="combined_data"])) 

#reshape the dataframe and get the tidy form
library(reshape2)
combined_data_melt <- melt(combined_data, id.vars = c("subject_ID","activity_ID"))
mean_combined_data <- dcast(combined_data_melt, subject_ID + activity_ID ~ variable, mean)
for(i in (3:81)){
    names(mean_combined_data)[i] <- paste("ave",names(mean_combined_data)[i], sep = "_")
}

#save tidy dataframe in text file
write.table(mean_combined_data, file = "Human_activity_tidy_data.txt", row.names = FALSE)



