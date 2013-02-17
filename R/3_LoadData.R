# 3_LoadData.R
# File from AnalysisWorklowSkeleton
# Process the data to do anything extra thats required

#PseduoCode to determine the month to store data in
month<-commandArgs(trailingOnly = TRUE)

if(length(month)<1){month="Jan"}

# Load data
srcdata<-read.csv(file=paste("./data/",month,"_CLN.csv", sep=""))

srcdata$lp100km<-(1/srcdata$mpg)*100*4.54609188/1.609344

#1 Imperial Gallon (UK) = 4.54609188 litres
#1 mile = 1.609344 kilometres

#Write the data out
write.csv(srcdata, file=paste("./data/",month,"_PROC.csv", sep=""))
