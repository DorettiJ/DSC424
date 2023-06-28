#Homework 1 question 1 code - Jon Doretti
#Declaration statements
Z <- matrix(c(1, -1, 1, 4, 1, 0, 1, 5), nrow = 4, ncol = 2)
Z

Y <- matrix(c(0, 6, 0, 8), nrow = 4, ncol = 1)
Y

M <- matrix(c(5, 37, 0, 8, 9, 43, 11, 3, 8), nrow = 3, ncol = 3)
M

N <- matrix(c(-3, 1, 7, -2, 2, 2, 0, 7, -8), nrow = 3, ncol = 3)

v <- matrix(c(-3, 1, 7), nrow = 3, ncol = 1)
v

w <- matrix(c(0, 4, 20), nrow = 3, ncol = 1)

#Answering questions
#a
a <- t(v) %*% w
a
#b
three <- matrix(c(-3), ncol = 1, nrow = 1)
b <-  w %*% three
b
#c
c <- M %*% v
c
#d
d <- M + N
d
#e
e <- M - N
e
#f
f <- t(Z) %*% Z
f
#g
g <- solve(f)
g
#h
h <- t(Z) %*% Y
h
#i 
i <- g %*% h
i
#j
j <- det(f)
j