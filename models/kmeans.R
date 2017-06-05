# Kmeans

# Our dataset includes number of categorical (or/and ordinal) features. That is
# why we using Gower metric to calculate distance for kmeans algorithm.
D =  daisy(model_data1[selected_features], metric='gower')
km_model = kmeans(D, 2, nstart = 20)

summary(km_model)

# Kmeans is unsupervised learning algorithm. It groups data to two segments (as
# we selected in parameters), but segments names ar "1" and "2" (not "1" and "0")
# so we should try calculate two different performance metrics. Larger will be 
# interpreted as algorithm performance metric.
t = table(km_model$cluster-1, model_data[["Target"]]) 
t
(t[1]+t[4])/(t[1]+t[2]+t[3]+t[4])

t = table( -1*(km_model$cluster - 2), model_data[["Target"]]) 
t
(t[1]+t[4])/(t[1]+t[2]+t[3]+t[4])

res = list()
res[["model"]] = km_model
res[["accuracy"]] = 0.679
RESULTS[["kmeans"]] = res