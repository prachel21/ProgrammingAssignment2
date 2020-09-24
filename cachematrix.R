#x is a matrix
#inv will hold the inverse of the matrix. the set function will clear
#any previously held matrices, as well as assign the input argument to 
#the x object in the parent environment. get() takes x from the parent
#environment. 
# <<- solve(x) caches the inverse of the matrix

## this function will create a matrix, take the inverse and cache
##the result

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setInvMatrix <- function() inv <<- solve(x)
  getInvMatrix <- function() inv
  list(set = set,
       get = get,
       setInvMatrix = setInvMatrix,
       getInvMatrix = getInvMatrix)
}

matrix <- makeCacheMatrix(matrix(1:4,2))



#This function will take you cached data if you have it, or compute and
#return an inverse matrix. 

cacheSolve <- function(x, ...) {
  inv <- x$getInvMatrix()
  if(!is.null(inv)) {
    message("getting cached data")
    return(inv)
  }
  matrix <- x$get()
  inv <- solve(matrix)
  x$setInvMatrix()
  inv
  }
      
cacheSolve(matrix)

    




