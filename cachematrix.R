## The first function will create a matrix and cache its inverse; the   
## following function will check for the matrix inverse in the cache,
## if it is not found, it will calculate the inverse and store it in the cache

## Creates the matrix, returns the matrix, solves the square matrix, and returns the inverse
## Stores the calculation of the matrix and inverse in the cache to be used later

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  setMat <- function(y){
    x <<- y
    m <<- NULL
  }
  getMat <- function(){
    x
  }
  setInv <- function(solve) {
    m <<- solve
  }
  getInv <- function() {
    m
  }
  list (setMat = setMat, getMat = getMat,
        setInv = setInv, getInv = getInv)
}

## Caculates the new cached matrix
cacheSolve <- function(x = matrix(), ...) {
  inv <- x$getInv()
  if(!is.null(inv)) {
    message("getting cached data")
    return (inv)
  }
  
## If matrix is not in cache
## Get, calculate, and store inverse in cache
  data <- x$getMat()
  inv <- solve(data,...)
  x$setInv(inv)
  inv
## Return a matrix that is the inverse of 'x'
}
