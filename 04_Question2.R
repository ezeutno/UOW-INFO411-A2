# 2 Using default settings, fit a decision tree to the training set predict the credit ratings
# of customers using all of the other variables in the dataset.

# Import rpart library
library(rpart)
library(rpart.plot)

tree <- rpart(credit.rating ~ ., data = training_set, method = "class")

# a Report the resulting tree
png("result/2_tree.png")
plot(tree)
text(tree)
dev.off()

png("result/2_tree_rpart.png")
rpart.plot(tree)
dev.off()

# b Based on this output, predict the credit rating of a hypothetical
# median customer, i.e., one with the attributes listed in Table 1, showing the
# steps involved.

# predict median value
predict(tree, newdata=median_value, type = "class")

# c Produce the confusion matrix for predicting the credit rating from
# this tree on the test set, and also report the overall accuracy rate.
cm <- table(truth = test_set$credit.rating, prediction=predict(tree, test_set, type = "class"))

cm

sum(diag(cm)/sum(cm))

# What is the numerical value of the gain in entropy corresponding
# to the first split at the top of the tree? (Use logarithms to base 2, and show
# the details of the calculation rather than just providing a final answer.)

print(tree)

# Fit a random forest model to the training set to try to improve
# prediction. Report the R output.

library(randomForest)

# Try to find the best paramter on randomForest

# a=c()
# 
# for (i in 1:50) {
#   tree.rf <- randomForest(credit.rating ~ ., data = training_set,ntree = 200, mtry = i, importance = TRUE,proximity = TRUE)
#   cm.rf <- table(test_set$credit.rating, predict(tree.rf, newdata=test_set, type = "class"))
#   a[i] = sum(diag(cm.rf))/sum(cm.rf)
# }
# 
# png("result/2_rf_tree-diag.png")
# plot(1:50, a)
# dev.off()
# 
# a=c()
# 
# for (i in 1:10) {
#   tree.rf <- randomForest(credit.rating ~ ., data = training_set,ntree = round(((i^3)/1000)*32000), mtry = i, importance = TRUE,proximity = TRUE)
#   cm.rf <- table(test_set$credit.rating, predict(tree.rf, newdata=test_set, type = "class"))
#   a[i] = sum(diag(cm.rf))/sum(cm.rf)
# }
# 
# png("result/2_rf_tree-diag2.png")
# plot(1:10, a)
# dev.off()

tree.rf <- randomForest(credit.rating ~ ., data = training_set,ntree = 200, mtry = 25, importance = TRUE,proximity = TRUE)
tree.rf

png("result/2_rf_tree.png")
plot(tree.rf)
dev.off()

# f.	Produce the confusion matrix for predicting the credit rating from this forest on the test set, and also report the overall accuracy rate.

cm.rf <- table(test_set$credit.rating, predict(tree.rf, newdata=test_set, type = "class"))
cm.rf
sum(diag(cm.rf))/sum(cm.rf)
