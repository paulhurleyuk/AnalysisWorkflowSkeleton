# 5_Report.R
# File from AnalysisWorklowSkeleton
# Create a Report

require(knitr)

#PseduoCode to determine the month to store data in
month<-commandArgs(trailingOnly = TRUE)

if(length(month)<1){month="Jan"}

# load data
load(file=paste("./data/",month,"_RPTS", sep=""))
srcdata<-read.csv(paste("./data/",month,"_PROC.csv", sep=""))

#produce reports
knitr::knit2html("./R/exampleReport.Rmd")