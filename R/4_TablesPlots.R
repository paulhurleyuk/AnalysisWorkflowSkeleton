# 4_TablesPlots.R
# File from AnalysisWorklowSkeleton
# create any tables, or plots required

require(plyr)
require(ggplot2)

source(file=normalizePath("./R/utils.R"))

#If the report period has been specified (i.e 2013Jan)
#then use it, otherwise, assume the current year/month
ReportPeriod<-commandArgs(trailingOnly = TRUE)
if(length(ReportPeriod)<1){ReportPeriod<-format(reportMonth(Sys.Date()), format="%Y%b")}


#read data
srcdata<-read.csv(file=paste("./data/",ReportPeriod,"_PROC.csv", sep=""))

summarytable<-ddply(.data=srcdata, .(cyl, gear), nrow)

summaryplot<-ggplot(data=srcdata, aes(x=cyl, y=mpg))+
    geom_point(aes(colour=hp))

#write data out, here to an image
save(summarytable, summaryplot, file=paste("./data/",ReportPeriod,"_RPTS", sep=""))
