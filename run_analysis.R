## Assignment for Week 4 of Data Cleaning Coursera Course
## Student: Daniel H. Robertson
## Date: 18-Dec-2016

## define names of the final tidy data files
data_file1 <- "human_act_mean_std.csv"
data_file2 <- "human_act_average.csv"

#
# First check if data_file1 exists -- if so move on in the script
# To force recreation of file -- delete it
#
if (!file.exists(data_file1)) {

        message("creating data_file1")
        ## define url and file for original data and description locations
        url_data <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        url_desc <- "http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones"
        data_file <- "dataSet.zip"
        desc_file <- "desc.html"
        
        ## Download original data file and description
        if (!file.exists(data_file)) {
                download.file(url_data, data_file, method="curl")
        }
        if (!file.exists(desc_file)) {
                download.file(url_desc, desc_file, method="curl")
        }

        ## Creates a directory as below
        data_dir <- "UCI HAR Dataset"
        if (!dir.exists(data_dir)) {
                unzip(data_file)
        }


        ## Read Data from main and both test and train directories
        ##
        ## activity_labels.txt          -- activity mapping
        ## features.txt                 -- features mapping
        ## train/X_train.txt            -- Training Set
        ## train/y_train.txt            -- Training Labels
        ## train/subject_train.txt      -- Individual who trained
        ## similar for "test" directory

        act_labels   = read.table(paste0(data_dir, "/", "activity_labels.txt"), stringsAsFactors = FALSE)
        act_features = read.table(paste0(data_dir, "/", "features.txt"), stringsAsFactors = FALSE)
        train_data   = read.table(paste0(data_dir, "/", "train/X_train.txt"), stringsAsFactors = FALSE)
        train_label  = read.table(paste0(data_dir, "/", "train/y_train.txt"), stringsAsFactors = FALSE)
        train_sub    = read.table(paste0(data_dir, "/", "train/subject_train.txt"), stringsAsFactors = FALSE)
        test_data   = read.table(paste0(data_dir, "/", "test/X_test.txt"), stringsAsFactors = FALSE)
        test_label  = read.table(paste0(data_dir, "/", "test/y_test.txt"), stringsAsFactors = FALSE)
        test_sub    = read.table(paste0(data_dir, "/", "test/subject_test.txt"), stringsAsFactors = FALSE)

        ## Set the colnames of test and train data sets
        feature_names <- sub("\\()", "", act_features[,2])
        colnames(train_data) <- feature_names
        colnames(test_data) <- feature_names

        ## Subset to just the means and std
        features_keep = grepl("-mean$|-std$", feature_names)
        train_data_keep = train_data[features_keep]
        test_data_keep = test_data[features_keep]

        ## Add colname to differentiate test and train activities
        train_data_keep["dataCat"] <- rep(c("Train"), length(train_data_keep[,1]))
        test_data_keep["dataCat"]  <- rep(c("Test"), length(test_data_keep[,1]))

        ## Add the additional label and subjects information to test and train datasets, respectively
        train_data_keep$activity <- train_label[,1]
        train_data_keep$subject  <- train_sub[,1]
        test_data_keep$activity  <- test_label[,1]
        test_data_keep$subject   <- test_sub[,1]

        ## Join the two data frames now that we have individual components combined for train and test
        tidyData <- rbind(train_data_keep, test_data_keep)

        #swap out activity numbers for labels
        activityLabels = act_labels[tidyData$activity, 2]
        tidyData <- subset(tidyData, select = -c(activity))
        tidyData$activity = activityLabels

        write.table(tidyData, file = data_file1, row.names=FALSE, sep=",")
}

##
## Part 2 of exercise
##
## Create a file with average of each variable per individual per activity

data = read.csv(data_file1)
features   = colnames(data)
act_cols   = grep("mean$", features)
avg_features <- features[act_cols]
subjects   = sort(unique(data$subject))
activities = sort(unique(data$activity))
new_data = data.frame()
nrow = 1
for (sub in subjects) {
        for (act in activities) {
                new_data[nrow, "subject"] <- sub
                new_data[nrow, "activity"] <- act
                for (f in avg_features) {
                        values <- data[data$subject == sub & data$activity == act, f]
                        new_data[nrow, paste0("AVG", f)] <- mean(values)
                }
                nrow = nrow + 1
        }
}
## clean up feature names
colnames(new_data) = sub(".mean", "", colnames(new_data))

## Write out the file
write.table(new_data, file = data_file2, row.names=FALSE, sep=",")
