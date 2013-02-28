# 3_LoadData.R
# File from AnalysisWorklowSkeleton
# Process the data to do anything extra thats required
source(file=normalizePath("./R/utils.R"))

#If the report period has been specified (i.e 2013Jan)
#then use it, otherwise, assume the current year/month
ReportPeriod<-commandArgs(trailingOnly = TRUE)
if(length(ReportPeriod)<1){ReportPeriod<-format(reportMonth(Sys.Date()), format="%Y%b")}

# Load data
srcdata<-read.csv(file=paste("./data/", ReportPeriod,"_CLN.csv", sep=""))

srcdata$lp100km<-(1/srcdata$mpg)*100*4.54609188/1.609344

#1 Imperial Gallon (UK) = 4.54609188 litres
#1 mile = 1.609344 kilometres

#Write the data out
write.csv(srcdata, 
          file=normalizePath(paste("./data/",ReportPeriod,"_PROC.csv", sep=""),mustWork=FALSE), 
          row.names=FALSE)
