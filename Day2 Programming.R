
# Recall ------------------------------------------------------------------
library(help = "stats")

df <- data.frame('a' = c(1,2,3,4,5) , 'b' = c(11,12,13,14,15))
df
is.data.frame(df)

# Adding vector and matrix together as list
m=matrix(1:10, 5 ,2)
m
l4 <- list('Vector' = c(10,11,12,13) , 'Matrix' = m)
l4

l5 <- list('Vector' = runif(5) , 'Matrix' = m, 'DF' = df)
l5

# %in% usage
x <- rep(1:2, 3)
x
x <- rep(1:2, each=3)
x
x %in% c(1, 5)
x[x %in% c(1, 5)]

# ! x
# x & y
# x && y
# x | y
# x || y

x=c(1,2,3,4,5)
y=c(10,11,12,13,15)

# NOTE 
# & and && indicate logical AND and | and || indicate logical OR. 
# The shorter form performs elementwise comparisons in much the 
# same way as arithmetic operators. 
# The longer form evaluates left to right examining only 
# the first element of each vector. 
# Evaluation proceeds only until the result is determined. 
# The longer form is appropriate for programming control-flow.

#About Programming ---------------

# Commonly used control structures are

# if and else: testing a condition and acting on it
# 
# for: execute a loop a fixed number of times
# while: execute a loop while a condition is true
# 
# repeat: execute an infinite loop (must break out of it to stop)
# break: break the execution of a loop
# next: skip an interation of a loop

# If statement ------------------------------------------------------------
# 
# #if (condition){
#   Do something
# } else {
#   Do something different
# }

i <- 7
if (i > 3){
  #set.seed(11)
  runif(5, 10, 20)
} else {
  message("No output")
}

runif(3)
# if (condition1) { 
#   expr1
# } else if (condition2) {
#   expr2
# } else if  (condition3) {
#   expr3
# } else {
#   expr4
# }

catvec <- LETTERS[1:10]
sample()
#category <- 'A' #  
category <- sample(catvec, 1) 
price <- 10


if (category =='A'){
  cat('A vat rate of 8% is applied.','The total price is', price *1.08)  
} else if (category =='B'){
  cat('A vat rate of 10% is applied.','The total price is', price *1.10)  
} else {
  cat('A vat rate of 20% is applied.','The total price is', price *1.20)  
}


# ifelse ------------------------------------------------------------------
mydata=sample(100, 10)
class(mydata)
x = ifelse(df$a>3, 1, df$a)
x

df


newdata = cbind(x,mydata)

# For Loop ----------------------------------------------------------------

# for (variable in sequence){
#   Do something
# }

# Example 

for (i in 1:4){
  j <- i + 10
  toget_ij <- cbind(i,j)
  class(toget_ij)
  print(toget_ij)
}

x <- matrix(1:6, 2, 3)
x

for(i in seq_len(nrow(x))) { # seq_len(nrow(x)): 1:nrow(x)
  for(j in seq_len(ncol(x))) {
    print(x[i, j])
  }   
}

# Combination 
x <- runif(10, 3, 8)
mean(x)
hist(x)
n <- length(x)

xnorm =xstandr = vector(mode="numeric", length= length(x))

for(i in 1:n){
  stopifnot(is.numeric(x))
  # Rescaling of the x values
  if(mean(x) > 5) {
    xnorm[i] <- (x[i]-min(x))/(max(x)-min(x))
  }
  else{
    xstandr[i] <- (x[i]-mean(x))/ sqrt(var(x))
  }
}

xnorm
hist(xnorm)
xstandr
hist(xstandr)

# While Loop --------------------------------------------------------------

# while (condition){
#   Do something
# }

i=2
while (i < 5){
  print(i)
  i <- i + 1
}


z <- 5

set.seed(11) # important for reproducibility

while (z >= 4 && z <= 10) { # & usage is possible or not ?
  coin <- rbinom(1, 1, 0.5)
  
  if (coin == 1) {
    ## random walk
    z <- z + 1
  } else {
    z <- z - 1
  }
}

z

# Break command -----------------------------------------------------------

no <- c(1:50)
for (val in no) 
{ 
  if (val %% 5 == 0)  
  { 
    print(paste("Coming out from for loop Where i = ", val)) 
    #next
  } 
  
  if (val %% 39 == 0)  
  { 
    print(paste("Coming out from for loop Where i = ", val)) 
    break
  } 
  print(paste("Values are: ", val)) 
} 

# Next command ------------------------------------------------------------

#next is used to skip an iteration of a loop.
x <- 1:50
for (val in x) {
  if (val %% 3 == 1){
    next
  }
  print(val)
  
}

# Functions ---------------------------------------------------------------

# function_name <- function(var){
#   Do something
#   return(new_variable)
# }

roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}

square <- function(x){
  squared <- x*x
  return(squared)
}

# R functions arguments can be matched positionally or by name. 

str(rnorm)
mydata <- rnorm(100, 2, 1)              ## Generate some data
# hist(mydata)

