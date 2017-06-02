## Logistic regression

model <- glm(formula, family=binomial(link='logit'), data=train)

# we run the anova() to analyze the table of deviance.
anova(model, test="Chisq")
# The difference between the null deviance and the residual deviance shows how
# our model is doing against the null model (a model with only the intercept).
# The wider this gap, the better.

fitted.results <- predict(model, newdata=test[selected_features], type='response')

# Trying different cutoff probabilities
print_accuracy_for_different_cutoff(fitted.results, test$Target)
# We can see that 0.5 cutoff gives maximum accuracy which is 0.69

ROC(model, test)
# AUC is equal to 0.67