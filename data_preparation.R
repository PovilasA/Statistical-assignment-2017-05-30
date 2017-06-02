
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

# Plot to illustrate missing values
library(Amelia)
missmap(model_data, main = "Missing values vs observed")


# Find number of unique values for each variable of the dataset.
# Without NAs
print_number_of_unique_values <- function(data) {
  for (name in names(data)) {
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

# Some date variables alse has more than 50% missing values.
# Maybe those variables should be removed too.
to_remove = union(to_remove, c("due_date","paid_date","first_status_day_date",
                               "arrived_date", "first_status"))

# customer_id is also not important for modeling.
to_remove = union(to_remove, c("customer_id"))

# Removing non-important variables.
model_data1 = model_data[,setdiff(names(model_data), to_remove)]

# Checking missing values once again.
missmap(model_data1, main = "Missing values vs observed")
print_number_of_NAs(model_data1)
print_number_of_unique_values(model_data1)




