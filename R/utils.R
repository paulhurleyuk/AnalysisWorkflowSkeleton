reportMonth<-function(pdate, interval=10){
  require(lubridate)
  return(floor_date(as.POSIXct(pdate)-interval*24*60*60, unit="month"))
}

ReportPeriod<-function(pdate=as.POSIXct(Sys.time())){
  require(lubridate)
  return(format(reportMonth(pdate), format="%Y%b"))}