install.packages("nlme")
install.packages("lattice")

library(nlme)
library(lattice)

plot <- xyplot(weight ~ Time | Diet,BodyWeight)
class(plot)

xyplot(weight ~ Time | Diet, BodyWeight)

library(lattice)
library(datasets)
data(airquality)
p <- xyplot(Ozone ~ Wind | factor(Month), data = airquality)

p

library(datasets)
data(airquality)

airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month)

install.packages("ggplot2movies")
library(ggplot2)
library(ggplot2movies)
g <- ggplot(movies, aes(votes, rating))
print(g)


qplot(votes, rating, data = movies) + geom_smooth()
