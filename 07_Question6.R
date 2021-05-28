library(e1071)

training_set_6 <- training_set
test_set_6 <- test_set

training_set_6$credit.rating <- factor(training_set_6$credit.rating,levels = c(1,2,3), labels=c(1,0,0))
training_set_6$credit.rating <- sapply(training_set_6$credit.rating, as.integer)
test_set_6$credit.rating <- factor(test_set_6$credit.rating,levels = c(1,2,3), labels=c(1,0,0))
test_set_6$credit.rating <- sapply(test_set_6$credit.rating, as.integer)

# Fit a logistic regression model to predict whether a customer gets a credit rating of A using all of the other variables in the dataset, with no interactions

lmModel <- lm(credit.rating ~ ., training_set_6)

lmModel

# Report the summary table of the logistic regression model fit. 
summary(lmModel)

# Fit an SVM model of your choice to the training set. 
svmModel2 <- svm(credit.rating ~ ., training_set_6)

# Produce an ROC chart comparing the logistic regression and the SVM results of predicting the test set. Comment on any differences in their performance. 

pred.svm.full <- predict(svmModel2, test_set_6, type="class")
pred.lm.full <- predict(lmModel, test_set_6)

library(ROCR)

svm.full <- prediction(pred.svm.full, training_set_6$credit.rating == 1)
perf.svm.full <- performance(svm.full, "tpr", "fpr")
lm.full <- prediction(pred.lm.full, training_set_6$credit.rating == 1)
perf.lm.full <- performance(lm.full, "tpr", "fpr")

png("result/6_roc.png")
plot(perf.svm.full, col = 2)
plot(perf.lm.full,add = TRUE, col =3)
abline(0, 1)
legend("bottomright", c("SVM", "LM"), lty = 1,col = 2:3)
dev.off()