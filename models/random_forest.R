# Random Forest

library(randomForest)
x <- cbind(train[c(selected_features, "Target")])

rf.fit <- randomForest(Target ~ ., x,ntree=500)
summary(rf.fit)
pred = predict(rf.fit,test[selected_features])

t = table( pred, test$Target) 
t
(t[1]+t[4])/(t[1]+t[2]+t[3]+t[4])

res = list()
res[["model"]] = rf.fit
res[["accuracy"]] = 0.684
RESULTS[["random_forest"]] = res


# Random forest with more variables.
# Since random forest algorithm can get good results with unimportant features
# included to training set we will try to train this algorithm again but now
# with all features.

x <- train[, !(colnames(train) %in% c("Variable_6")), drop=FALSE]
xnew <- test[, !(colnames(test) %in% c("Variable_6")), drop=FALSE]

rf.fit <- randomForest(Target ~ ., x,ntree=500)
summary(rf.fit)
pred = predict(rf.fit, xnew)

t = table( pred, xnew$Target) 
t
(t[1]+t[4])/(t[1]+t[2]+t[3]+t[4])


res = list()
res[["model"]] = rf.fit
res[["accuracy"]] = 0.674
RESULTS[["random_forest_more_features"]] = res