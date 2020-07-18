# Consider the \verb| mtcars| mtcars data set. 
# Fit a model with mpg as the outcome that includes number of cylinders as a factor variable and weight as confounder. 
# Give the adjusted estimate for the expected change in mpg comparing 8 cylinders to 4.


data("mtcars")
x1 <- mtcars$wt
y <- mtcars$mpg

x2 <- factor(x = mtcars$cyl, labels = c(' cyl-4', ' cyl-6', ' cyl-8'))
fit1 <- lm(y ~ x1 + x2)
fit1
summary(fit1)
summary(fit1)$coef[4, 1]


# Consider the mtcars data set. Fit a model with 
# mpg as the outcome that includes number of cylinders as a factor 
# variable and weight as a possible confounding variable. 
# Compare the effect of 8 versus 4 cylinders on mpg for the adjusted 
# and unadjusted by weight models. Here, adjusted means including 
# the weight variable as a term in the regression model and unadjusted 
# means the model without weight included. What can be said about the effect 
# comparing 8 and 4 cylinders after looking at models with and without weight included?.

fit2_wt <- lm(y ~ x1 + x2)
summary(fit2_wt)$coefficients[4, 1]

fit2_nwt <- lm(y ~ x2)
summary(fit2_nwt)$coefficients[3, 1]
# Holding weight constant, cylinder appears to have less of an impact on mpg than if weight is disregarded.



# Consider the \verb|mtcars|mtcars data set. Fit a model with mpg as the outcome 
# that considers number of cylinders as a factor variable and weight as 
# confounder. Now fit a second model with mpg as the outcome model 
# that considers the interaction between number of cylinders (as a factor variable)
# and weight. Give the P-value for the likelihood ratio test comparing the 
# two models and suggest a model using 0.05 as a type I error rate significance benchmark.

y <- mtcars$mpg
x1 <- mtcars$wt
x2 <- factor(x = mtcars$cyl, labels = c('cyl4', 'cyl6', 'cyl8'))
fit3 <- lm(y ~ x1 + x2)
fit3_int <- lm(y ~ x1 * x2)
anova(fit3, fit3_int)[6]
# Pr(>F)
# 1       
# 2 0.1239
# The P-value is larger than 0.05. So, according to our criterion, we would fail to reject, which suggests that the interaction terms is necessary.



# Consider the \verb|mtcars|mtcars data set. Fit a model with mpg as 
# the outcome that includes number of cylinders as a factor variable 
# and weight inlcuded in the model as
lm(mpg ~ I(wt * 0.5) + factor(cyl), data = mtcars)
# How is the wt coefficient interpretted?

# The estimated expected change in MPG per one ton increase in weight for a specific number of cylinders (4, 6, 8).


# Consider the following data set
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)

# Give the hat diagonal for the most influential point
fit5 <- lm(y ~ x)
max(hatvalues(fit5))


# Consider the following data set
x <- c(0.586, 0.166, -0.042, -0.614, 11.72)
y <- c(0.549, -0.026, -0.127, -0.751, 1.344)
# Give the slope dfbeta for the point with the highest hat value.
fit6 <- lm(y ~ x)
dfbetas(fit6)[which.max(hatvalues(fit6)), 2]


# Consider a regression relationship between Y and X with and 
# without adjustment for a third variable Z. Which of the following is
# true about comparing the regression coefficient between Y and X with
# and without adjustment for Z.

# It is possible for the coefficient to reverse sign after adjustment. For example, it can be strongly significant and positive before adjustment and strongly significant and negative after adjustment.