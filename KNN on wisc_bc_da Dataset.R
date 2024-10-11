## Collecting the data and Loading Data
wbcd <- read.csv("C:/Users/Hirdesh Kumar Yadav/Downloads/R Predictive Analysis/wisc_bc_data.csv", stringsAsFactors = FALSE)

# Number of rows and column
dim(wbcd)
str(wbcd)
View(wbcd)

## Exploring the data
# Drop the id column
wbcd <- wbcd[-1]
str(wbcd)

wbcd$diagnosis <- factor(wbcd$diagnosis, levels = c("B", "M"),
                         labels = c("Benign", "Malignant"))

table(wbcd$diagnosis)
## Benign   Malignant
## 357        212

View(wbcd)
prop.table(table(wbcd$diagnosis))
## Benign      Malignant 
## 0.6274165   0.3725835 

round(prop.table(table(wbcd$diagnosis)) * 100, digits = 1)
## Benign   Malignant
## 62.7       37.3

## Pre-processing
summary(wbcd[c("radius_mean", "area_mean", "smoothness_mean")])

##   radius_mean       area_mean      smoothness_mean  
##  Min.   : 6.981   Min.   : 143.5   Min.   :0.05263  
##  1st Qu.:11.700   1st Qu.: 420.3   1st Qu.:0.08637  
##  Median :13.370   Median : 551.1   Median :0.09587  
##  Mean   :14.127   Mean   : 654.9   Mean   :0.09636  
##  3rd Qu.:15.780   3rd Qu.: 782.7   3rd Qu.:0.10530  
##  Max.   :28.110   Max.   :2501.0   Max.   :0.16340


## Transformation – normalizing numeric data
# defining a function
normalize <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}

wbcd_n <- as.data.frame(lapply(wbcd[2:31], normalize))
summary(wbcd_n$area_mean)
##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
##  0.0000  0.1174  0.1729  0.2169  0.2711  1.0000


## Data preparation
# Creating training and test data sets
wbcd_train <- wbcd_n[1:469, ]
wbcd_test <- wbcd_n[470:569, ]

## Data Preparation
# Creating training and test labels sets
wbcd_train_labels <- wbcd[1:469, 1]
wbcd_test_labels <- wbcd[470:569, 1]

## Training a model on the data
install.packages('class')
library(class)

# Using KNN
wbcd_test_pred <- knn(train = wbcd_train,
                      test = wbcd_test,
                      cl = wbcd_train_labels,
                      k=21)
wbcd_test_pred
class(wbcd_test_pred)
## [1] "factor"

## Evaluating Model Performance
install.packages('gmodels')
library(gmodels)
CrossTable(x = wbcd_test_labels, 
           y = wbcd_test_pred)

CrossTable(x = wbcd_test_labels, y = wbcd_test_pred,
           prop.chisq=FALSE)

###Output

#Cell Contents
##|-------------------------|
  ##|                       N |
  ##| Chi-square contribution |
  ##|           N / Row Total |
  ##|           N / Col Total |
  ##|         N / Table Total |
  ##|-------------------------|
  
  
  #Total Observations in Table:  100 


#| #wbcd_test_pred 
#wbcd_test_labels |    Benign | Malignant | Row Total | 
  #-----------------|-----------|-----------|-----------|
  #Benign |        77 |         0 |        77 | 
  #|#     4.298 |    16.170 |           | 
  #|     1.000 |     0.000 |     0.770 | 
  #|#     0.975 |     0.000 |           | 
  #|     0.770 |     0.000 |           | 
  #-----------------|-----------|-----------|-----------|
  #Malignant |         2 |        21 |        23 | 
  #|#    14.390 |    54.134 |           | 
  #|     0.087 |     0.913 |     0.230 | 
  #|#     0.025 |     1.000 |           | 
  #|     0.020 |     0.210 |           | 
  #-----------------|-----------|-----------|-----------|
  #Column Total |        79 |        21 |       100 | 
  #|#     0.790 |     0.210 |           | 
  #-----------------|-----------|-----------|-----------|


## Confusion matrix
install.packages('caret')
library(caret)
confusionMatrix(wbcd_test_labels, wbcd_test_pred)

## Confusion Matrix and Statistics
## Reference
## Prediction  Benign Malignant
## Benign        77         0
## Malignant      2        21

## Accuracy : 0.98            
## 95% CI : (0.9296, 0.9976)
## No Information Rate : 0.79            
## P-Value [Acc > NIR] : 2.185e-08       

## Kappa : 0.9418          

## Mcnemar's Test P-Value : 0.4795          
                                          
##             Sensitivity : 0.9747          
##             Specificity : 1.0000          
##          Pos Pred Value : 1.0000          
##          Neg Pred Value : 0.9130          
##              Prevalence : 0.7900          
##          Detection Rate : 0.7700          
##    Detection Prevalence : 0.7700          
##       Balanced Accuracy : 0.9873          
                                          
##        'Positive' Class : Benign 


# Create the confusion matrix for the improved model
tb_improved <- table(wbcd_test_pred, wbcd_test_labels)
print(tb_improved)
##              wbcd_test_labels
## wbcd_test_pred Benign Malignant
## Benign        77         3
## Malignant      0        20

##check the accuracy
accuracy <- function(x){sum(diag(x)/(sum(rowSums(x)))) * 100}

# Check the accuracy for the improved model
accuracy_improved_value <- accuracy(tb_improved)
cat("Improved Accuracy: ", accuracy_improved_value, "%\n")
## Improved Accuracy:  97 %

################################################################################

