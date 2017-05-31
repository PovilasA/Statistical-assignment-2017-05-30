
# Create data subsets for modeling and for prediction.
pred_data = subset(data, is.na(Target))
model_data = subset(data, !is.na(Target))


## Analysing dataset

# Find number of NAs for each variable of the dataset.
print_number_of_NAs <- function(data) {
  for (name in names(data)) {
    print(paste(
      round(sum(is.na(data[[name]]))/length(data[,1]),2), 
      data_structure[[name]], name
    ))
  }  
}

print_number_of_NAs(model_data)
# It shows that variables _42, _43 and _44 has more than 95% missing values.
# That is why we are not going to use those variables for modeling.
to_remove = c("Variable_42","Variable_43","Variable_44")


# Find number of unique values for each variable of the dataset.
# Without NAs
print_number_of_unique_values <- function(data) {
  for (name in names(Data)) {
    print(paste(
      length(unique(data[[name]][!is.na(data[[name]])])), 
      data_structure[[name]], name
    ))
  }
}

print_number_of_unique_values(model_data)

# We remove variables that has only one unique value.
to_remove = union(to_remove, c("country_id","product_id",
                               "Variable_3","Variable_5"))


