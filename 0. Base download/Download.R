
# Function to download IMF data with API

# Packages:
library(IMFData)
#library(tidyverse)
# Define function

download.BOP.20.03 <- function(country, variables = c("BCA_BP6_USD"), frequen = "Q", databaseID = "BOP", startdate = "1991-01-01", enddate = "2020-03-31", checkquery = FALSE) {
  
  queryfilter <- list(CL_FREQ = frequen, CL_AREA_BOP_2020M3 = country, CL_INDICATOR_BOP_2020M3 = variables)
  
  country <- CompactDataMethod(databaseID, queryfilter, startdate, enddate,  checkquery)
  country.df <- as.data.frame(CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery, tidy = TRUE))
  country.df <- data.frame("período" = country.df$"@TIME_PERIOD", "value" = country.df$"@OBS_VALUE")
  #drop <- c("@OFFICIAL_BPM", "@FREQ", "@UNIT_MULT", "@TIME_FORMAT")
  #country.df <-  country.df[,!(names(country.df) %in% drop)]
  #country.df <- setNames(country.df, c("Period", "Value", "Country", "Indicator"))
  #colnames(country.df) <- c("Period", "Value", "Country", "Indicator")
  #remove(drop)
}

download.IFS <- function(country, variables , frequen = "Q", databaseID = "IFS", startdate = "1991-01-01", enddate = "2020-03-31", checkquery = FALSE) {
  
  queryfilter <- list(CL_FREQ = frequen, CL_AREA_IFS = country, CL_INDICATOR_IFS = variables)
  
  country <- CompactDataMethod(databaseID, queryfilter, startdate, enddate,  checkquery)
  country.df <- as.data.frame(CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery, tidy = TRUE))
  country.df <- data.frame("período" = country.df$"@TIME_PERIOD", "value" = country.df$"@OBS_VALUE")
}

download.SNA <- function(country, variables , frequen = "Q", databaseID = "SNA", startdate = "1991-01-01", enddate = "2020-03-31", checkquery = FALSE) {
  
  queryfilter <- list(CL_FREQ = frequen, CL_AREA_SNA = country, CL_INDICATOR_SNA = variables)
  
  country <- CompactDataMethod(databaseID, queryfilter, startdate, enddate,  checkquery)
  country.df <- as.data.frame(CompactDataMethod(databaseID, queryfilter, startdate, enddate, checkquery, tidy = TRUE))
  country.df <- data.frame("período" = country.df$"@TIME_PERIOD", "value" = country.df$"@OBS_VALUE")
}




# Test
#testing_ar <- download.BOP.20.03("AR")
#plot(testing_ar$CAB)