#2_CleanData.R
# File from AnalysisWorklowSkeleton
# Clean up the data that has been read in

require(plyr)

#PseduoCode to determine the month to store data in
month<-commandArgs(trailingOnly = TRUE)

if(length(month)<1){month="Jan"}

#read the data in, either from file or image
srcdata<-read.csv(file=paste("./data/",month,"_SRC.csv", sep=""))

srcdata<-subset(srcdata, mpg<32)

#write the clean data out
write.csv(srcdata, file=paste("./data/",month,"_CLN.csv", sep=""))