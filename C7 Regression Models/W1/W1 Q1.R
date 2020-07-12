X <- c(0.18, -1.54, 0.42, 0.95)
W <- c(2, 1, 3, 1)

# Give the value of ?? that minimizes the least squares equation
sum(X * W) / sum(W)


x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

# Fit the regression through the origin and get the slope treating y
lm(y ~ x - 1)



# Do data(mtcars) from the datasets package and fit the regression
# 
# model with mpg as the outcome and weight as the predictor. Give
# 
# the slope coefficient.

data("mtcars")
lm(mtcars$mpg ~ mtcars$wt)


# Consider data with an outcome (Y) and a predictor (X). 
# The standard deviation of the predictor is one half that of the outcome.
# The correlation between the two variables is .5. 
# What value would the slope coefficient for the regression model 
# with Y as the outcome and X as the predictor?
corr <- 0.5
sd_y <- 1 / 0.5 
slope_coefficient <- corr * sd_y
slope_coefficient

# Students were given two hard tests and scores were normalized 
# to have empirical mean 0 and variance 1. The correlation between 
# the scores on the two tests was 0.4. What would be the expected 
# score on Quiz 2 for a student who had a normalized score of 1.5 on Quiz 1?

corYX <- 0.4
normalized_score <- 1.5

slope1 <- corYX  
slope2 <- 0

expected_score <- slope2 + slope1 * normalized_score
expected_score


x <- c(8.58, 10.46, 9.01, 9.64, 8.86)
# What is the value of the first measurement if x were normalized (to have mean 0 and variance 1)?
(x - mean(x)) / sd(x) #Value for all mesurements
(x[1] - mean(x))/sd(x) #Value for the first measurement


# Consider the following data set (used above as well). 
# What is the intercept for fitting the model with x as the predictor and y as the outcome?

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
y <- c(1.39, 0.72, 1.55, 0.48, 1.19, -1.59, 1.23, -0.65, 1.49, 0.05)

inter_fit_model <- lm(y ~ x)
inter_fit_model
inter_fit_model$coefficients


# You know that both the predictor and response have mean 0. What
# can be said about the intercept when you fit a linear regression?

# It must be identically 0.

x <- c(0.8, 0.47, 0.51, 0.73, 0.36, 0.58, 0.57, 0.85, 0.44, 0.42)
# What value minimizes the sum of the squared distances between these points and itself?

mean(x)


# Let the slope having fit Y as the outcome and X as the predictor be denoted as ??1 
# Let the slope from fitting X as the outcome and Y as the predictor be denoted as ??1 
# Suppose that you divide ??1 / ??1 in other words consider ??1/??1 What is this ratio always equal to?

# beta1 = cor(Y, X)*(sd(Y)/sd(X))
# gama1 = cor(X, Y)*(sd(X)/sd(Y))
# beta1/gama1 = (sd(Y)*sd(Y))/(sd(X)*sd(X)) = Var(Y)/Var(X)