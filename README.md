# KNN-Breast-Cancer-Prediction
This project uses the K-Nearest Neighbors (KNN) algorithm to classify breast cancer tumors as benign or malignant based on the Breast Cancer Wisconsin dataset. It includes data normalization, model training, and evaluation, demonstrating KNN's application in healthcare analytics and predictive modeling.


# KNN Breast Cancer Prediction

## Description
This project implements the K-Nearest Neighbors (KNN) classification model to predict breast cancer diagnoses using the Breast Cancer Wisconsin dataset. It includes data preprocessing, model training, and performance evaluation, showcasing the effectiveness of KNN in medical diagnostics.

## Dataset
The dataset used in this project is the **Breast Cancer Wisconsin (Diagnostic) dataset**. It can be found in the **wisc_bc_data.csv** file included in this repository. This dataset consists of 569 instances and 32 attributes, where each instance represents a tumor sample, and the attributes include various measurements of the tumors.

### Data Attributes:
- `id`: Unique identifier for each sample
- `diagnosis`: Diagnosis of the tumor (M = malignant, B = benign)
- Other numerical features related to the tumor's characteristics (e.g., radius, texture, perimeter, area, etc.)

The dataset can also be accessed from the UCI Machine Learning Repository:
[Breast Cancer Wisconsin (Diagnostic) Dataset](https://archive.ics.uci.edu/ml/datasets/Breast+Cancer+Wisconsin+(Diagnostic))

## How to Run the Code
1. **Install R**: Make sure you have R installed on your machine. You can download it from [CRAN](https://cran.r-project.org/).

2. **Install the necessary R packages**:
   Open R and run the following commands to install the required packages:
   ```R
   install.packages("class")
   install.packages("gmodels")


# Dependencies
*This project requires the following R packages:*

> class: For implementing the KNN algorithm.
> gmodels: For evaluating the model's performance.
