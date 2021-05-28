# Using default settings for svm() from the e1071 package, fit a support vector machine to predict the credit ratings of customers using all of the other variables in
# the dataset.
library(e1071)
svmModel <- svm(credit.rating ~ ., data = training_set)

# Predict the credit rating of a hypothetical median customer, i.e.,
# one with the attributes listed in Table 1. Report decision values as well.

median_value
pred <- predict(svmModel, newdata=median_value)

# Produce the confusion matrix for predicting the credit rating from
# this SVM on the test set, and also report the overall accuracy rate.

cm.svm = table(test_set$credit.rating, predict(svmModel, newdata=test_set, type = "class"))
sum(diag(cm.svm))/sum(cm.svm)

# Automatically or manually tune the SVM to improve prediction
# over that found in 3b. Report the resulting SVM settings and the resulting
# confusion matrix for predicting the test set. (Any amount of improvement is
#                                                acceptable.)

library(ROCR)
svmModel.tune <- tune.svm(credit.rating ~ ., data = training_set, kernel="radial", gamma = 0.0159 * 4^(-2:2), cost = 4^(-2:2))
# svmModel.tune <- tune.svm(credit.rating ~ ., data = training_set, kernel = "radial", gamma = 100^(-5:5), cost = 100^(-5:5))
svmModel.tuned <- svmModel.tune$best.model

summary(svmModel.tune)

cm.svmTuned = table(test_set$credit.rating, predict(svmModel.tuned, newdata=test_set, type = "class"))
cm.svmTuned
sum(diag(cm.svmTuned))/sum(cm.svmTuned)
