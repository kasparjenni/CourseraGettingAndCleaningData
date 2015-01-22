##----------Getting and Cleaning Data Project----------##
#created by Kaspar Jenni
#date: 01/22/2015
#
#The goal is to prepare tidy data that can be used for later analysis.
#requierment:
#   1) a tidy data set
#   2) link to GitHub repo with script for the analysis
#   3) a code book CodeBook.md
#
#data linked to from the course website represent data collected 
#from the Samsung Galaxy S smartphone
#The data linked to from the course website represent data collected
#from the accelerometers from the Samsung Galaxy S smartphone.


#To 
run_analysis<-function(){
  library(dplyr)
  
  download_data()
  fulldataset<-clean_data()
  tidydataset<-tidy_data_set(fulldataset)
  write.table(tidydataset,file=".//data//tidydata.txt", row.name=FALSE)
  #write.table(tidydataset,file=".//data//tidydata.out")
  print(paste("output is at ", getwd(), "/data/tidydata.out", sep=""))
}



download_data<-function(){
    
  fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  if (!file.exists("data")){dir.create("data")}
  if (!file.exists(".//data//data_archive_bin.zip"))
  {
    print("downloading file")
    download.file(fileURL, destfile = ".//data//data_archive_bin.zip", method = "auto", mode="wb")
    DownloadDate1 <- date()
  }else print("file exists, skipping download")
  if (!file.exists(".//UCI HAR Dataset")){
    print("unzipping")
    unzip(".//data//data_archive_bin.zip")
  }else print("archive already unzipped, skipping unzipping")
}

clean_data<-function(){  
  listFiles<-unzip(".//data//data_archive_bin.zip", list=TRUE)
  
  #Loads the relevant data files
  print("loading data sets")
  datafile<-paste("./",as.character(listFiles$Name[[16]]), sep="")
  testsubject<-read.table(datafile)
  
  datafile<-paste("./",as.character(listFiles$Name[[17]]), sep="")
  testdata<-read.table(datafile)
  
  datafile<-paste("./",as.character(listFiles$Name[[18]]), sep="")
  testlabel<-read.table(datafile)
  
  datafile<-paste("./",as.character(listFiles$Name[[30]]), sep="")
  trainsubject<-read.table(datafile)
  
  datafile<-paste("./",as.character(listFiles$Name[[31]]), sep="")
  traindata<-read.table(datafile)
  
  datafile<-paste("./",as.character(listFiles$Name[[32]]), sep="")
  trainlabel<-read.table(datafile)
  
  datafile<-paste("./",as.character(listFiles$Name[[1]]), sep="")
  activitylabel<-read.table(datafile)
  
  datafile<-paste("./",as.character(listFiles$Name[[2]]), sep="")
  featureslabel<-read.table(datafile)
  
  
  #Uses descriptive activity names to name the activities in the data set (3)
  #Appropriately labels the data set with descriptive variable names. (4)
  print("tidying data sets")
  names(testdata)<-featureslabel$V2
  names(traindata)<-featureslabel$V2
  names(testlabel)<-"activity"
  names(trainlabel)<-"activity"
  names(testsubject)<-"subject"
  names(trainsubject)<-"subject"
  
  testdata<-cbind(testlabel,testsubject,testdata)
  traindata<-cbind(trainlabel,trainsubject,traindata)
  
  names(activitylabel)<-c("activity", "activityName")
  testdata<-merge(activitylabel,testdata, all=TRUE)
  traindata<-merge(activitylabel,traindata, all=TRUE)
  
  test<-data.frame("dataSet"=rep("test", dim(testdata)[1]))
  train<-data.frame("dataSet"=rep("train", dim(traindata)[1]))
  testdata<-cbind(test,testdata)
  traindata<-cbind(train,traindata)
  
  # Merges the training and the test sets to create one data set (1)
  print("merging data sets")
  mergeddata<-merge(testdata,traindata, all=TRUE)
  mergeddata
}

tidy_data_set<-function(mergeddata){
  #Extracts only the measurements on the mean and standard deviation 
  #for each measurement (2) 
  #It was decided to take all data obtained by averaging, including
  #the additional vectors
  meanindex<-grep(names(mergeddata),pattern="mean",ignore.case=TRUE)
  stdevindex<-grep(names(mergeddata),pattern="std",ignore.case=TRUE)
  
  MeanStddata<-select(mergeddata,c(1,2,3,4,meanindex,stdevindex))
  
  #Creates a second, independent tidy data set with the average of 
  #each variable for each activity and each subject. (5)
  print("creating tidy data set")
  activitydata<-group_by(MeanStddata, activityName, subject)
  tidydata<-summarise_each(select(activitydata, c(-1,-2)),funs(mean))
  tidydata
}