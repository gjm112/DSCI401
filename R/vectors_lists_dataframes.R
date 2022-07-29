####################################
#Vectors, Matrices, Arrays, Lists, and Data Frames
####################################

####################################
#Vectors
####################################
#Vectors in R must be of only one class
x <- c(4, 1, 3, 8, 6, 7, 5, 3, 0, 9)
x
#Vector is numeric and of length 10
str(x)
length(x)

#Subsetting a vector
x[1]
x[1:5]
#Don't need to be consecutive
x[c(1, 4, 7)]

#I can add vectors together
y <- 1:10

#R knows to add element by element
x + y

#Add 1 to ever element
#R knows to make the 1 into a vector of length 10
x + 1

#Take reciprical of ever element
1 / x

#Vectors will repeat themselves
c(1:3) + c(1:6)

#However, they must be multiples or you'll get a warning
#This is NOT an error!
c(1:3) + c(1:5)

#Check which elements are 0
x == 0
#Class is logical
class(x == 0)
str(x == 0)

#If I want them to be 0's and 1's.
(x == 0) + 0
class((x == 0) + 0)

#How many are 0's?
sum(x == 0)

#Logical statements can be combined
#This returns TRUE/FALSE/NA
x > 5 | x == 0

#Then can be used to subset a vector
#This returns elements of the vector
x[x > 5 | x == 0]

#Missing values
#R uses NA to indicate a missing value.
#R also has NaN (Not a number)
x[1] <- NA
x

#check which elements are missing
is.na(x)

#This is not what you want to do!
x == NA

#Let's look at NaN
x[2] <- 0 / 0
x

#Both NA and NaN are treated a missing
is.na(x)
#There is also this function
is.nan(x)

#Is infinity missing?
is.na(Inf)

#seq
#Numbers 1 to 2 by 2
seq(1, 10, 2)

#Number 1 to 10 of length 5
seq(1, 10, length = 5)

#repeated vector
rep(0, 5)

#these can be combined
c(rep(seq(1, 10, 2), 2))

#Tidyverse way......more on this coming soon!
library(tidyverse)
seq(1, 10, 2) %>% rep(2)

#Character vectors
z <- c("A", "A", "B", "C", "A", "B")
z[1]
z[1:4]
#class character
str(z)

#A character vector of numbers....
x <- c("1","1","2","3","1","2")
#I can't do this
x + 1
#But I can do this: 
as.numeric(x) + 1

#What about this? 
x <- c("1","1","2","C","A","B")
#What will happen here?
as.numeric(x) + 1



