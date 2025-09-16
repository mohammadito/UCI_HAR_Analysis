# run_analysis.R

# Load required packages
library(dplyr)

# Step 1: Download and unzip the dataset (if not already done)
dataset_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(dataset_url, destfile = "UCI_HAR_Dataset.zip")
unzip("UCI_HAR_Dataset.zip")

# Step 2: Read the data
# Read training data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_labels <- read.table("UCI HAR Dataset/train/y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")

# Read test data
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_labels <- read.table("UCI HAR Dataset/test/y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Read feature names and activity labels
features <- read.table("UCI HAR Dataset/features.txt")
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Step 3: Merge the training and test sets
# Combine data
all_data <- rbind(train_data, test_data)
all_labels <- rbind(train_labels, test_labels)
all_subjects <- rbind(train_subjects, test_subjects)

# Step 4: Extract measurements on mean and standard deviation
# Identify columns for mean and std (using features.txt)
mean_std_cols <- grep("mean\\(\\)|std\\(\\)", features$V2)
# Subset the data to include only mean and std columns
data_mean_std <- all_data[, mean_std_cols]

# Step 5: Use descriptive activity names
# Merge activity labels with activity codes
all_labels <- merge(all_labels, activity_labels, by.x = "V1", by.y = "V1")
# Replace activity codes with descriptive names
all_labels <- all_labels$V2

# Step 6: Appropriately label the dataset with descriptive variable names
# Assign feature names to columns, clean up names
colnames(data_mean_std) <- features[mean_std_cols, 2]
# Clean variable names: remove special characters, make consistent
colnames(data_mean_std) <- gsub("\\(\\)", "", colnames(data_mean_std))
colnames(data_mean_std) <- gsub("-", "_", colnames(data_mean_std))
colnames(data_mean_std) <- tolower(colnames(data_mean_std))

# Combine subjects, activities, and measurements
final_data <- cbind(subject = all_subjects$V1, activity = all_labels, data_mean_std)

# Step 7: Create a tidy dataset with averages for each activity and subject
tidy_data <- final_data %>%
  group_by(subject, activity) %>%
  summarise_all(mean, na.rm = TRUE)

# Step 8: Write the tidy dataset to a file
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)

# Output message
cat("Tidy dataset has been created and saved as 'tidy_data.txt'.\n")
