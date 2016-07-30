
# Initialize initial values
targetFolder <- 'UCI HAR Dataset'
filename <- 'get_dataset.zip'

# Check if file already unzipped
if(!file.exists(targetFolder)) {
  if(!file.exists(filename)) {
    
    download.file(
      'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip',
      filename
    )
  }
  
  unzip(filename)
}

# 1. Merge training and test data sets to create one data set.

# Read the data
testing.data <- read.table(file.path(targetFolder, 'test', 'X_test.txt'))
testing.activities <- read.table(file.path(targetFolder, 'test', 'y_test.txt'))
testing.subjects <- read.table(file.path(targetFolder, 'test', 'subject_test.txt'))

training.data <- read.table(file.path(targetFolder, 'train', 'X_train.txt'))
training.activities <- read.table(file.path(targetFolder, 'train', 'y_train.txt'))
training.subjects <- read.table(file.path(targetFolder, 'train', 'subject_train.txt'))

# Bind the rows for each of the data sets together
data.data <- rbind(training.data, testing.data)
data.activities <- rbind(training.activities, testing.activities)
data.subjects <- rbind(training.subjects, testing.subjects)

# Combine all of of the different columns together into one table
full_data <- cbind(data.subjects, data.activities, data.data)

# 2. Extract the mean and standard deviation for each measurement. 

features <- read.table(file.path(targetFolder, 'features.txt'))

requiredFeatures <- features[grep('-(mean|std)\\(\\)', features[, 2 ]), 2]
full_data <- full_data[, c(1, 2, requiredFeatures)]

# 3. Name the activities in the data set

# Read the activity labels
activities <- read.table(file.path(targetFolder, 'activity_labels.txt'))

# Update the activity name
full_data[, 2] <- activities[full_data[,2], 2]

# 4. Label the data set with correct descriptive variable names. 

colnames(full_data) <- c(
  'subject',
  'activity',
  
  gsub('\\-|\\(|\\)', '', as.character(requiredFeatures))
)

full_data[, 2] <- as.character(full_data[, 2])

# 5. Create a new tidy data set with the mean of each variable for each activity and each subject.

final.melted <- melt(full_data, id = c('subject', 'activity'))

final.mean <- dcast(final.melted, subject + activity ~ variable, mean)

# Write the data to a tidy.txt
write.table(final.mean, file=file.path("tidy_data.txt"), row.names = FALSE, quote = FALSE)


