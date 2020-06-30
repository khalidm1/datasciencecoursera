x <- 4L
class(x)
x <- c(4, "a", TRUE)
class(x)
x <- c(1,3, 5)
y <- c(3, 2, 10)
cbind(x, y)
x <- list(2, "a", "b", TRUE)
x
class(x[[1]])


x <- 1:4
y <- 2:3

x + y
class(x + y)

x <- c(3, 5, 1, 10, 12, 6)
x[x < 6] <- 0
x


install.packages("data.table")
library("data.table")

# Reading in data
quiz_data <- fread('C:/Users/khali/Desktop/Data Science/Big Data/R Programming coursera/W1/quiz1_data/hw1_data.csv')

# Column names of the dataset 
names(quiz_data)

# First two rows 
quiz_data[c(1,2),]

head(quiz_data, 2)

nrow(quiz_data)

tail(quiz_data, 2)

# the value of Ozone in the 47th row
quiz_data[47, 'Ozone']

# missing values are in the Ozone column of this data frame
# Going back to data.frame because dont it hasnt been taught yet in this specialization
quiz_data = read.csv('C:/Users/khali/Desktop/Data Science/Big Data/R Programming coursera/W1/quiz1_data/hw1_data.csv')
sub = subset(quiz_data, is.na(Ozone))
nrow(sub)
# remmove Missing Values using Something like This
quiz_data[complete.cases(quiz_data),]

quiz_data = read.csv('C:/Users/khali/Desktop/Data Science/Big Data/R Programming coursera/W1/quiz1_data/hw1_data.csv')
sub = subset(quiz_data, !is.na(Ozone), select = Ozone)
apply(sub, 2, mean)


# Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset
quiz_data = read.csv('C:/Users/khali/Desktop/Data Science/Big Data/R Programming coursera/W1/quiz1_data/hw1_data.csv')
sub = subset(quiz_data, Ozone > 31 & Temp > 90, select = Solar.R)
apply(sub, 2, mean)

# the mean of "Temp" when "Month" is equal to 6
quiz_data = read.csv('C:/Users/khali/Desktop/Data Science/Big Data/R Programming coursera/W1/quiz1_data/hw1_data.csv')
sub = subset(quiz_data, Month == 6, select = Temp)
apply(sub, 2, mean)


# the maximum ozone value in the month of May (i.e. Month = 5)
quiz_data = read.csv('C:/Users/khali/Desktop/Data Science/Big Data/R Programming coursera/W1/quiz1_data/hw1_data.csv')
sub = subset(quiz_data, Month == 5 & !is.na(Ozone), select = Ozone)
apply(sub, 2, max)
