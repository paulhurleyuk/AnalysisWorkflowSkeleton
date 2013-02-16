AnalysisWorkflowSkeleton
========================

A Skeleton for an R data analysis workflow

This is designed to be an automated analysis that leverages the power of make to deal with dependencies.  Key to this seems to be keeping the analysis modular.  Hence this worklfow has the following R files, all in ./R/

1. 1_GetData.R - Gets data and produces ./data/srcdata.csv
2. 2_CleanData.R - Takes the sourcedata.csv file and produces cleandata.csv
3. 3_LoadData.R - Takes cleandata.csv and produces processeddata.csv
4. 4_TablesPlots.R - Takes processeddata.csv and produces tables and plots, saves them in dataimage
5. 5_Report.R - Takes processeddata.csv and dataimage and produces a report

exampleReport.Rmd - An example report in R markdown

The makefile then specifies this order along with the dependencies.  Running make should update any steps that have been updated (i.e new data will run everything, change the Tables and Plots script will only run step 4 and 5)

ToDo: For more complicated analysis (like ongoing analysis where we want to analyse two months of data) need to work out how to store the data and keep the dependencies accurate, ie store data in months, need to know to update the analysis for Feb when the Feb dataset is incomplete but not once Feb is done.