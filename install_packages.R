# Install R packages that are not installed already.

# Array of packages that are required for a project.
list.of.packages <- c("Amelia","ROCR","cluster","randomForest","glmnet","e1071")

# Finding packages that are not installed already.
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]

# Installing new packages.
if(length(new.packages)) install.packages(new.packages)

# Load all packages
lapply(list.of.packages, library, character.only = TRUE)
