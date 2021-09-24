## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
#initialize the inverse_matrix variable.
        inverse_matrix <- NULL
#set function is for store the original matrix
        set <-function(y){
                x<<-y
                inverse_matrix<<-NULL
        }
#get function is for getting the matrix which has been stored in set function.
        get <- function(){
                x
        }
#setinverse function is for store the inverse matrix.        
        setinverse <- function(inverse){
                inverse_matrix <<- inverse
        }
#getinverse function is for getting the inverse matrix of the matrix which has
#been stored in setiverse function.
        getinverse <- function(){
                inverse_matrix
        }
        list(set = set, get = get, 
             setinverse = setinverse,
             getinverse = getinverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        inverse_matrix<-x$getinverse()
        if(!is.null(inverse_matrix)){
                message("getting cached data")
                return(inverse_matrix)
        }
        data <- x$get()
        inverse_matrix <- inverse(data, ...)
        x$setinverse(inverse_matrix)
        inverse_matrix
}

source('cachematrix.R')

the_matrix = cbind(c(1,2,3),c(4,5,6),c(7,8,9))

cacheSolve(the_matrix)
