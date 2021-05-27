# 2 Using default settings, fit a decision tree to the training set predict the credit ratings
# of customers using all of the other variables in the dataset.

# Import rpart library
library(rpart)
library(rpart.plot)

tree <- rpart(credit.rating ~ ., data = training_set, method = "class")
summary(tree)

# a Report the resulting tree
png("result/2_tree.png")
plot(tree)
text(tree)
dev.off()

png("result/2_tree_rpart.png")
rpart.plot(tree)
dev.off()

# b Based on this output, predict the credit rating of a hypothetical
# “median” customer, i.e., one with the attributes listed in Table 1, showing the
# steps involved.

median_value <- apply(test_set,2,median)

# Switch it into dataframe & transpose for prediction
median_value <- as.data.frame(t(median_value))

median_value$credit.rating

# predict median value
predict(tree, newdata=median_value, type = "class")

# c Produce the confusion matrix for predicting the credit rating from
# this tree on the test set, and also report the overall accuracy rate.
cm <- table(truth = test_set$credit.rating, prediction=predict(tree, test_set, type = "class"))

cm

sum(diag(cm)/sum(cm))
