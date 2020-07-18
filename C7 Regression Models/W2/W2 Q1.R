x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)

# Give a P-value for the two sided hypothesis test of whether ??1
# from a linear regression model is 0 or not.

summary(lm(y ~ x))[4]
# 0.05296439

# give the estimate of the residual standard deviation.
resid(lm(y ~ x))
sum(resid(lm(y ~ x)))
sqrt(sum(resid(lm(y~x))^2) / (length(y) - 2))


# In the ???????????????????????? data set, fit a linear regression model of weight (predictor) on mpg (outcome). Get a 95% confidence interval (formula below) for the expected mpg at the average weight. What is the lower endpoint?
data(mtcars)
y <- mtcars$mpg
x <- mtcars$wt
fit_car <- lm(y ~ x)
predict(fit_car, newdata = data.frame(x = mean(x)), interval = ("confidence"))


# Consider again the ???????????????????????? data set and a linear regression model with mpg as predicted by weight (1,000 lbs). A new car is coming weighing 3000 pounds. Construct a 95% prediction interval (formula below) for its mpg. What is the upper endpoint
predict(fit_car, newdata = data.frame(x = 3), interval = ("prediction"))


# Consider again the ???????????????????????? data set and a linear regression model with mpg as predicted by weight (in 1,000 lbs). A "short" ton is defined as 2,000 lbs. Construct a 95% confidence interval for the expected change in mpg per 1 short ton increase in weight. Give the lower endpoint.
fit_car2 <- lm(mpg ~ I(wt/2), data = mtcars)
confint(fit_car2)[2]


# If my X from a linear regression is measured in centimeters and I convert it to meters what would happen to the slope coefficient?
x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
fit$coef[2] 
# 0.7224211 

fit$coef[2] * 100


# I have an outcome, Y, and a predictor, X and fit a linear regression model with Y=??0+??1X+?? to obtain ??^0 and ??^1. 
# What would be the consequence to the subsequent slope and intercept if I were to refit the model with a new regressor, X+c for some constant, c?

x <- c(0.61, 0.93, 0.83, 0.35, 0.54, 0.16, 0.91, 0.62, 0.62)
y <- c(0.67, 0.84, 0.6, 0.18, 0.85, 0.47, 1.1, 0.65, 0.36)
fit <- lm(y ~ x)
fit$coef

x_con <- x + 10
fit_con <- lm(y ~ x_con)
fit_con$coef

# Refer back to the mtcars data set with mpg as an outcome and weight (wt) as the predictor. 
# About what is the ratio of the the sum of the squared errors,

x <- mtcars$wt
y <- mtcars$mpg
fit_car <- lm(y ~ x)
sum(resid(fit_car)^2) / sum((y - mean(y)) ^ 2)


# Do the residuals always have to sum to 0 in linear regression?
