#2_CleanData.R
# File from AnalysisWorklowSkeleton
# Clean up the data that has been read in

require(plyr)

#read the data in, either from file or image
srcdata<-read.csv(file="./data/srcdata.csv")

srcdata<-subset(srcdata, mpg<32)

#write the clean data out
write.csv(srcdata, file="./data/cleandata.csv")