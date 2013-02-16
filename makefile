## comment this out if you need a different version of R, 
## and set set R_HOME accordingly as an environment variable
R_HOME :=       $(shell R RHOME)

##To Build everything, list everything
all: exampleReport.html ./data/processeddata.csv ./data/dataimage

##Build Report from processed data and reprots/tables
exampleReport.html: ./data/processeddata.csv ./data/dataimage ./R/5_Report.R ./R/exampleReport.Rmd
	Rscript ./R/5_Report.R

#built reports/tables from processeddata.csv
./data/dataimage: ./data/processeddata.csv ./R/4_TablesPlots.R
	Rscript ./R/4_TablesPlots.R

##built clean data from processeddata.csv
./data/processeddata.csv: ./data/cleandata.csv ./R/3_LoadData.R
	Rscript ./R/3_LoadData.R

##build clean data from source data
./data/cleandata.csv: ./data/srcdata.csv ./R/2_CleanData.R
	Rscript ./R/2_CleanData.R

##build source data
./data/srcdata.csv: ./R/1_GetData.R
	Rscript ./R/1_GetData.R

##clean everything up
clean: 
  