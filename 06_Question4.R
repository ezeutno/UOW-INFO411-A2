# Fit the Naive Bayes model to predict the credit ratings of customers using all of
# the other variables in the dataset.

library(e1071)
nbModel <- naiveBayes(credit.rating ~ ., data = training_set)

summary(nbModel)

# Predict the credit rating of a hypothetical median customer, i.e.,
# one with the attributes listed in Table 1. Report predicted probabilities as
# well.

# median_value
pred <- predict(nbModel, newdata=median_value)
pred

# Reproduce the first 20 or so lines of the R output for the Naive Bayes
# fit, and use them to explain the steps involved in making this prediction.

nbModel

# Produce the confusion matrix for predicting the credit rating using
# Naive Bayes on the test set, and also report the overall accuracy rate.
cm.nB = table(test_set$credit.rating, predict(svmModel.tuned, newdata=test_set, type = "class"))
cm.nB
sum(diag(cm.nB))/sum(cm.nB)
