# 5_Report.R
# File from AnalysisWorklowSkeleton
# Create a Report

require(knitr)
source(file=normalizePath("./R/utils.R"))

#If the report period has been specified (i.e 2013Jan)
#then use it, otherwise, assume the current year/month
ReportPeriod<-commandArgs(trailingOnly = TRUE)
if(length(ReportPeriod)<1){ReportPeriod<-format(reportMonth(Sys.Date()), format="%Y%b")}

# load data
load(file=paste("./data/",ReportPeriod,"_RPTS", sep=""))
srcdata<-read.csv(paste("./data/",ReportPeriod,"_PROC.csv", sep=""), 
                  stringsAsFactors=FALSE)

#produce reports
knitr::knit2html("./R/exampleReport.Rmd")