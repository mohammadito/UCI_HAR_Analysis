# Human Activity Recognition Data Analysis

## Overview
This project processes the UCI Human Activity Recognition dataset to create a tidy dataset for analysis. The dataset contains accelerometer and gyroscope data from Samsung Galaxy S smartphones, capturing human activities (e.g., walking, sitting).

The script `run_analysis.R` performs the following:
1. Merges training and test datasets.
2. Extracts mean and standard deviation measurements.
3. Uses descriptive activity names.
4. Labels variables descriptively.
5. Creates a tidy dataset with averages for each subject and activity.

## Repository Structure
- `run_analysis.R`: R script to process the data.
- `CodeBook.md`: Describes the dataset, variables, and transformations.
- `tidy_data.txt`: Output tidy dataset.
- `README.md`: This file.

## How to Run
1. Ensure R is installed.
2. Install the `dplyr` package: `install.packages("dplyr")`.
3. Download the dataset: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
4. Place `run_analysis.R` in the same directory as the unzipped dataset.
5. Run the script in R: `source("run_analysis.R")`.
6. The output `tidy_data.txt` will be created in the working directory.

## Dependencies
- R (version 3.6 or higher recommended).
- `dplyr` package for data manipulation.

## Data Source
- UCI HAR Dataset: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
