#1_GetData.R
# File from AnalysisWorklowSkeleton
# Get data and store 

#PseduoCode to determine the month to store data in
month<-commandArgs(trailingOnly = TRUE)

if(length(month)<1){month="Jan"}

#Here, get some data from a csv file, but could easily be ODBC etc
srcdata<-read.csv("./data/cars.csv")

# Can either write data out to files (include some indication of dates ?) 
# or write the environment out

write.csv(srcdata, file=paste("./data/",month,"_SRC.csv", sep=""))
