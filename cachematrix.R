## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
    
    m <- NULL
    
    setMatrix <- function(y) {
        x <<- y
        m <<- NULL
    }
    
    getMatrix <- function() {
        x
    }
    
    cacheInverse <- function(solve) {
        m <<- solve
    }
    
    getInverse <- function() {
        m
    }
    
    list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}



cacheSolve <- function(x, ...) {
    m <- x$getInverse()
    
    if(!is.null(m)) {
        message("getting cached data")
        return(m)
    }
    data <- x$getMatrix()
    m <- solve(data)
    x$cacheInverse(m)
    m
}