#2_CleanData.R
# File from AnalysisWorklowSkeleton
# Clean up the data that has been read in

require(plyr)

source(file=normalizePath("./R/utils.R"))

#If the report period has been specified (i.e 2013Jan)
#then use it, otherwise, assume the current year/month
ReportPeriod<-commandArgs(trailingOnly = TRUE)
if(length(ReportPeriod)<1){ReportPeriod<-format(reportMonth(Sys.Date()), format="%Y%b")}


#read the data in, either from file or image
srcdata<-read.csv(file=paste("./data/",ReportPeriod,"_SRC.csv", sep=""), stringsAsFactors=FALSE)

srcdata<-subset(srcdata, mpg<32)

#write the clean data out
write.csv(srcdata, 
          file=normalizePath(paste("./data/",ReportPeriod,"_CLN.csv", sep=""),mustWork=FALSE), 
          row.names=FALSE)