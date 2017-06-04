# This file is a wrapper of all files needed to make a prediction for target
# variable.

# Installs and loads all packages needed for analysis
source('install_packages.R')

# Read data from the file and make some initial changes in the dataset.
source('read_data.R')

# Prepare data by removing irrelevant descriptive features and get some insights
# about given dataset.
source('data_preparation.R')

# Some common functions used for model evaluation.
source('model_evaluation.R')

# Modeling part runs all the algorithms, calculates its performance and collects
# it to RESULTS variable.
source('modeling.R')

# Returns results for all algorithms and makes a prediction for given dataset
# using best available model.
source('prediction.R')

# Variables 'prob_prediction' and 'binary_prediction' contains final prediction
# for given Target variable

# Extract dataset with final prediction to file.
pred_data["Target"] = binary_prediction
write.csv(pred_data, file = "data/predicted_data.csv")

