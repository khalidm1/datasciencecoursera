# Consider the space shuttle data shuttle in the MASS library. 
# Consider modeling the use of the autolander as the outcome 
# (variable name \verb|use|use). Fit a logistic regression model with 
# autolander (variable auto) use (labeled as "auto" 1) versus not (0) 
# as predicted by wind sign (variable wind). Give the estimated odds 
# ratio for autolander use comparing head winds, labeled as "head" in 
# the variable headwind (numerator) to tail winds (denominator).

library(MASS)
data(shuttle)
fit1 <- glm(shuttle$use ~ shuttle$wind, family = 'binomial')
#slope is modeled in log scale (log odds ratio)
exp(fit1$coef[2])


# Consider the previous problem. Give the estimated odds ratio for 
# autolander use comparing head winds (numerator) to tail winds 
# (denominator) adjusting for wind strength from the variable magn.
fit2 <- glm(shuttle$use ~ shuttle$wind + shuttle$magn, family = 'binomial')
exp(fit2$coef[2])


# If you fit a logistic regression model to a binary variable, 
# for example use of the autolander, then fit a logistic regression 
# model for one minus the outcome (not using the autolander) what 
# happens to the coefficients?

fit3 <- glm(shuttle$use ~ shuttle$wind, family = 'binomial')
fit3$coef
head(shuttle$use)
useRev <- relevel(shuttle$use, ref = 'noauto')
head(useRev)
fit3_2 <- glm(useRev ~ shuttle$wind, family = 'binomial')
fit3_2$coef


# Consider the insect spray data InsectSprays. 
# Fit a Poisson model using spray as a factor level. 
# Report the estimated relative rate comapring spray A (numerator) 
# to spray B (denominator).
data("Insurance")
fit4 <- lm(I(log(InsectSprays$count + 1)) ~ as.factor(InsectSprays$spray))
exp(fit4$coef[1]) / exp(fit4$coef[1] + fit4$coef[2])


# Consider a Poisson glm with an offset, tt. So, for example, 
# a model of the form glm(count ~ x + offset(t), family = poisson) 
# glm(count ~ x + offset(t), family = poisson) where x is a factor 
# variable comparing a treatment (1) to a control (0) and \verb t is 
# the natural log of a monitoring time. What is impact of the coefficient
# for x if we fit the model glm(count ~ x + offset(t2), family = poisson)
# glm(count ~ x + offset(t2), family = poisson) where 2 <- log(10) + 
# t 2 <- log(10) + t? In other words, what happens to the coefficients
# if we change the units of the offset variable. (Note, adding log(10)
# on the log scale is multiplying by 10 on the original scale.)

# The coefficient estimate is unchanged


# Consider the data
x <- -5:5
y <- c(5.12, 3.93, 2.67, 1.87, 0.52, 0.08, 0.93, 2.05, 2.54, 3.87, 4.97)
# Using a knot point at 0, fit a linear model that looks like a 
# hockey stick with two lines meeting at x=0. Include an intercept 
# term, x and the knot point term. What is the estimated slope of the line after 0?
X <- (x > 0) * x
fit6 <- lm(y ~ x + X)
sum(fit6$coef[2:3])
