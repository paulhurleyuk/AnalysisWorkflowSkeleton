# 4_TablesPlots.R
# File from AnalysisWorklowSkeleton
# create any tables, or plots required

require(plyr)
require(ggplot2)

#PseduoCode to determine the month to store data in
month<-commandArgs(trailingOnly = TRUE)

if(length(month)<1){month="Jan"}

#read data
srcdata<-read.csv(file=paste("./data/",month,"_PROC.csv", sep=""))

summarytable<-ddply(.data=srcdata, .(cyl, gear), nrow)

summaryplot<-ggplot(data=srcdata, aes(x=cyl, y=mpg))+
    geom_point(aes(colour=hp))

#write data out, here to an image
save(summarytable, summaryplot, file=paste("./data/",month,"_RPTS", sep=""))
