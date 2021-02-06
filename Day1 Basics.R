# First joke
x <- 1
print(x)
class(x)
x

# Assigining variables
# possible to use
my_var <<- 3
3 -> my_var
3 ->> my_var

# Basic data types in R can be divided into the following types:
# numeric (10.5, 55, 787)
# integer (1L, 55L, 100L, where the letter "L" declares this as an integer)
# complex (9 + 3i, where "i" is the imaginary part)
# character/string ("k", "R is exciting", "FALSE", "11.5")
# logical/booleans (TRUE or FALSE)

y=5
class(y)
yint <- as.integer(y)
y =5L
class(y)
x <- 9i + 3
class(x)
msg <- "Welcome to the Introduction to R Course"
class(msg)
# OR alternatively
# msg <- 'Welcome toe Introduction to R Course'
# class(msg)
multimsg <- "Welcome to the Introduction to R Course,
I hope you will enjoy."
class(multimsg)
bool = TRUE
class(bool)


msg <- "Welcome to the Introduction to R course"
class(msg)
msg <- 'Hello New Normal'
class(msg)


# Arithmetic operations ---------------------------------------------------


#Operator	Description
#+	addition
#-	subtraction
#*	multiplication
#/	division
#^ or **	exponentiation
#x %% y	modulus (x mod y) 5%%2 is 1
#x %/% y	integer division 5%/%2 is 2

x <- 2
x
print(x)
x^3

y <- 35
# Modulus operation
y %% 4

# Normal division
y / 4
# Integer division
y %/%4

# Logical Operators -------------------------------------------------------

#Operator	Description
# <	less than
# <=	less than or equal to
# >	greater than
# >=	greater than or equal to
# ==	exactly equal to
# !=	not equal to
# !x	Not x
# x | y:	x OR y
# x & y:	x AND y
# isTRUE(x):	test if X is TRUE

x <- c(1:10)
class(x)
x

x>8
x<5
class((x<5))

(x>8) | (x<5)

x[4]
x[(x>8) | (x<5)]

# Getting index where conditions are satisfied
which((x>8) | (x<5))
x
which((x>8) | (x<5))
x[(x>8) | (x<5)]
(x>8) & (x<5)
x[(x>8) & (x<5)]


# Vectors -----------------------------------------------------------------
# Vector with numerical decimals in a sequence
numbers1 <- 1.5:6.5
numbers1
numbers2 <- 1.5:6.3
numbers2


a <- c(1, 2, 5, 3, 6, -2, 4)
length(a)
a1 <- c(1, 4, 6, 7, 12, 3, 5)
a+a1
b <- c("one", "two", "three")
c <- c(TRUE, TRUE, TRUE, FALSE, TRUE, FALSE)

1:3
a[1:3]
b <- b[-3]
b

c
except <- c(1,4,6)
c[-except]

a
a == 5
a[a == 4]
a[a = 4] # DO not use one equal sign to call any element from a vector
a[a < 5]
a[ a != 4]
a[ a <= 3]
a[ a >= 3]

a
a[a = 7] 
a[a = -2] 


e <- c("A", "B", 2, 3, 4, "D", TRUE)
e[5]
class(e)
e <- c("A", 2, 3, 4)
e


(e > 'A')
which(e > 'A')
which(e == 'A')

e[which(e > 'A')]

e
e[2] <- 33
e

e[c(1,2)] <- c(1,2,3)

e[1:3] <- 11:13
e

length(e)
e <- as.numeric(e)
e
e[6] <- "D"
e

# Lists -------------------------------------------------------------------

x <- c(1,2,3,4,5,6)
x
class(x)



l1 <- list(13,56,47,89)
l1
class(l1)

# Character
l2 <- list('A' ,'B')
l2

# Character and numeric value
l3 <- list('A' , 'B' , 2 , 'C' , 6)
l3

l4 <- list(c(1,2,3,4,5) , 'A' , c(5, "A"))
l4
l4[[1]][1]


l5 <- list('a' = c(1,2,3,4,5) , 'b' = 'A')
l5
l5[[1]]
l5$a

g = c(56,67)

l6 <- list('a' = g , 'b' = g)
l6

f <- c(45,56)
h <-c(1,2)

fh <- c(f,h)
fh

x <- list("num" = 11, "num2" = 12 , "char" = c('A' , 'B' , 'C'))
x


x[1]
x[[1]]
# What is the difference ?
class(x[1]); class(x[[1]])


