## comment this out if you need a different version of R, 
## and set set R_HOME accordingly as an environment variable
R_HOME :=       $(shell R RHOME)

# Assign a data identifier. 
#IRL could use R to assign current if not specified as an arg to make
month :=     Jan

##To Build everything, list everything
all: exampleReport.html ./data/$(month)_PROC.csv ./data/$(month)_RPTS

##Build Report from processed data and reprots/tables
exampleReport.html: ./data/$(month)_PROC.csv ./data/$(month)_RPTS ./R/5_Report.R ./R/exampleReport.Rmd
	Rscript ./R/5_Report.R $(month)

#built reports/tables from processeddata.csv
./data/$(month)_RPTS: ./data/$(month)_PROC.csv ./R/4_TablesPlots.R
	Rscript ./R/4_TablesPlots.R $(month)

##built clean data from processeddata.csv
./data/$(month)_PROC.csv: ./data/$(month)_CLN.csv ./R/3_LoadData.R
	Rscript ./R/3_LoadData.R $(month)

##build clean data from source data
./data/$(month)_CLN.csv: ./data/$(month)_SRC.csv ./R/2_CleanData.R
	Rscript ./R/2_CleanData.R $(month)

##build source data
./data/$(month)_SRC.csv: ./R/1_GetData.R
	Rscript ./R/1_GetData.R $(month)

##clean everything up
clean: 
	rm ./data/$(month)_SRC.csv
	rm ./data/$(month)_CLN.csv
	rm ./data/$(month)_PROC.csv
	rm ./data/$(month)_RPTS
	rm exampleReport.html
  