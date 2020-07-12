set.seed(1)
rpois(5, 2)


set.seed(10)
x <- rep(0:1, each = 5)
x
e <- rnorm(10, 0, 20)
e
y <- 0.5 + 2 * x + e
y



