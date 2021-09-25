## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

#makeCacheMatrix function creates a list which contain a function to
#set the value of the matrix
#get the value of the matrix
#set the value of the inverse matrix
#get the value of the inverse matrix

makeCacheMatrix <- function(x = matrix()) {

        inverse_matrix <- NULL

        set <-function(y){
                x<<-y
                inverse_matrix<<-NULL
        }

        get <- function(){
                x
        }
        
        setinverse <- function(inverse){
                inverse_matrix <<- inverse
        }

        getinverse <- function(){
                inverse_matrix
        }
        list(set = set, get = get, 
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

#the following function calculates the inverse matrix
#it first checks to see if the inverse has already been calculated.
#if so, it get the inverse from Cache and skip the computation.
#otherwise, it calculates the inverse and Cache via setinverse function.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse_matrix<-x$getinverse()
#if there is a cache inverse matrix, return it.
        if(!is.null(inverse_matrix)){
                message("getting cached data")
                return(inverse_matrix)
        }
#else, solve it.
        data <- x$get()
        inverse_matrix <- solve(data, ...)
        x$setinverse(inverse_matrix)
        inverse_matrix
}


