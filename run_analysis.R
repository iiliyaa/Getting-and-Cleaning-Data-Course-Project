library(dplyr)

# Load datasets
features <- read.table("features.txt", col.names = c("n", "functions"))
activities <- read.table("activity_labels.txt", col.names = c("code", "activity"))

xTrain <- read.table("train/X_train.txt", col.names = features$functions)
activityTrain <- read.table("train/y_train.txt", col.names = "code")
subjectTrain <- read.table("train/subject_train.txt", col.names = "subject")

xTest <- read.table("test/X_test.txt", col.names = features$functions)
activityTest <- read.table("test/y_test.txt", col.names = "code")
subjectTest <- read.table("test/subject_test.txt", col.names = "subject")

# Merge training and test datasets
train <- cbind(activityTrain, subjectTrain, xTrain)
test <- cbind(activityTest, subjectTest, xTest)
mergedData <- rbind(train, test)

# Extract measurements on the mean and standard deviation
tidyData <- mergedData %>%
  select(subject, code, contains("mean"), contains("std"))

# Replace activity codes with descriptive activity names
tidyData$code <- activities[tidyData$code, 2]

# Rename columns with more descriptive names
names(tidyData)[2] = "activity"
rename_patterns <- c(
  "Acc" = "Accelerometer",
  "Gyro" = "Gyroscope",
  "BodyBody" = "Body",
  "Mag" = "Magnitude",
  "^t" = "Time",
  "^f" = "Frequency",
  "tBody" = "TimeBody",
  "-mean()" = "Mean",
  "-std()" = "STD",
  "-freq()" = "Frequency",
  "angle" = "Angle",
  "gravity" = "Gravity"
)

for (pattern in names(rename_patterns)) {
  replacement <- rename_patterns[[pattern]]
  names(tidyData) <- gsub(pattern, replacement, names(tidyData), ignore.case = TRUE)
}

# Compute average of each variable for each activity and subject
finalTidyData <- tidyData %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), mean), .groups = "drop")

# Export the tidy data
write.table(finalTidyData, "tidyData.txt", row.name = FALSE)
