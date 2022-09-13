########################################################################
#Vectors, Matrices, Arrays, Lists, and Data Frames
########################################################################

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

#Pull out elements that are not missing
x
x[!is.na(x)]

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
c(rep(seq(1, 10, 2), each = 2))

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
a <- c("1", "1", "2", "3", "1", "2")
#I can't do this
a + 1
#But I can do this:
as.numeric(a) + 1

#What about this?
b <- c("1", "1", "2", "C", "A", "B")
#What will happen here?
as.numeric(b) + 1


####################################
#Factors
####################################
#R is a statistics language.
#Factors show up all the time in statistics
#So there is a factor class
d <- factor(c("A", "A", "B", "C", "A", "B"))
d

#Display the factor levels
levels(d)

#These can be coerced to numeric
#Be careful though!
#This is the index of the level!
#Not always what you want!
as.numeric(d)

#Think about this example
y <- factor(c(100, 100, 200, 300, 100, 200))
levels(y)

#If you convert this to numeric, you'llget 1s, 2s, and 3s
as.numeric(y)

#If you want the LEVELS to be converted to numeric you need to do:
as.numeric(as.character(y))

#Or in tidyverse
y %>% as.character %>% as.numeric

###############################
#Paste
###############################
#Paste joins character strings
f <- c("x1", "x2", "x3", "x4", "x5")
f

#Instead of typing is all out, you can do
f <- paste("x", 1:5, sep = "")
f

#Same thing: paste0 defaults to sep = ""
f <- paste0("x", 1:5)
f

########################################
#Matrices
########################################
#Matrices have two indexes
#First index is rows
#second index is columns
#Arrays are more general can can have many dimensions
#So matrices are really two dimensional arrays

#By default matrices are populated by columns
mat <- matrix(c(1:9), ncol = 3)
mat

#To input by row
mat <- matrix(c(1:9), ncol = 3, byrow = TRUE)
mat

#Subsetting matrices
#Need to specify a row and a column
mat[1, 1]
#First row
mat[1, ]
#First column
mat[, 1]
#First and third row with the second column removed
mat[c(1, 3), -2]

##################
#cbind and rbind
##################
#cbind stacks matrices next to each other
#rbind stacks matrices on top of one another
mat1 <- matrix(1, ncol = 2, nrow = 2)
mat2 <- matrix(2, ncol = 2, nrow = 2)
mat3 <- matrix(3, ncol = 2, nrow = 2)
#cbind
cbind(mat1, mat2, mat3)
#rbind
rbind(mat1, mat2, mat3)

#Combining
wide <- cbind(mat1, mat2, mat3)
tall <- rbind(mat1, mat2, mat3)
rbind(wide, cbind(tall, tall, tall))

#Quick note on arrays
arr <- array(1:12, dim = c(2, 2, 3))
arr
dim(arr)
#three indexes
arr[1, , ]
arr[1, , 1]

########################################################################
#Lists
########################################################################
#Lists are very flexible R objects
#The items of a list can be of any class including many different classes within one R list
#Lists are said to be recursive because an element of a list could potentially be a list itself
#I Lists are indexed with double brackets "[[]]" or with a "$name"

#Create a list
l <-
  list(3, rep(0, 3), matrix(c(1:4), ncol = 2), paste("X", c(1:5), sep = ""))
l

#Another wany to create this list
#initialize an empty list
l <- list()
l[[1]] <- 3
l[[2]] <- rep(0, 3)
#named elements
l$three <- matrix(c(1:4), ncol = 2)
l$four <- paste("X", c(1:5), sep = "")
l

#Let's look at the names
names(l)

#assign names
names(l)[1:2] <- c("one", "two")
names(l)
#Let's look at the structure
str(l)
#length of a list is the number of elements in the list
length(l)

#Call an element of a list in two ways:
#By index
l[[3]]

#by name
l$three

####################
#Lists of lists
####################
l2 <- list(list(3, rep(0,3)), list(5, rep(1,6)))
l2
#First element is a list
l2[[1]]
#list of lists can be called by indexing as much as needed
l2[[1]][[1]]

####################
#Data frames!
####################
#Dataframes are just lists where each element must be a vectors of the same length
#Much of the data that we are interested in can easily be analyzed as a data frame
#Data frames have properties of a matrix and a list
#Can be subsetted by index OR name

#create a data frame
df <- data.frame(V1 = 1:10, 
                 V2 = rep(1, 10),
                 V3 = seq(1,20,2),
                 V4=c(rep("A",3),rep("B",7)),
                 V5=rnorm(10,0,5),
                 V6=paste0("X",c(1,1,2,3,1,3,1,2,3,4)))

df

#These are equivalent
names(df)
colnames(df)
#Row names default to consequtive integers
rownames(df)

#Pull out first column
df[,1]

#pull out first row
df[1,]

#Everything without the first three rows
df[-c(1:3),]

#Rows 3, 6, and 8 with columns 2 and 4
df[c(3,6,8),c(2,4)]

#Rows can be added to a data.frame by using rbind
#Careful though!  This makes everything a character!
test <- rbind(df, c(1,1,1,"A",1,"X2"))
str(test)

#The "right" way to do this!
test <- rbind(df, data.frame(V1 = 11,
                             V2 = 1,
                             V3 = 1,
                             V4 = "A",
                             V5 = 1,
                             V6 = "X2"))
test

#Columns can be added using cbind 
cbind(df,100:109)

#Or this:
df$new_col <- 100:109

#You can derive new columns in this way
df$sumV1_V2 <- df$V1 + df$V2
df

#################################
#Summary and table
#################################
#summary five a five number summary of a continuous variables and a frequency table of a character or a factor
#table returns a frequency table

summary(df)
table(df$V6)


cubs <- read.csv("https://raw.githubusercontent.com/gjm112/DSCI401/main/data/cubs_all_time.csv")

sum(cubs$Attendance > 3000000)
temp <- cubs$Attendance[!is.na(cubs$Attendance)]
sum(temp > 3000000)

library(tidyverse)
cubs %>% filter(Attendance > 3000000) %>% nrow()






