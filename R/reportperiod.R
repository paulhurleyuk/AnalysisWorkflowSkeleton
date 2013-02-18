require(lubridate)

cat(format(floor_date(as.POSIXct(Sys.time())-10*24*60*60, unit="month"), format="%Y%b"))
