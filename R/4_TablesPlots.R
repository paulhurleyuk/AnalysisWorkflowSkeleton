# 4_TablesPlots.R
# File from AnalysisWorklowSkeleton
# create any tables, or plots required

require(plyr)
require(ggplot2)

#read data
srcdata<-read.csv(file="./data/processeddata.csv")

summarytable<-ddply(.data=srcdata, .(cyl, gear), nrow)

summaryplot<-ggplot(data=srcdata, aes(x=cyl, y=mpg))+
    geom_point(aes(colour=hp))

#write data out, here to an image
save(summarytable, summaryplot, file="./data/dataimage")
