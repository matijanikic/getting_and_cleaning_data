
/* read the train data set tables */

y_train <- read.delim2("./train/y_train.txt", header = FALSE, sep = "\t")
subject_train <- read.delim2("./train/subject_train.txt", header = FALSE, sep = "\t")
x_train <- read.table("./train/x_train.txt", header = FALSE)

/* name the descriptive data set  variables */
names(y_train) <- "ACTIVITY_LABEL"
names(subject_train) <- "SUBJECT_ID"

/* join columns for a full training data set */

x_train$SUBJECT_ID <- as.numeric(subject_train$SUBJECT_ID)
x_train$ACTIVITY_LABEL <- as.numeric(y_train$ACTIVITY_LABEL)

/* set the source as "1" in order to identify the set later if necessary */

x_train$datasource <- 1


/* read the test data set tables */

y_test <- read.delim2("./test/y_test.txt", header = FALSE, sep = "\t")
subject_test <- read.delim2("./test/subject_test.txt", header = FALSE, sep = "\t")
x_test <- read.table("./test/x_test.txt", header = FALSE)

/* name the descriptive data set  variables */

names(y_test) <- "ACTIVITY_LABEL"
names(subject_test) <- "SUBJECT_ID"

/* join columns for a full test data set */

x_test$SUBJECT_ID <- as.numeric(subject_test$SUBJECT_ID)
x_test$ACTIVITY_LABEL <- as.numeric(y_test$ACTIVITY_LABEL)
x_test$datasource <- 2

/* merge the training and test data source into one complete data set */

x_complete <- rbind(x_train,x_test)

/* read the descriptions of the measurements */
features <- read.table("./features.txt", header = FALSE)

/* label the variables in the complete data set */
names(x_complete) <- as.character(features$V2)
names(x_complete)[562:564] <- c("subject_id","activity_label","datasource")

/* select only the variables related to mean or standard deviation */
library("sqldf")
subset_mean_std  = sqldf("select * from features where V2 like '%mean%' or V2 like '%std%'  ")

/* subset into x_mean_std  with necessary info */

x_mean_std <- x_complete[,c(subset_mean_std$V1,562:564)]



library(plyr)
/* identify groupColumns and dataColumns */
groupColumns <- names(x_mean_std)[87:88]
dataColumns <- names(x_mean_std)[1:86]

/*  produce a clean data set */

res = ddply(x_mean_std, groupColumns, function(x) colMeans(x[dataColumns]))

/* produce an output file "analysis.txt" in the working directory */

write.table(res, "./analysis.txt", row.name=FALSE)
