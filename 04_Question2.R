# 2 Using default settings, fit a decision tree to the training set predict the credit ratings
# of customers using all of the other variables in the dataset.

# Import rpart library
library(rpart)
library(rpart.plot)

tree <- rpart(credit.rating ~ ., data = dataset)
summary(tree)

# a Report the resulting tree
png("result/2_tree.png")
plot(tree)
text(tree)
dev.off()

png("result/2_tree_rpart.png")
rpart.plot(tree)
dev.off()

