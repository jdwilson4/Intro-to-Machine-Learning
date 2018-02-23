#First, set the directory to match the local directory for the TRAINING folder
#on your computer. Below, I give an example on my own personal computer.

training.directory <- "/Users/jdwilson4/Desktop/SPAM/TRAINING"

#Now load training and test files from the SPAM data set
training.names <- list.files(training.directory)

#next, load each email using the above file.names
training.emails <- list()
setwd(training.directory)

for(i in 1:length(file.names)){
  training.emails[[i]] <- readLines(training.names[i])
}

#install and load package for easy text analysis
library(stringr)

#now you can start to identify key words in these emails that are often associated with
#spam emails. As an example, let's count the number of times that the word "explosive" comes up in the 2nd message
sum(str_count(training.emails[[1]], "explosive"))

#You will use the above type of search to create a matrix of 20 or more binary
#variables to build into your classifier

#Training labels
labels <- read.table("/Users/jdwilson4/Desktop/CSDMC2010_SPAM/SPAMTrain.label")

#Now you can run with your Naive Bayes classifier!