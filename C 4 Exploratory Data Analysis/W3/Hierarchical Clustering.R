set.seed(1234)
par(mar = c(0, 0, 0, 0))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1, 2, 1), each = 4), sd = 0.2)

plot(x)
plot(x, y)
plot(x, y, col = 'blue')
plot(x, y, col = 'blue', pch = 19)
plot(x, y, col = 'blue', pch = 19, cex = 2)

text(x + 0.05)
text(x + 0.05, y + 0.05)
text(x + 0.05, y + 0.05, labels = as.character(1:12))

# we took the points X & Y and put them in a data frame and calculate the distance 
# between them
dataFrame <- data.frame(x = x, y = y)
dist(dataFrame)
distxy <- dist(dataFrame)
hClustering <- hclust(distxy)
plot(hClustering)


# Make a function for clustering

myplotcluster <- function(hclust, lab = hclust$labels, lab.col = rep(1, length(hclust$labels)), hang = 0.1, ...){
    y <- rep(hclust$height, 2)
    x <- as.numeric(hclust$merge)
    
    y <- y[which(x < 0)]
    x <- x[which(x < 0)]
    x <- abs(x)
    y <- y[order(x)]
    x <- x[order(y)]
    plot(hclust, labels = FALSE, hang = hang, ...)
    text(x = x, y = y[hclust$order] - (max(hclust$height) * hang), labels = lab[hclust$order], col = lab.col[hclust$order], srt = 90, adj = c(1, 0.5), xpd = NA, ...)
}

# Test the function
myplotcluster(hClustering, lab = rep(1:3, each =4), lab.col = rep(1:3, each = 4))
