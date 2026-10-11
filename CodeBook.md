# Code Book

## Source data

The data come from the "Human Activity Recognition Using Smartphones Data Set"
(UCI Machine Learning Repository):

* Description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
* Data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Thirty volunteers (aged 19-48) performed six activities while wearing a Samsung
Galaxy S II smartphone on the waist. The accelerometer and gyroscope recorded
3-axial linear acceleration and 3-axial angular velocity at 50 Hz. The original
data were randomly split into a training set (70% of the volunteers) and a test
set (30%).

## Transformations

1. The training and test sets were merged (subject, activity and measurements).
2. Only the measurements on the mean (`mean()`) and standard deviation
   (`std()`) were kept: 66 of the 561 features.
3. Activity codes (1-6) were replaced with descriptive activity names.
4. Variable names were made descriptive (see "Naming rules").
5. The average of each variable was calculated for each subject and each
   activity.

## The tidy data set (`tidy_data.txt`)

* 180 rows: one row for each combination of subject (30) and activity (6)
* 68 columns: 2 identifiers and 66 averaged measurements
* Space-separated text file with a header row

### Identifiers

| Variable | Type | Description |
|---|---|---|
| `subject` | integer, 1-30 | Identifier of the volunteer |
| `activity` | factor, 6 levels | Activity performed: `WALKING`, `WALKING_UPSTAIRS`, `WALKING_DOWNSTAIRS`, `SITTING`, `STANDING`, `LAYING` |

### Measurements

Each of the 66 measurement variables is the **average**, for one subject and one
activity, of the corresponding feature in the original data. The original
features were normalized and bounded within [-1, 1], so the values have no
units.

### Naming rules

| Part of the name | Meaning |
|---|---|
| `Time` | Time-domain signal |
| `Frequency` | Frequency-domain signal (after a Fast Fourier Transform) |
| `Body` | Body component of the signal |
| `Gravity` | Gravity component of the signal |
| `Accelerometer` | Measured by the accelerometer |
| `Gyroscope` | Measured by the gyroscope |
| `Jerk` | Jerk signal (derived in time from acceleration or angular velocity) |
| `Magnitude` | Magnitude of the three-dimensional signal |
| `Mean` | Mean value |
| `Std` | Standard deviation |
| `X`, `Y`, `Z` | Axis of the signal |

### List of measurement variables

Time-domain variables (40):

* `TimeBodyAccelerometerMeanX`, `...MeanY`, `...MeanZ`, `TimeBodyAccelerometerStdX`, `...StdY`, `...StdZ`
* `TimeGravityAccelerometerMeanX/Y/Z`, `TimeGravityAccelerometerStdX/Y/Z`
* `TimeBodyAccelerometerJerkMeanX/Y/Z`, `TimeBodyAccelerometerJerkStdX/Y/Z`
* `TimeBodyGyroscopeMeanX/Y/Z`, `TimeBodyGyroscopeStdX/Y/Z`
* `TimeBodyGyroscopeJerkMeanX/Y/Z`, `TimeBodyGyroscopeJerkStdX/Y/Z`
* `TimeBodyAccelerometerMagnitudeMean`, `TimeBodyAccelerometerMagnitudeStd`
* `TimeGravityAccelerometerMagnitudeMean`, `TimeGravityAccelerometerMagnitudeStd`
* `TimeBodyAccelerometerJerkMagnitudeMean`, `TimeBodyAccelerometerJerkMagnitudeStd`
* `TimeBodyGyroscopeMagnitudeMean`, `TimeBodyGyroscopeMagnitudeStd`
* `TimeBodyGyroscopeJerkMagnitudeMean`, `TimeBodyGyroscopeJerkMagnitudeStd`

Frequency-domain variables (26):

* `FrequencyBodyAccelerometerMeanX/Y/Z`, `FrequencyBodyAccelerometerStdX/Y/Z`
* `FrequencyBodyAccelerometerJerkMeanX/Y/Z`, `FrequencyBodyAccelerometerJerkStdX/Y/Z`
* `FrequencyBodyGyroscopeMeanX/Y/Z`, `FrequencyBodyGyroscopeStdX/Y/Z`
* `FrequencyBodyAccelerometerMagnitudeMean`, `FrequencyBodyAccelerometerMagnitudeStd`
* `FrequencyBodyAccelerometerJerkMagnitudeMean`, `FrequencyBodyAccelerometerJerkMagnitudeStd`
* `FrequencyBodyGyroscopeMagnitudeMean`, `FrequencyBodyGyroscopeMagnitudeStd`
* `FrequencyBodyGyroscopeJerkMagnitudeMean`, `FrequencyBodyGyroscopeJerkMagnitudeStd`
