# Vectors
x <- c(1, 2, 3)
x

x <- vector(1, 2, 3)
x

x <- vector("numeric", length = 10) #default value for numeric is 0
x

# as to change types
x <- 2:7
x

typeof(x)
class(x)
as.logical(x)
as.character(x)
as.numeric(x)
as.complex(x)
# end




# LIST
x <- list(1, 'a', TRUE, 1, 4i)
x

x <- list(a = 1, b = 'a', c = TRUE, 1, 4i)
x
# end

# Matrices
x <- matrix(nrow = 2, ncol = 3)
x

dim(x)


attributes(x)

x <- matrix(1:6, nrow = 2, ncol = 3)
x
dimnames(x) <- list(c('row1', 'row2'), c('col1', 'col2', 'col3'))
x


x <- 1:10
x
dim(x) <- c(2, 5)
x


x <- 1:10
y <- 3:7
cbind(x, y)
rbind(x, y)
# end

# Factors
x <- factor(c('1', '1', '2'))
x
table(x)
unclass(x)
class(x)
typeof(x)



x <- factor(c(1:5))
x            
table(x)
unclass(x)
class(x)
typeof(x)




x <- factor(c('YES', 'YES', 'yes', 'NO', 'TRUE', 'FLASE'))
x
table(x)
unclass(x)
class(x)
typeof(x)


x <- factor(c('YES', 'YES', 'yes', 'NO', 'TRUE', 'FLASE'), levels = c('YES', 'NO'))
x


x <- factor(c('YES', 'YES', 'YES', 'NO', 'NO', 'YES'), levels = c('YES', 'NO'))
x
# end



# Missing Values
x <- c(1, 2, NA, 10, NA, 5, NaN, 3, 3)
is.na(x)
is.nan(x)
# end



# Reading Data
# Tabular data
x <- data.frame(col1 = 1:3, col2 = 4:6)
x
nrow(x)
ncol(x)

x <- data.frame(col1 = 1:3, col2 = c(3, 4, 5))
x
names(x)
nrow(x)
ncol(x)
# end

