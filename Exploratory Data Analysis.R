#Method_1
library(datasets)
data("iris")
View(iris)

#Method_2
install.packages("RCurl")
library(RCurl)
iris= read.csv(text = getURL("https://raw.githubusercontent.com/Pradipti-13/datascience/main/IrisDatasetPro.csv"))
View(iris)

#Head_Tail
head(iris, 4)
tail(iris, 5)

#Summary_Statistics
summary(iris)
summary(iris$sepal_length)

#Missing_Data_Check
sum(is.na(iris))

#Skimr provides with more statistical values.
install.packages("skimr")
library(skimr)
skim(iris)

#Install dplyr to use pipes
install.packages("dplyr")
library(dplyr)
iris %>% dplyr::group_by(species) %>% skim()

#Quick_Data_Visualization using R base plot function
#Panel_Plots
plot(iris)
plot(iris, col= "blue")

#Scatter_Plot
plot(iris$sepal_length, iris$sepal_width, col= "red", 
     xlab = "length", ylab= "width")

#Histogram
hist(iris$sepal_length, col= "blue")

#Box_Plot
boxplot(iris$sepal_length)

#Feature_Plot- Not available in this version of R.
#featurePlot(x= iris[,1:4], 
#y=iris$species,
#plot="box",
#strip= strip.custom(par.strip.text= list(cex=.7)),
#scales= list(x= list(relation= "free",
# y= list(relation= "free")))

#Importing Classification and Regression Training package for machine learning
install.packages("caret")
library(caret)

#To make a reproducible model, set seed.
set.seed(100)

#Perform split of the data set into Training and Testing models
TrainingIndex= createDataPartition(iris$species, p=0.8, list= FALSE)
View(TrainingIndex)
TrainingSet= iris[TrainingIndex,] #Training Set
TestingSet= iris[-TrainingIndex,] #Testing Set

#Comparing scatter plots for Training and Testing Sets.
plot(TrainingSet$sepal_length, TrainingSet$sepal_width)
plot(TrainingSet$sepal_width, TrainingSet$sepal_length)
