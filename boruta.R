# Boruta is a feature selection procedure that uses Random Forest variable 
# importance measure by default. This procedure depends on randomly generated 
# numbers (that is why we use set.seed). Since procedure takes about 7 minutes
# code is commented and list of selected variables which was got from boruta is
# hardcoded to variable 'selected feature'.

# set.seed(1)
# boruta.train <- Boruta(Target~., data = model_data1, doTrace = 2)
# 
# # Plot to show feature importance.
# # Blue boxplots correspond to minimal, average and maximum Z score of a shadow
# # attribute. Red, yellow and green boxplots represent Z scores of rejected,
# # tentative and confirmed attributes respectively.
# boruta_importance_plot <- function(boruta_train) {
#   plot(boruta_train, xlab = "", xaxt = "n")
#   lz<-lapply(1:ncol(boruta.train$ImpHistory),function(i)
#     boruta.train$ImpHistory[is.finite(boruta.train$ImpHistory[,i]),i])
#   names(lz) <- colnames(boruta.train$ImpHistory)
#   Labels <- sort(sapply(lz,median))
#   axis(side = 1,las=2,labels = names(Labels),
#        at = 1:ncol(boruta.train$ImpHistory), cex.axis = 0.7)
# }
# boruta_importance_plot(boruta.train)
# 
# # Analysing tentative featares as well.
# final.boruta <- TentativeRoughFix(boruta.train)
# print(final.boruta)
# boruta_importance_plot(final.boruta)
# 
# selected_features = getSelectedAttributes(final.boruta, withTentative = F)


selected_features = c("Variable_7", "Variable_12", "Variable_13",
                      "Variable_14", "Variable_15", "Variable_16",
                      "Variable_19", "Variable_20", "Variable_22",
                      "Variable_23", "Variable_24", "Variable_25",
                      "Variable_27", "Variable_29", "Variable_35",
                      "Variable_37", "Variable_39")

formula = as.formula(paste("Target ~ ", paste(selected_features, collapse=" + "), sep = ""))