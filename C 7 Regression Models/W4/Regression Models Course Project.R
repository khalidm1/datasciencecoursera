# You work for Motor Trend, a magazine about the automobile industry. 
# Looking at a data set of a collection of cars, they are interested in 
# exploring the relationship between a set of variables and miles 
# per gallon (MPG) (outcome). They are particularly interested in 
# the following two questions:
#         
#               "Is an automatic or manual transmission better for MPG"
#               "Quantify the MPG difference between automatic and manual transmissions"


data("mtcars")
library(ggplot2)
library(dplyr)

auto_mpg <- mtcars %>% select(mpg, am) %>% mutate(am = as.factor(am))
ggplot(data = auto_mpg, aes(x = am, y = mpg)) +
        geom_boxplot() + geom_point() +
        xlab('Transmission (0 = automatic, 1 = manual)') + 
        ylab('Miles/(US) gallon')
# manual transmission has higher mean of miles per gallon

D <- mtcars %>% mutate(cyl = as.factor(cyl), vs = as.factor(vs), am = as.factor(am), gear = as.factor(gear), carb = as.factor(carb))
fit_All <- lm(mpg ~ ., data = D)
summary(fit_All)$coef[, 4]

# p-value less than 5% in the full model

which.max(summary(fit_All)$coef[, 4]) 
fitD <- D %>% select(-cyl); fitRm <- lm(mpg ~ ., data = fitD); summary(fitRm)$coef[, 4]

# Still no coefficients with a significant p-value after removing the cyl variable

which.max(summary(fitRm)$coef[, 4]) #the carb variable
# fitD <- fitD %>% select(-carb); fitRm <- lm(mpg ~ ., data = fitD)

summary(fitRm)$coef[, 4]; which.max(summary(fitRm)$coef[, 4]) #the gear variable
# fitD <- fitD %>% select(-gear); fitRm <- lm(mpg ~ ., data = fitD)

summary(fitRm)$coef[, 4]; which.max(summary(fitRm)$coef[, 4]) #the vs variable
fitD <- fitD %>% select(-vs); fitRm <- lm(mpg ~ ., data = fitD)

summary(fitRm)$coef[, 4]; which.max(summary(fitRm)$coef[, 4]) #the drat variable
fitD <- fitD %>% select(-drat); fitRm <- lm(mpg ~ ., data = fitD)

summary(fitRm)$coef[, 4]; which.max(summary(fitRm)$coef[, 4]) #the disp variable
fitD <- fitD %>% select(-disp); fitRm <- lm(mpg ~ ., data = fitD)

summary(fitRm)$coef[, 4]; which.max(summary(fitRm)$coef[, 4]) #the hp variable
fitD <- fitD %>% select(-hp); fitRm <- lm(mpg ~ ., data = fitD)

summary(fitRm)$coef[, 4]

# p-values less than 0.05. three coefficients, wt, qseq, and Transmission
summary(fitRm)

par(mfrow = c(2, 2))
plot(fitRm)


# The Conclusion:
# the manual one will have an average of 2.9358 higher miles/gallon than the automatic car
