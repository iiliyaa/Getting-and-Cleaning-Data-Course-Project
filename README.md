# Getting-and-Cleaning-Data-Course-Project

## Human Activity Recognition Using Smartphones Dataset Analysis

This repository contains the R script and documentation for the data cleaning of the "Human Activity Recognition Using Smartphones" dataset.

### Dataset

The dataset represents data collected from the accelerometers and gyroscopes of Samsung Galaxy S smartphones worn by 30 subjects performing activities like walking, laying, and standing.

Original dataset source: [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Files

- `run_analysis.R`: This R script is used to clean the original dataset and produce a tidy dataset.
  
- `CodeBook.md`: A code book that describes the variables, the data, and any transformations performed to clean up the data.

- `tidyData.txt`: The cleaned dataset produced by the `run_analysis.R` script.

### How `run_analysis.R` works:

1. **Loading required libraries**: The dplyr library is loaded to facilitate data manipulation operations.

2. **Loading datasets**: The datasets are loaded into R using the `read.table` function.

3. **Merging datasets**: Training and test datasets are merged using `cbind` for column-wise binding and `rbind` for row-wise binding.

4. **Extracting relevant data**: Only measurements on the mean and standard deviation are extracted.

5. **Descriptive activity names**: Activity codes are replaced with descriptive activity names.

6. **Descriptive variable names**: Variable names are modified for clarity and descriptiveness.

7. **Averaging dataset**: Averages of each variable for each activity and subject are computed.

8. **Exporting tidy dataset**: The final cleaned dataset is exported to `tidyData.txt`.

### Using the script

1. Ensure that you have the `dplyr` library installed in R.
   
2. Set your working directory in R to where the dataset is located.

3. Execute the `run_analysis.R` script.

4. Upon successful execution, the `tidyData.txt` file will be generated in your working directory.

### Code Book

Please refer to `CodeBook.md` for a comprehensive description of the dataset, including details about the data source, transformations, and variable descriptions.
