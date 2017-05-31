
# Create data subsets for modeling and for prediction.
pred_data = subset(data, is.na(Target))
model_data = subset(data, !is.na(Target))


## Analysing dataset

# Find number of NAs for each variable of the dataset.
print_number_of_NAs <- function(data) {
  for (name in names(data)) {
    print(paste(
      round(sum(is.na(data[[name]]))/length(data[,1]),2), data_structure[[name]], name
    ))
  }  
}

print_number_of_NAs(model_data)
# It shows that variables _42, _43 and _44 has more 95 percent missing values.
# That is why we are not going to use those variables for modeling.

