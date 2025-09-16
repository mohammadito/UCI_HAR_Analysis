# CodeBook for Tidy Human Activity Recognition Dataset

## Data Source
The data is from the UCI Human Activity Recognition Using Smartphones dataset:
- Source: [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
- Downloaded from: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Variables
- **subject**: Integer (1–30), identifier for the subject who performed the activity.
- **activity**: Factor, descriptive activity name (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).
- **Measurement variables**: Numeric, averages of mean and standard deviation measurements from accelerometer and gyroscope signals. Examples:
  - `tbodyacc_mean_x`, `tbodyacc_mean_y`, `tbodyacc_mean_z`: Mean body acceleration in X, Y, Z axes.
  - `tbodyacc_std_x`, `tbodyacc_std_y`, `tbodyacc_std_z`: Standard deviation of body acceleration in X, Y, Z axes.
  - [List all ~66 variables matching `mean()` or `std()` from `features.txt`, e.g., `tgravityacc_mean_x`, `fbodyacc_mean_x`, etc.]
- **Units**: Measurements are normalized (range: -1 to 1), so no specific units apply.

## Transformations
1. Merged training (`X_train.txt`, `y_train.txt`, `subject_train.txt`) and test (`X_test.txt`, `y_test.txt`, `subject_test.txt`) datasets.
2. Extracted columns containing `mean()` or `std()` from `features.txt`.
3. Replaced activity codes with descriptive names from `activity_labels.txt`.
4. Cleaned variable names: removed parentheses, replaced hyphens with underscores, converted to lowercase.
5. Created a tidy dataset by computing the mean of each measurement for each subject-activity pair.

## Output
- The tidy dataset (`tidy_data.txt`) contains 180 rows (30 subjects × 6 activities) and columns for `subject`, `activity`, and measurement variables.
- Saved using `write.table(tidy_data, "tidy_data.txt", row.names = FALSE)`.
