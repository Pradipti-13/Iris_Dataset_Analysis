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
plot(TestingSet$sepal_length, TestingSet$sepal_width)

#SVM model (polynomial kernel)
#Without optimizing parameters
#Build a Training Model
Model= train(species ~ ., data= TrainingSet, 
             method= "svmPoly",
             na.action= na.omit, #Removing missing data by performing omission
             preProcess= c("scale", "center"), #Some pre-processing the data, by scale the mean to center i.e, subtract the mean from all data.
             trControl= trainControl(method = "none"), 
             tuneGrid= data.frame(degree= 1, scale= 1, C=1 )
)


#Build a Cross Validation Model with 10 folds
Model.cv= train(species~ ., data = TrainingSet,
                method= "svmPoly", 
                na.action = na.omit,
                preProcess= c("scale", "center"), 
                trControl= trainControl(method= "cv", number = 10), #K-fold value 10
                tuneGrid= data.frame(degree=1, scale= 1, C= 1)
) 

#Apply Model for Prediction
Model.training = predict(Model, TrainingSet)