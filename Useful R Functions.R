# Some Useful Commands to remember

# Starters ----------------------------------------------------------------

getwd() #get the current working directory.
setwd("c:/Users/ozan/Desktop/") #change the directory to. E.g. setwd("c:/Users/ozan/Desktop/")

help() #give help regarding a command, e.g. help(hist)
# OR
?help

help.start() # About General help.
help("foo") # Help on function foo (the quotation marks are optional). 
?foo

help.search("foo") #Search the help system for instances of the
??foo              #string foo. 

example("foo") #Examples of function foo (the quotation marks
               #                          are optional).

data() # List all available example datasets contained in
       #currently loaded packages.

vignette() #List all available vignettes for currently installed packages.

vignette("dplyr")

install.packages("vinereg")
vignette("vinereg")

library(vinereg) #link to a downloaded R package to the current R session.
remove.packages() # To uninstall available package on the library

help(package = "coronavirus")

#list files in the current working directory
dir() 

#searching through reachable datasets and packages
search() 

#gives the number of rows and the number of columns of a matrix, or a data frame
dim() 
#gives the length of the vector
length() 

# explicit printing
print() 

# paste and paste0 
x=3
# The difference between paste() and paste0() is that the argument sep 
# by default is " " (paste) and "" (paste0).
paste0("This is ",x, "Day", " R Course")
paste("This is",x, "Day", "R Course")

# paste0() is faster than paste() if our objective is concatenate strings 
# without spaces because we don't have to  specify the argument sep

# Moving Around -----------------------------------------------------------

ls() #list the R objects in the current workspace
rm(x) #remove x from the workspace
rm(list=ls()) #remove all the variables from the workspace

# make the names of the variables in the matrix or data frame
# available in the workspace
attach(mat) 

#releases the names
detach(mat) 

history() # Display your last # commands (default = 25).

# Abotu Saving
savehistory("myfile") #Save the commands history to myfile ( default = .Rhistory).

save.image("myfile") # Save the workspace to myfile (default = .RData).

save(objectlist, file="myfile") # Save specific objects to a file.

load("myfile") #Load a workspace into the current session (default = .RData).

q() # Quit R. You will be prompted to save the workspace.
# Widely Used -------------------------------------------------------------
c() #concatenate objects, e.g. x = c(3,5,8,9)

matrix() #fill in (by row) the values from y in a matrix of 4 rows and 3 columns by giving

head() #gives the first 6 rows of a large matrix, or data frame
tail() #gives the last 6 rows of a large matrix, or data frame

names() #get or set the names of elements in a R object. 

seq() #create a sequence of integers from 2 to 11 by increment 3 with seq(2,11,by=3)
rep() #repeat n times the value x, e.g. rep(2,5) gives 2 2 2 2 2

round() #round values in x to 3 decimal places by round(x,3)
sort() #sort the values in x by giving sort(x)
unique() #get the non-duplicate values from a list, e.g. x = c(3,5,7,2,3,5,9,3) and then
ceiling(x) #vector x of smallest integers > x
floor(x) #vector x of largest interger < x

sum() # Get the sum of the values in given x, what could be x ?

# About Statistics --------------------------------------------------------

mean() #get the mean of the values in x by mean(x)
median() #get the median of the values in x by median(x)
sd() #get the standard deviation of the values in x
var() #get the variance of the values in x
IQR() #get the IQR of the values in x
summary() #get the summary statistics of a single variable, 
          # or of all variables in a data frame

cor() #gives the linear correlation coefficient

table() #frequency counts of entries, ideally the entries are factors(although
        #it works with integers or even reals)

sample(x, size, replace = FALSE, prob = NULL) # take a simple random sample of size n from the
# population x with or without replacement

runif(n,lower,upper) # Generate a random number n times between the boundries

rnorm(n,mean,sd) #randomly generate n numbers from a Normal distribution with the specific mean and sd

pnorm() #find probability (area under curve) of a Normal(10,3^2) distribution to the left
        #of 8,i.e. P(X <= 8), by pnorm(8,mean=10,sd=3)

qnorm() #find quantity or value x such that area under Normal(10,3^2) curve and to the left
        #of x equals 0.25 by qnorm(0.25,mean=10,sd=3)


#  About Reading and Writing ----------------------------------------------
#Don't forget to change to the appropriate directory first

scan() #read data for one variable from a text file, e.g. y = scan("ex.data")

read.table() #read spreadsheet data (i.e. more than one variable) from a text file

write() #write the values of a variable y in a file data.txt by write(y,file="")

#load a R data frame
load("c:/ozan/Desktop/filename.RData") 
#read .csv file with labels in first row
read.csv(filename="C:/ozan/Desktop/filename.csv", header=T) 

# Basic Plotting ----------------------------------------------------------

hist() #create a histogram of the values in x by hist(x)
stem() #create a stem and leaf plot of the values in x by stem(x)
boxplot() #create a boxplot of the values in x by boxplot(x)
plot() #scatterplot of x vs. y by plot(x,y); for more parameters see help(plot.default)

lines() #add a (regression) line to a plot by lines(x,fit$fitted)
abline() #add a straight line to a scatterplot
points() #add additional points (different plotting character) to a plot by points(x,y2,pch=5)


# Functions for saving graphic output -------------------------------------

pdf("filename.pdf") # PDF file
win.metafile("filename.wmf") # Windows metafile
png("filename.png") # PBG file
jpeg("filename.jpg") # JPEG file
bmp("filename.bmp") # BMP file
postscript("filename.ps") # PostScript file

source("script1.R") # submit the R code from script1.R to the current session 

sink() # the text output will be appended to the file myoutput
dev.off()
