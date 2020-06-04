## During first run functions calculate inverse matrix, and store it in the cache. With next run functions check if inverse matrix is stored in cache. If it is, then previously caluclated inverse mattrix is get  from cache. 
## 

## function creates list containing a function to set and get matrix, set and get inverse matrix


makeCacheMatrix <- function(x = numeric()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinv <- function(solve) i <<- solve
  getinv <- function() i
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}
## function at first checks if inverse matrix was previously calculated. if it is, it gets result stored in cache. if is not, it solves matrix,  sets result in variable i stored in cache

cacheSolve <- function(x, ...) {
  i <- x$getinv()
  if(!is.null(i)) {
    message("getting cached data")
    return(i)
  }
  data <- x$get()
  i <- solve(data, ...)
  x$setinv(i)
  i
}
