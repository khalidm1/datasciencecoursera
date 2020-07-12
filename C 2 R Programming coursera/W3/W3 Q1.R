library(datasets)
data(iris)

mean(subset(iris, Species == 'virginica')$Sepal.Length, na.rm = T)


apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)

with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply( split(mtcars$mpg, mtcars$cyl) , mean)


sapply(split(mtcars$mpg, mtcars$cyl), mean)

round(abs(mean(mtcars[mtcars$cyl == 8, ]$hp) - mean(mtcars[mtcars$cyl == 4, ]$hp)), 0)

debug(ls)