x=matrix(rnorm(25), 5, 5, T)
x
is.matrix(x)

x <- as.data.frame(x)

# Taking the traspose of a matrix
mytrans <- function(x) {
  if (!is.matrix(x)) {
    #warning("argument is not a matrix: returning NA")
    #return(NA_real_)
    # OR 
    x <- as.matrix(x)
  }
  y <- matrix(1, nrow=ncol(x), ncol=nrow(x))
  for (i in 1:nrow(x)) {
    for (j in 1:ncol(x)) {
      y[j,i] <- x[i,j]
      
      if(y[j,i] >= 0.5){
        y[j,i] <- 1
      }
      else{
        y[j,i] <- 0
      }
    }
  }
  return(list("x" = x, "y" = y)) # For multiple argument we need to use list general
}

str(mytrans)
mytrans(x)

# Repeat Function ---------------------------------------------------------

computeprem <- function(){
  x <- runif(1)
  # Cost function
  if (x<0.5) {
    premium <- x*10 
  }
  else{
    premium <- x*10 + runif(1)
  }
  
  #if (x>0.5) {
  #  premium <- x*10 + runif(1)  
  #}
  return(premium)
}

# computeprem()
premium <- computeprem()
premium

x0 <- 1
tol <- 1e+1

repeat {
  x1 <- computeprem()
  
  if(abs(x1 - x0) > tol) {  ## Close enough?
    break
  } else {
    x0 <- (2*x1-1)
    print(c(x0,x1))
  }
}

# About profvis -----------------------------------------------------------
# Profvis is a tool for helping you to understand how R spends its time. 
# It provides a interactive graphical interface for visualizing data 
# from Rprof, R's built-in tool for collecting profiling data.

# About profiling the code, to understand which part is slow
install.packages("profvis")

library("profvis")

cities <- c("New York", "Paris", "London", "Leuven",
            "Ankara", "Dresden")

num_chars <- c()
profvis({
  system.time(
    for(i in 1:length(cities)) {
      num_chars[i] <- nchar(cities[i]) })
  
})

#profvis({

# lapply function
system.time(
  lapply(cities, nchar)
)

#})

# To get unlist output
unlist(lapply(cities, nchar)) 

# sapplyoutput <- sapply(cities, nchar)
# class(sapply(cities, nchar))
# sapplyoutput[1] * 5

# sapply(cities, nchar, USE.NAMES = FALSE)

# Numeric Example
profvis({
  N <- 10000
  x1 <- rnorm(N)
  x2 <- rnorm(N)
  df <- as.data.frame(cbind(x1, x2))
  #df
  
  index <- length(df[, 1])
  index <- dim(df)[1]
  
  #system.time( 
  for (loop in c(1:index)) {
    df$mean2[loop] <- mean(c(df[loop, 1], df[loop, 2]))
  }
  #)
  
  #system.time(
  df$mean1 <- apply(df, 1, mean)
  #  )
  
  #system.time(
  df$mean3 <- rowMeans(df[, c(1, 2)])
  #  )
})

# Another example for profvis

# Generate data
times <- 4e5
cols <- 150
data <- as.data.frame(x = matrix(rnorm(times * cols, mean = 5), ncol = cols))
data <- cbind(id = paste0("g", seq_len(times)), data)

profvis({
  data1 <- data
  # Four different ways of getting column means
  means <- apply(data1[, names(data1) != "id"], 2, mean)
  means <- colMeans(data1[, names(data1) != "id"])
  means <- lapply(data1[, names(data1) != "id"], mean)
  means <- vapply(data1[, names(data1) != "id"], mean, numeric(1))
})

# For further readings about profvis
# https://rstudio.github.io/profvis/index.html

# KEEP in MIND THAT 
#' Never grow a vector 

n=10000
system.time( x <- 1:n )

# OR Preallocate
x <- vector("numeric", n)
system.time(
  for(i in 1:n){
    x[i] <- i })

# OR  Growing
x <- NULL # Length zero
system.time(
  for(i in 1:n)
    x <- c(x, i)
)

# Vectorization
# use a vectorized solution wherever
# possible.

x <- vector("numeric", n)
system.time(
  for(i in 1:n)
    x[i] <- rnorm(1)
)

system.time(
  x <- rnorm(n)
)

# Another example 

x <- 1:100
## the vectorized version ...
system.time(
y <- x^2)
y
## or the for loop version?

z <- vector(mode = mode(x), length = length(x))
system.time(
for(i in seq_along(x)) {
  z[i] <- x[i]^2
})

identical(y, z)

# For further information about timing/code profiling 
# Source: https://www.alexejgossmann.com/benchmarking_r/


# lapply Family -----------------------------------------------------------

# There are several related function in R which allow you to apply some function to a series of objects (eg. vectors, matrices, dataframes or files). They include:
# apply
# apply(X, MARGIN, FUN, ...)
# MARGIN = 1 for rows, 2 for columns, c(1,2) both
# FUN, which is the function that you want to apply to the data

