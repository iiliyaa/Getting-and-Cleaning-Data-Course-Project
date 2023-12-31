## Codebook for the `run_analysis.R` Script

### Overview:
The `run_analysis.R` script processes data from the Human Activity Recognition Using Smartphones Dataset. It merges test and training datasets, extracts specific measurements, labels the data with descriptive names, and summarizes specific features.

### Detailed Steps:

1. **Download and Setup the Dataset**:
    - The dataset should be downloaded and placed in the `UCI HAR Dataset` directory.

2. **Load Data into Variables**:
    - `features`: Loaded from `features.txt` (561 rows, 2 columns). This data contains measurement variables derived from accelerometer and gyroscope signals: tAcc-XYZ and tGyro-XYZ.
    - `activities`: Loaded from `activity_labels.txt` (6 rows, 2 columns). It's a mapping between activity labels and their descriptive names.
    - `subject_test`: Loaded from `test/subject_test.txt` (2947 rows, 1 column). Represents the subjects who performed the activity for each window sample in the test set.
    - `x_test`: Loaded from `test/X_test.txt` (2947 rows, 561 columns). Contains the test set's feature data.
    - `y_test`: Loaded from `test/y_test.txt` (2947 rows, 1 column). Contains the test set's activity labels.
    - `subject_train`: Loaded from `train/subject_train.txt` (7352 rows, 1 column). Represents the subjects who performed the activity for each window sample in the training set.
    - `x_train`: Loaded from `train/X_train.txt` (7352 rows, 561 columns). Contains the training set's feature data.
    - `y_train`: Loaded from `train/y_train.txt` (7352 rows, 1 column). Contains the training set's activity labels.

3. **Data Merging**:
    - Training and test datasets are merged to create a unified dataset:
        - `train`: Formed by column-binding `activityTrain`, `subjectTrain`, and `xTrain`.
        - `test`: Formed by column-binding `activityTest`, `subjectTest`, and `xTest`.
        - `mergedData`: Row-bound union of `train` and `test`.

4. **Extraction of Relevant Measurements**:
    - `tidyData`: A subset of `mergedData` (10299 rows). It retains only columns related to `subject`, `code`, and measurements on mean and standard deviation.

5. **Assign Descriptive Activity Names**:
    - Activity codes in the `code` column of `tidyData` are replaced with corresponding descriptive activity names from `activities`.

6. **Label the Dataset with Descriptive Variable Names**:
    - Multiple transformations applied to column names:
        - "code" renamed to "activity".
        - "Acc" replaced with "Accelerometer".
        - "Gyro" replaced with "Gyroscope".
        - "BodyBody" replaced with "Body".
        - "Mag" replaced with "Magnitude".
        - Prefix "f" replaced with "Frequency".
        - Prefix "t" replaced with "Time".

7. **Summary Dataset Creation**:
    - `finalTidyData`: Derived from `tidyData`, summarizing by taking the mean of each variable, grouped by activity and subject. 

8. **Export Processed Data**:
    - The final tidy dataset, `finalTidyData`, is exported to "tidyData.txt".
