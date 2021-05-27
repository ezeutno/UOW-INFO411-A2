# 1 Write the code to split the dataset into 50% training set and 50% test
# set and only include the data with known ratings.

dataset = read.csv("creditworthiness.csv")

dataset = dataset[dataset$credit.rating!=0, ]

nrow(dataset)

library(caTools)
split = sample.split(dataset$credit.rating, SplitRatio = 1/2)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

length(training_set)
nrow(training_set)
length(test_set)
nrow(test_set)