# Construct a 5x6 matrix
X <- matrix(1:10, nrow=5, ncol=2)
X
# Sum the values of each column with `apply()`
apply(X, 2, sum)
apply(X, 1, sum)
# apply(X, c(1,2), sum) is possible for both row and column based calculation
# 
# lapply
# You want to apply a given function to every element of a list and obtain a list as a result

#create a list of matrices:
A <- matrix(1:9, 3,3)
B <- matrix(4:15, 4,3)
C <- matrix(8:10, 3,2)

# display the list
MyList<-list(A,B,C) 
# extract the second column from the list of matrices, using the selection operator "["
lapply(MyList,"[",,2)
# extract the first row from the list of matrices, using the selection operator "["
lapply(MyList,"[",1,)


# sapply
# sapply works as lapply, but it tries to simplify the output to the most elementary 
# data structure that is possible
sapply(MyList,"[", 2,)
sapply(MyList, "[", , 1)

sapply(MyList,"[",2,1)

# if we close the simplification
sapply(MyList,"[", 2,1, simplify=F)

# with lapply
unlist(lapply(MyList,"[", 2,1 ))

# vapply
# vapply is similar to sapply, but it requires you to specify what type 
# of data you are expecting the arguments for vapply are 
# vapply(X, FUN, FUN.VALUE). 
# FUN.VALUE is where you specify the type of data you are expecting.

sapply(MyList, sum)

# expecting each item in the list to return a single numeric value
vapply(MyList, sum, numeric(1))

# mapply
# The mapply() function is a multivariate apply of sorts which applies a function 
# in parallel over a set of arguments
Q=matrix(c(rep(1, 4), rep(2, 4), rep(3, 4), rep(4, 4)), 4, 4)
Q
# with mapply 
Q=mapply(rep,1:4,4)
Q

# tapply() computes a measure (mean, median, min, max, etc..) or 
# a function for each factor variable in a vector.

# tapply(X, INDEX, FUN = NULL)
# Arguments:
#   -X: An object, usually a vector
#   -INDEX: A list containing factor
#   -FUN: Function applied to each element of x

x<-runif(20, min=155, max=180) #simulate 20 random heights
y<-gl(2, 10, labels = c("Male", "Female")) #Generate factors by specifying the pattern of their levels.
tapply(x, y, mean)

data(iris)
tapply(iris$Sepal.Width, iris$Species, median)
tapply(iris$Petal.Length, iris$Species, summary)

# For further readings
# https://ademos.people.uic.edu/Chapter4.html#1_what_are_apply_functions

# Aggregate ---------------------------------------------------------------
# Basic R syntax of aggregate function
#aggregate(x = any_data, by = group_list, FUN = any_function)
data <- data.frame(x1 = runif(5), # Create example data
                   x2 = rnorm(5),
                   x3 = rnorm(5)^2,
                   group = c("A", "A", "B", "C", "C"))

data

# Sum by group using aggregate over data frame
aggregate(x = data[ , colnames(data) != "group"],             
          by = list(data$group), FUN = sum)

data()
# Aggregate function in R with mean summary statistics
data(iris)
class(iris)
agg_mean = aggregate(iris[,1:4], by=list(iris$Species), 
                     FUN=mean, na.rm=TRUE)

agg_mean
class(agg_mean)

# Aggregate function in R with maximum
agg_max = aggregate(iris[,1:4],by=list(iris$Species),
                    FUN=max, na.rm=TRUE)
agg_max


# FOR SELF STUDY
# Summary function --------------------------------------------------------
rep <- 100
set.seed(1130)
df <- as.data.frame(cbind(rnorm(rep), runif(rep), 
                          sample(100,rep,replace = TRUE)))

SummaryLoc = function(data) {
  if (!is.data.frame(x)) {
    data <- as.data.frame(data)
  }
  
  n <- dim(data)[1]
  ncol <- dim(data)[2]
  
  dfsumm <- matrix(0,3,ncol)
  
  for (i in 1:ncol) {
    # For mean
    Sumdf <- lapply(data, sum)
    #class(Sumdf)
    dfsumm[1,i] <- unlist(Sumdf[i])/n
    
    # For median
    Sortdf=matrix(0,n,ncol)
    Sortdf[,i] <- sort(data[,i])
    #head(Sortdf)
    #class(Sortdf[,i])
    
    if(n %% 2 == 0) {
      dfsumm[2,i] <- sum(Sortdf[c(n/2,n/2+1),i]) / 2
    }
    
    if(n %% 2 == 1) {
      dfsumm[2,i] <- Sortdf[(n+1)/2,i]
    }
    
    # For Mode
    CountObs <- table(df[i])
    CountObs <- as.vector(CountObs)
    CountObs
    
    if (max(CountObs) > 1) {
      maxIndf <- which.max(table(df[i]))
      dfsumm[3,i] <- as.numeric(rownames(as.matrix(maxIndf)))
    }
    else {
      dfsumm[3,i] <- NaN
    }
    
  }
  # ,Output
  return(dfsumm)
}
