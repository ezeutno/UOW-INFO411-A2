dataset = read.csv("creditworthiness.csv")

library(caTools)

split = sample.split(dataset$functionary, SplitRatio = 0.5)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

head(training_set)
head(test_set)