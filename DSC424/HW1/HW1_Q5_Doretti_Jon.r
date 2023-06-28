#Homework 1 question 1 code - Jon Doretti
#Import statements
library(Hmisc) #Describe Function
library(psych) #Multiple Functions for Statistics and Multivariate Analysis
library(GGally) #ggpairs Function
library(ggplot2) #ggplot2 Functions
library(vioplot) #Violin Plot Function
library(corrplot) #Plot Correlations
library(DescTools) #VIF Function
library(leaps) #Best Set Linear Regression Functions

setwd("C:/Users/doret/Documents/DSC 424")

#Declaration Statements
values <- read.csv(file="insurance_dataset.csv", header=TRUE, sep=",")
#Check Sample Size and Number of Variables
values2 <- subset(values, select = -c(sex, smoker, region))


#Checks for Multicollinearity
#Option1
M<-cor(values2, method="spearman")
M
corrplot(M, method = "square")

# #Option2
model1 <- lm(expenses  ~ ., data=values2)
model1
#Check VIF
VIF(model1)


null = lm(expenses ~ 1, data=values2)
null

full = lm(expenses ~ ., data=values2)
full
#Forward Regression
train_Forward = step(null, scope = list(lower=null, upper=full), direction="forward")
summary(train_Forward)