x[3][2] 

x[[3]][2]

x[[1]] <- NULL
x

x[[3]] <- x[[3]][-2] 

x[[4]] <- c(11,12,13,14)

fruit_list <- list("apple", "banana", "cherry")
"apple" %in% fruit_list

append(fruit_list, "orange")
append(fruit_list, "orange", after = 2)

fruit_list
newlist <- fruit_list[-1]

newlist

rev(newlist)


# Matrices ----------------------------------------------------------------
m1 <- matrix(seq(1:4) , nrow=2 , ncol=2)
m1
matrix(seq(1:4), 2, 2)
class(m1)


is.matrix(m1)

m1[,2]
class(m1[,2])


m1[c(1,2) , 1] <- NA
m1[1:2, 1] <- NA
m1


m1[-c(2:3), ]
m1[, -c(2:4) ]

m2 <- m1[-4,]
m2

y <- matrix(1:20, nrow=5, ncol=4)
y
colnames(y)

colnames(y) <- c("C1", "C2", "C3","C4")
y

rownames(y)

cells <- c(1,26,24,68)
rnames <- c("R1", "R2")
cnames <- c("C1", "C2")

mymatrix <- matrix(cells, nrow=2, ncol=2, byrow=TRUE,
                   dimnames=list(rnames, cnames))

A <- matrix(seq(1:10), nrow=2, ncol=5)
A

dim(A)

A[,2]
A[1, c(4,5)]

A[1, -c(4,5)]

A[c(1) , c(1,3,4)]

m <- matrix(c(1,2,3,4) , 2,2,T)
m

m[ ,3] <- c(1,2) # No third column ! 

cbind(m , c(1, 2))
rbind(m , c(1, 2))

cbind(m , c(1, 2, 3))
rbind(m , c(1, 2, 3))

# Removing row and columns
thismatrix <- matrix(c("apple", "banana",
                       "cherry", "orange",
                       "mango", "pineapple"), nrow = 3, ncol =2)
thismatrix
class(thismatrix[1,1])
#Remove the first row and the first column
thismatrix <- thismatrix[-c(1), -c(1)]
thismatrix

# Matrix Operations
is.matrix(x)

c <- 3
c*x

D <- cbind(m , c(1, 2))
D

dim(m); dim(D)
E <- D*m
E <- m %*% D
E

DT <- t(D) # transpose of a matrix
D

DT

U <- matrix(1,3,2)

S <- matrix(c(2,3,-2,1,2,2,4,2,3),3,3)
S

SInv <- solve(S) # finding the inverse of a matrix
SInv 
#Check
S %*% SInv

S
D <- diag(S)

D <- diag(diag(S))

I <- diag(c(1,1,1)) # Identity matrix
I
# Arrays ------------------------------------------------------------------

# Arrays are similar to matrices but can have more than two dimensions.
# USAGE : myarray <- array(vector, dimensions, dimnames)
help(array)
myarray <- array(c(1:100), c(2, 5, 10))
myarray[1, 2:3, 5]
myarray[1, , ]

class(myarray[1, , ])


dim1 <- c("A1", "A2")
dim2 <- c("B1", "B2", "B3")
dim3 <- c("C1", "C2", "C3", "C4")
z <- array(1:24, c(2, 3, 4), dimnames=list(dim1, dim2, dim3))
z
z[, , "C4"]

thisarray <- c(1:24)
# Access all the items from the first row from matrix one
multiarray <- array(thisarray, dim = c(4, 3, 2))
multiarray
multiarray[c(1), , 1]

2 %in% multiarray
32 %in% multiarray

which(32 %in% multiarray)

dim(multiarray)
length(multiarray)

# Data Frames -------------------------------------------------------------


x <- c(10,20,30,40)
y <- c('A' , 'B' , 'C' , 'D')
class(y)
z <- c(11,22,33,T)
z

df <- data.frame(x,y,z)
df$y

View(df)


t <- c(1,2,3,4,5)
e <- c(45,67,56,34,23)
data.frame(x,y,z,t)
data.frame(t,e)

df2 <- data.frame('AVar' = x , 'BVar' = y , 'CVar' = z)
df2[1]
df2

View(df2)

df3 <- data.frame(c(1,2,3,4,5) , 
                  c(34,45,67,89 ,45) ,
                  c(12,34,45,34 ,45))
View(df3)

