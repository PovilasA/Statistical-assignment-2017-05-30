## Lasso Logistic Regression
set.seed(1)

# glmnet only accepts matrices as a data input.
xfactors <- model.matrix(formula, data = train)[, -1]
x <- as.matrix(data.frame(xfactors))

cv.lasso <- cv.glmnet(x, train[["Target"]], family='binomial')

# Results
plot(cv.lasso)
cv.lasso$lambda.min
# Equals to 0.0032

xfactors <- model.matrix(formula, data = test)[, -1]
newx <- as.matrix(data.frame(xfactors))

fitted.results = predict(cv.lasso, s=cv.lasso$lambda.min, newx, type="response")

# Trying different cutoff probabilities
print_accuracy_for_different_cutoff(fitted.results, test$Target)
# We can see that 0.5 cutoff gives maximum accuracy which is 0.689.
# It is only slightly better performance than simple Logistic regression.
