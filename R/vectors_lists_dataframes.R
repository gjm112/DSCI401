####################################
#Vectors, Matrices, Arrays, Lists, and Data Frames
####################################

####################################
#Vectors
####################################
#Vectors in R must be of only one class
x <- c(4,1,3,8,6,7,5,3,0,9)
x 
#Vector is numeric and of length 10
str(x)
length(x)

#Subsetting a vector
x[1]
x[1:5]
#Don't need to be consecutive
x[c(1,4,7)]

#I can add vectors together
y <- 1:10

#R knows to add element by element
x + y

#Add 1 to ever element
#R knows to make the 1 into a vector of length 10
x + 1

#Take reciprical of ever element
1/x

#Vectors will repeat themselves
c(1:3) + c(1:6)

#However, they must be multiples or you'll get a warning
#This is NOT an error!
c(1:3) + c(1:5)




