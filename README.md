# Getting and Cleaning Data - Course Project

This repository contains my course project for the Coursera course
"Getting and Cleaning Data". The goal is to prepare a tidy data set from the
"Human Activity Recognition Using Smartphones" data collected from the
accelerometers and gyroscopes of Samsung Galaxy S smartphones.

## Files

| File | Description |
|---|---|
| `run_analysis.R` | The script that performs the whole analysis |
| `tidy_data.txt` | The tidy data set produced by the script |
| `CodeBook.md` | Describes the data, the variables and the transformations |
| `README.md` | This file |

## How to run

1. Place `run_analysis.R` in your working directory.
2. If the folder `UCI HAR Dataset` is already in the working directory, the
   script uses it. Otherwise the script downloads and unzips the data.
3. Run `source("run_analysis.R")`.
4. The script writes `tidy_data.txt` to the working directory.

Only base R is used, so no extra packages are required.

## How the script works

1. **Merge.** For each of the `train` and `test` sets, the subject file, the
   activity file (`y_`) and the measurement file (`X_`) are read and bound
   together by column. The two sets are then bound by row, giving 10,299
   observations.
2. **Extract.** Only the features whose names contain `mean()` or `std()` are
   kept (66 measurements). Features such as `meanFreq()` and the `angle`
   variables are not included because they are not the mean or standard
   deviation of a measurement.
3. **Activity names.** The numeric activity codes are replaced with the names
   in `activity_labels.txt` (for example `WALKING`, `SITTING`).
4. **Variable names.** The feature names are expanded into descriptive names:
   `t` becomes `Time`, `f` becomes `Frequency`, `Acc` becomes `Accelerometer`,
   `Gyro` becomes `Gyroscope`, `Mag` becomes `Magnitude`, and parentheses and
   dashes are removed.
5. **Summarize.** The average of each of the 66 variables is computed for each
   subject and each activity, giving 180 rows (30 subjects x 6 activities) and
   68 columns. The result is written with `write.table(..., row.names = FALSE)`.

## Why the result is tidy

* Each variable is in one column.
* Each observation (one subject performing one activity) is in one row.
* The table contains one kind of observational unit.

## Reading the tidy data

```r
tidy <- read.table("tidy_data.txt", header = TRUE)
View(tidy)
```
