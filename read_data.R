data <- read.csv("Assignment_Data.csv", sep=";")
data_structure = read.csv("data_structure.csv")

# Different date variable has a different date structure.
# Here we specify correct date format for each date variable.
dates_structure = list(
  "due_date" = "%m/%d/%Y",
  "first_status_day_date" = "%m/%d/%Y",
  "first_status_time_of_day" = "%m/%d/%Y %H:%M:%S",
  "first_status" = "%m/%d/%Y %H:%M:%S",
  "paid_date" = "%m/%d/%Y",
  "arrived_date" = "%m/%d/%Y %H:%M",
  "Variable_42" = "%m/%d/%Y",
  "Variable_43" = "%m/%d/%Y",
  "Variable_44" = "%m/%d/%Y"
)

# first_status_day_date and first_status_time_of_day might be useful variables
# for analysis but combinations of those two variables might be useful as well.
data[["first_status"]] = paste(data[["first_status_day_date"]],
                               data[["first_status_time_of_day"]])

# Valid time format for specific variable. We add random date next to the time.
data[["first_status_time_of_day"]] = paste('2017-06-01', 
                                           data[["first_status_time_of_day"]])

for (name in setdiff(names(data), "first_status")) {
  if (data_structure[[name]] %in% c('Ordinal','Categorical','Binary','ID')) {
    data[[name]] = as.factor(data[[name]])  
  } 
  else if (data_structure[[name]] %in% c('Numeric')) {
    data[[name]] = as.numeric(data[[name]])
  }
  else if (data_structure[[name]] %in% c('Date')) {
    data[[name]] = as.Date(data[[name]], dates_structure[[name]])
  }
}