df4 <- data.frame( 'a' = c(1,2,3,4,5) , 
                   'b' = c(34,45,67,89 ,45) ,
                   'a b' = c(12,34,45,34 ,45))
df4$a.b

# Example of creating Data frame
patientID <- c(1, 2, 3, 4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type2", "Type1", "Type1")
status <- c("Poor", "Improved", "Excellent", "Poor")
patientdata <- data.frame(patientID, age, diabetes, status)
patientdata
class(patientdata$diabetes)


patientdata[1:2]
patientdata[c("diabetes", "status")]

# if you want to cross tabulate diabetes type by status
table(patientdata$diabetes, patientdata$status)


# Factors -----------------------------------------------------------------

# Create a factor
music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"))
# Print the factor
music_genre

#To only print the levels
levels(music_genre)

# Alternatively
music_genre <- factor(c("Jazz", "Rock", "Classic", "Classic", "Pop", "Jazz", "Rock", "Jazz"),
                      levels = c("Classic", "Jazz", "Pop", "Rock", "Other"))
levels(music_genre)
music_genre[3] <- "Trash Metal"

# Combinations ------------------------------------------------------------

# Data Frame
df <- data.frame('a' = c(1,2,3,4,5) , 'b' = c(11,12,13,14,15))

# vector and matrix in the list 
l4 <- list('Vector' = c(10,11,12,13) , 'Matris' = m)

l5 <- list('Vector' = runif(5) , 'Matris' = m , 'DF' = df)


# Special Functions -------------------------------------------------------
set.seed(1234)

# paste and paste0
x=3

paste0("This is ", x, "Day", "R Course")
paste("This is ", x, "Day", " R Course")
# The difference between paste() and paste0() is that the argument sep
# by default is " " for (paste) and "" for (paste0).

seq(from = 1 , to = 10)
seq(from=1 , to = 20 , by = 2)

t <- seq(from = 1 , to = 10 , length.out = 30)
length(t)

seq(from = 1 , to = 20 , by = 4 , length.out = 3) # Wrong usage

sample(t)
sample(t , replace = TRUE)

rep(3,6)
rep(c(3:6),4)
rep(c(3:6), each=4)

x <- runif(10)
x
v <- rep(x , each = 5)
v
length(v)
vs <- sample(v)
vs

sort(x)
sort(x, decreasing = T)

y <- c("M.Topalak", "Arif Isik", "K. Logar", "Garabel")
sort(y)

na <- c(12,34,12,4,5,45,22,67,34, NA, NA)
sort(na)
sort(na , decreasing = T , na.last = NA)
sort(na , decreasing = T , na.last = T)
sort(na , decreasing = T , na.last = F)
SortwithIndex <- sort(na , decreasing = T , na.last = T , index.return = T)

SortwithIndex$ix

min(na); max(na)

which(na == 34)

?factor
f <- factor(c('A' , 'B' , 'C'))
class(f)

x <- seq(1,10,by=2)
y <- c('A' , 'B' , 'C')
f <- factor(c('D', 'F' , 'G'))
l <- c(T,F,T,F,TRUE)

is.numeric(x)
is.integer(x)
is.character(y)
is.factor(f)
is.logical(l)

class(y)
class(x)
class(f)
class(l)

# Data Transformation
x <- c(12,13,14,15,16)
class(x)

class(as.integer(x))
xI <- as.integer(x)
class(xI)

class(x)
x <- as.integer(x)
class(x)

x <- as.numeric(x)
class(x)

y <- c('A' , 'B' , 'C' , 'D')
class(y)

y <- as.factor(y)
class(y)

y <- as.character(y)
class(y)

class(x) 
xN <- x
xN

xC <- as.character(xN)
xC
class(xC)

x <- c(0,0,1,1,0)
class(x)
xL <- as.logical(x)
class(xL)

x1 <- c(11,23,45,56)
x1L <- as.logical(x1)
x1L

x2 <- c(11,23,45,0)
x2L <- as.logical(x2)
x2L

y1 <- c('A' , 'B' , 'C')
y1L <- as.logical(y1)
y1L

x3 <- factor(c("10" ,"12" , "14" , "45"))
x3
as.numeric(x3)

# work with your previous commands
history() # display last 25 commands

# save your command history
savehistory(file="myfile") 

# save the workspace to the file .RData in the cwd
save.image("Day1Data")

ls() #list the R objects in the current workspace
rm(x) #remove x from the workspace
rm(list=ls()) #remove all the variables from the workspace
