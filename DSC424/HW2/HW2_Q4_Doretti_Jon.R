#Homework 2 question 1 code - Jon Doretti
#Import statements
library(DescTools) #VIF Function
library(Hmisc) #Describe Function
library(psych) #Multiple Functions for Statistics and Multivariate Analysis
library(GGally) #ggpairs Function
library(ggplot2) #ggplot2 Functions
library(vioplot) #Violin Plot Function
library(corrplot) #Plot Correlations
library(leaps) #Best Set Linear Regression Functions
library(REdaS)
library(factoextra)
library("FactoMineR")
library(ade4)

setwd("C:/Users/doret/Documents/DSC 424")

#Declaration Statements
values <- read.csv(file="BIG5.csv", header=TRUE, sep=",")

dim(values)

head(values)

names(values)

###############################################################################

sum(is.na(values))

#values2 <- na.omit(values) DON'T NEED - no null variables

str(values, list.len=ncol(values)) #all int vars


e <- values[1:10]
n <- values[11:20]
a <- values[21:30]
c <- values[31:40]
o <- values[41:50]

JarqueBeraTest(values$E1)

boxplot(e, data=e, main = "e Personality")
boxplot(n, data=n, main = "n Personality")
boxplot(a, data=a, main = "a Personality")
boxplot(c, data=c, main = "c Personality")
boxplot(o, data=o, main = "o Personality")

# E <- cor(e, method = "spearman")
# round(E,2)
# N <- cor(n, method = "spearman")
# round(N,2)
# A <- cor(a, method = "spearman")
# round(A,2)
# C <- cor(c, method = "spearman")
# round(C,2)
# O <- cor(o, method = "spearman")
# round(O,2)

ggcorr(e, method = c("pairwise" , "spearman"), label = TRUE)
ggcorr(n, method = c("pairwise" , "spearman"), label = TRUE)
ggcorr(a, method = c("pairwise" , "spearman"), label = TRUE)
ggcorr(c, method = c("pairwise" , "spearman"), label = TRUE)
ggcorr(o, method = c("pairwise" , "spearman"), label = TRUE)


E = corr.test(e, adjust="none")
E = E$p

ETest = ifelse(E < .05, T, F)

colSums(ETest) -1


KMO(values)

bart_spher(values)

alpha(values)

CronbachAlpha(values)

CronbachAlpha(e)
CronbachAlpha(n)
CronbachAlpha(a)
CronbachAlpha(c)
CronbachAlpha(o)

p = prcomp(values, center = T, scale = T )

plot(p)
abline(1,0)

summary(p)
print(p)

p2 <- psych::principal(values, rotate="varimax", nfactors = 3, scores = TRUE)

P3 <- print(p2$loadings, cutoff=.42, sort = T)

scores <- p2$scores

cor(scores)

summary(scores)

fit = factanal(values, 3)
print(fit$loadings, cutoff = .3, sort = T)

