## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:
# * setMatrix      set the value of a matrix
# * getMatrix      get the value of a matrix
# * cacheInverse   get the cahced value (inverse of the matrix)
# * getInverse     get the cahced value (inverse of the matrix)
#
# @author anilrk
makeCacheMatrix <- function(x = matrix()) {
    cacheMatrix <- NULL
    #store matrix
    setMatrix <- function (setValue){
        x<<-setValue
        cacheMatrix <- NULL
    }
    #retrive matrix
    getMatrix<- function () {
        x
    }
    #cache the provided matrix
    cacheInverse<-function(solve){
        cacheMatrix <<- solve
    }
    getInverse<- function() {
        cacheMatrix
    }
    #store list of all methods, return them for further reference
    list(setMatrix=setMatrix, getMatrix=getMatrix, cacheInverse=cacheInverse, getInverse=getInverse)
}


## Write a short comment describing this function
## This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has  
## already been calculated (and the matrix has not changed), then the cachesolve should retrieve the inverse from the
## cache, takes matrix as argument
cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    # get the cached value
    inverse <- x$getInverse()
    # if a cached value exists return it
    if(!is.null(inverse)) {
        message("obtaining the cached data")
        return(inverse)
    }
    data <- x$getMatrix() #invoke the inverse function "solve"
    inverse <- solve(data)
    x$cacheInverse(inverse)
    inverse #return the inverse
}

## Please refer to the test_sequence.txt for "test results"