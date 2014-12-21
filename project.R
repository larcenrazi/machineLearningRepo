library(caret)
library(randomForest)
library(rpart)
library(rpart.plot)

set.seed(1111)
#Load training data
trainingset <- read.csv("pml-training.csv", na.strings=c("NA", "#DIV/0!",""))
#load testing data
testingset <- read.csv("pml-testing.csv", na.strings=c("NA", "#DIV/0!",""))

# Delete columns with all missing values
trainingset<-trainingset[,colSums(is.na(trainingset)) == 0]
testingset <-testingset[,colSums(is.na(testingset)) == 0]

trainingset   <-trainingset[,-c(1:7)]
testingset <-testingset[,-c(1:7)]

modelFit <- randomForest(classe ~., data=traindata, do.trace=10)
