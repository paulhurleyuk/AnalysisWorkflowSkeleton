#1_GetData.R
# File from AnalysisWorklowSkeleton
# Get data and store 

require(lubridate)

source(file=normalizePath("./R/utils.R"))

#If the report period has been specified (i.e 2013Jan)
#then use it, otherwise, assume the current year/month
ReportPeriod<-commandArgs(trailingOnly = TRUE)
if(length(ReportPeriod)<1){ReportPeriod<-format(reportMonth(Sys.Date()), format="%Y%b")}

#Here, get some data from a csv file, but could easily be ODBC etc
srcdata<-read.csv("./data/cars.csv")

# Can either write data out to files (include some indication of dates ?) 
# or write the environment out

#For this initial process to get the data, try to pull in the old data and compare, 
#and only write out the data if diffeent

replaceFile=TRUE

if(file.exists(normalizePath(
  paste("./data/",ReportPeriod,"_SRC.csv", sep=""), 
  mustWork=FALSE))){
  olddata<-read.csv(file=normalizePath(
    paste("./data/",ReportPeriod,"_SRC.csv", sep=""), 
    mustWork=FALSE))
  if(length(which(srcdata != olddata))==0){
    #Files are identical, no need to update
    replaceFile=FALSE
  }
}

if(replaceFile){write.csv(srcdata, 
                          file=normalizePath(paste("./data/",ReportPeriod,"_SRC.csv", sep=""), 
                                             mustWork=FALSE), 
                          row.names=FALSE)
}