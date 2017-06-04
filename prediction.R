
# RESULTS = list("aaa"=1, "bbb"=1)
# res = list()
# res[["accuracy"]] = 0.689
# RESULTS[["aaa"]] = res
# res = list()
# res[["accuracy"]] = 0.6489
# RESULTS[["bbb"]] = res

for (algorithm in names(RESULTS)){
  print(paste(algorithm, RESULTS[[algorithm]][["accuracy"]]))
}

# All algorithms produced similar results. We will use logistic regression to 
# make a final prediction for a given dataset.

pred_model = RESULTS[["logistic_regression"]][["model"]]

# We make predictions using selected model.
prob_prediction = predict(pred_model, newdata=pred_data, type='response')

# These prediction are probabilities. Finally we make binary predictions. Using
# 0.5 cutoff. This was selected as the best option while training the model.
binary_prediction = ifelse(prob_prediction > 0.5,1,0)
