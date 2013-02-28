# 4_TablesPlots.R
# File from AnalysisWorklowSkeleton
# create any tables, or plots required

require(plyr)
require(ggplot2)

source(file=normalizePath("./R/utils.R"))
objToSave<-vector()

#If the report period has been specified (i.e 2013Jan)
#then use it, otherwise, assume the current year/month
ReportPeriod<-commandArgs(trailingOnly = TRUE)
if(length(ReportPeriod)<1){ReportPeriod<-format(reportMonth(Sys.Date()), 
                                                format="%Y%b")}

#read data
srcdata<-read.csv(file=paste("./data/",ReportPeriod,"_PROC.csv", sep=""),
                  stringsAsFactors=FALSE)

summarytable<-ddply(.data=srcdata, .(cyl, gear), nrow)
objToSave[length(objToSave)+1]<-"summarytable"

summaryplot<-ggplot(data=srcdata, aes(x=cyl, y=mpg))+
    geom_point(aes(colour=hp))
objToSave[length(objToSave)+1]<-"summaryplot"

#write data out, here to an image
save(list=objToSave, file=paste("./data/",ReportPeriod,"_RPTS", sep=""))
