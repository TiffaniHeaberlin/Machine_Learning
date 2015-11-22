setwd("C:/Users/slussetc/Documents/GitHub/Machine_Learning")
library("caret")
set.seed(200)
training<-read.csv("TrainingData.csv")
traindata<-training[,c(6:10,160)]
traindata<-na.omit(traindata)
modelfit <- train(classe~.,data=traindata,method="knn")
testing<-read.csv("TestData.csv")
testpred<-predict(modelfit,testing)
setwd("TestPredictions")
pml_write_files = function(x){
  n = length(x)
  for(i in 1:n){
    filename = paste0("problem_id_",i,".txt")
    write.table(x[i],file=filename,quote=FALSE,row.names=FALSE,col.names=FALSE)
  }
}
pml_write_files(testpred)

