# Statistical-assignment-2017-05-30

This assignment was made using R statistical package. To run this project you just need to run `main.R` file. This file
is a wrapper for 5 main parts of this assignment:

- **Reading and cleaning given dataset.**

- **Preparing data for modeling**

  Main problem here was feature selection. Since dataset contains more than 50 variables it was important to select 
  only those that are really relevant for prediction. I decided to use R package [`boruta`](https://cran.r-project.org/web/packages/Boruta/Boruta.pdf)
  for that. This package finds relevant features by comparing original attributes importance with importance achievable
  at random, estimated using their permuted copies.

- **Modeling**

  6 different models were tried to fit the data:
  - Logistic regression
  - Ridge logistic regression
  - Lasso logistic regression
  - Support Vector Machine
  - Kmeans
  - Random Forrest
  Accuracy of all models were average (nearly 70 %). Interesting (and maybe strange) that all models returned very similar
  (in terms of accuracy) results but the first tried was the best one. It was Logistic regression whose performance was about 69 %.
  
- **Model evaluation**

  Models were evaluated using simple accuracy metric (counting how many predictions were correct). Also for some models some
  additional methods were used such as ROC curve, ANOVA test and others.
  
- **Prediction**

  Logistic regression was used to make final prediction. Predictions were stored in variables `prob_prediction` and 
  `binary_prediction` and also returned in file `predicted_data.csv` which is stored in `data` directory.
  
## Usage
  
Open an empty R workspace file `assignment.RData` and run file `main.R`.
