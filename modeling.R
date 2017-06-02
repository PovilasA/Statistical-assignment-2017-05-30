# setting seed for reproducibility.
set.seed(1)
# Indices for training set and test set. We take 70% of the data for training.
train_indices = sample(1:length(model_data1[,1]), length(model_data1[,1])*0.7)
test_indices = setdiff(1:length(model_data1[,1]), train_indices)

train = model_data1[train_indices,]
test = model_data1[test_indices,]

# Run procedure to select variables for modeling. This creates variables
# 'selected_variables' (vector of selected variables) and 
# 'formula'(formula with selected features used for modeling).
source('boruta.R')
