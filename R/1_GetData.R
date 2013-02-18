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

write.csv(srcdata, file=paste("./data/",ReportPeriod,"_SRC.csv", sep=""))
