# 1 Write the code to split the dataset into 50% training set and 50% test
# set and only include the data with known ratings.

dataset = read.csv("creditworthiness.csv")

dataset = dataset[dataset$credit.rating!=0, ]

# dataset$credit.rating <- as.factor(dataset$credit.rating)

nrow(dataset)

library(caTools)
split = sample.split(dataset$credit.rating, SplitRatio = 0.5)

training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

length(training_set)
nrow(training_set)
length(test_set)
nrow(test_set)

str(dataset)
median_value = data.frame("functionary" = 0,"re-balanced (paid back) a recently overdrawn current acount" = 1,"FI3O credit score" = 1,"gender" = 0,"0. accounts at other banks" = 3,"credit refused in past?" = 0,"years employed" = 3,"savings on other accounts" = 3,"self employed?" = 0,"max. account balance 12 months ago" = 3,"min. account balance 12 months ago" = 3,"avrg. account balance 12 months ago" = 3,"max. account balance 11 months ago" = 3,"min. account balance 11 months ago" = 3,"avrg. account balance 11 months ago" = 3,"max. account balance 10 months ago" = 3,"min. account balance 10 months ago" = 3,"avrg. account balance 10 months ago" = 3,"max. account balance 9 months ago" = 3,"min. account balance 9 months ago" = 3,"avrg. account balance 9 months ago" = 3,"max. account balance 8 months ago" = 3,"min. account balance 8 months ago" = 3,"avrg. account balance 8 months ago" = 3,"max. account balance 7 months ago" = 3,"min. account balance 7 months ago" = 3,"avrg. account balance 7 months ago" = 3,"max. account balance 6 months ago" = 3,"min. account balance 6 months ago" = 3,"avrg. account balance 6 months ago" = 3,"max. account balance 5 months ago" = 3,"min. account balance 5 months ago" = 3,"avrg. account balance 5 months ago" = 3,"max. account balance 4 months ago" = 3,"min. account balance 4 months ago" = 3,"avrg. account balance 4 months ago" = 3,"max. account balance 3 months ago" = 3,"min. account balance 3 months ago" = 3,"avrg. account balance 3 months ago" = 3,"max. account balance 2 months ago" = 3,"min. account balance 2 months ago" = 3,"avrg. account balance 2 months ago" = 3,"max. account balance 1 months ago" = 3,"min. account balance 1 months ago" = 3,"avrg. account balance 1 months ago" = 3)