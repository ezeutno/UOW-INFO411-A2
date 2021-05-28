# Fit the Naive Bayes model to predict the credit ratings of customers using all of
# the other variables in the dataset.

library(e1071)
nbModel <- naiveBayes(credit.rating ~ ., data = training_set)

# Predict the credit rating of a hypothetical median customer, i.e.,
# one with the attributes listed in Table 1. Report predicted probabilities as
# well.

median_value
pred <- predict(nbModel, newdata=median_value)
pred