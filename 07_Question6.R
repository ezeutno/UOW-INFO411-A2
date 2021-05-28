training_set_6 <- training_set
test_set_6 <- test_set

# levels(training_set_6$credit.rating)[] <- c(0,1)
# levels(test_set_6$credit.rating)[] <- c(0,1)
# 
# training_set_6$credit.rating[training_set_6$credit.rating != 1] = 0
# test_set_6$credit.rating[test_set_6$credit.rating != 1] = 0

lmModel <- lm(credit.rating ~ ., training_set_6)

lmModel

summary(lmModel)
