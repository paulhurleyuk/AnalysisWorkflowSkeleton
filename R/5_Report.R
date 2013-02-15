# 5_Report.R
# File from AnalysisWorklowSkeleton
# Create a Report

require(knitr)

# load data
load(file="./data/dataimage")
srcdata<-read.csv(file="./data/processeddata.csv")

#produce reports
knitr::knit2html("./R/exampleReport.Rmd")