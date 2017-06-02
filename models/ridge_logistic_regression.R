## Ridge Logistic Regression

library(glmnet)
set.seed(100)

# glmnet only accepts matrices as a data input.
xfactors <- model.matrix(formula, data = train)[, -1]
x <- as.matrix(data.frame(xfactors))

# cv.glmnet makes k-fold cross-validation for glmnet, produces a plot, and 
# results for different lambdas
cv.ridge <- cv.glmnet(x, train[["Target"]], family="binomial")

# Results
plot(cv.ridge)

# value of lambda that gives minimum mean cross-validated error.
cv.ridge$lambda.min
# Equals to 0.0035. Since it is close to zero we may guess that it will not make
# big impact to prediction.

xfactors <- model.matrix(formula, data = test)[, -1]
newx <- as.matrix(data.frame(xfactors))
fitted.results = predict(cv.ridge, s=cv.ridge$lambda.min, newx, type="response")

# Trying different cutoff probabilities
print_accuracy_for_different_cutoff(fitted.results, test$Target)
# We can see that 0.5 cutoff gives maximum accuracy which is 0.687.
# It is slightly worse performance than simple Logistic regression.


res = list()
res[["model"]] = cv.lasso
res[["accuracy"]] = 0.687
RESULTS[["ridge_logistic_regression"]] = res