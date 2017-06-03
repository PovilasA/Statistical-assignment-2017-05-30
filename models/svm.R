# Support vector machine (SVM)
library(e1071)

# Selecting optimal tuning parameters (cost and gamma) for SVM.
# This procedure takes a lot of time so it will be commented and values of 
# parameters entered manualy.

# tune.out<-tune(svm, Target ~.,data=train[c(selected_features, "Target")], 
#                kernel="radial", ranges=list(cost=c(0.1,1,2,4,5,6,7,10), 
#                                             gamma=c(.5,1,2,3,4,5)))
# bestmod=tune.out$best.model
# summary(bestmod)
# cost = bestmod$cost
# gamma = bestmod$gamma

cost = 4
gamma = 4

# Radial kernel was chosen for training SVm. It produced the best results
svm_model <- svm(Target ~ ., data=train[c(selected_features, "Target")],
                 kernel='radial', cost=4, gamma=4)
summary(svm_model)
pred <- predict(svm_model, test[c(selected_features, "Target")])
t = table(pred, test$Target)
t
(t[1]+t[4])/(t[1]+t[2]+t[3]+t[4])

res = list()
res[["model"]] = svm_model
res[["accuracy"]] = 0.686
RESULTS[["SVM"]] = res