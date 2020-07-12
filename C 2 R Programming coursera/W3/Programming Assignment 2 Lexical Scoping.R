# makeVector <- function(x = numeric()) {
#   m <- NULL
#   set <- function(y) {
#     x <<- y
#     m <<- NULL
#   }
#   get <- function() x
#   setmean <- function(mean) m <<- mean
#   getmean <- function() m
#   list(set = set, get = get,
#        setmean = setmean,
#        getmean = getmean)
# }

makeCacheMatrix <- function(x = matrix) {
  
  m <- NULL
  set <- function(y) {
    
    x <<- y
    m <<- NULL 
  }
  get <- function() x 
  setInv <- function(inverse) m <<- inverse
  
  getInv <- function() m 
  list(set = set, get = get, setInv = setInv, getInv = getInv)
}


# cachemean <- function(x, ...) {
#   m <- x$getmean()
#   if(!is.null(m)) {
#     message("getting cached data")
#     return(m)
#   }
#   data <- x$get()
#   m <- mean(data, ...)
#   x$setmean(m)
#   m
# }


cacheSolve <- function(x, ...) {
  m <- x$getInv() 
  if(!is.null(m)) {
    message('getting cached data')
    return(m)
  }
  
  data <- x$get() 
  m <- solve(data, ...) 
  x$setInv(m) 
  
  m 
}