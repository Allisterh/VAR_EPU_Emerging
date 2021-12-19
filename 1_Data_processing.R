# Set current directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Call
library(readxl)

# EPU ####
brazil_epu <- read.csv("Inputs\\brazil_epu.csv")
brazil_epu <- ts(brazil_epu, start = c(1997, 1), frequency = 4)

chile_epu <- read.csv("Inputs\\chile_epu.csv")
chile_epu <- ts(chile_epu, start = c(1997, 1), frequency = 4)

colombia_epu <- read.csv("Inputs\\colombia_epu.csv")
colombia_epu <- ts(colombia_epu, start = c(1997, 1), frequency = 4)

greece_epu <- read.csv("Inputs\\greece_epu.csv")
greece_epu <- ts(greece_epu, start = c(1997, 1), frequency = 4)

global_epu <- read.csv("Inputs\\global_epu.csv")
global_epu <- ts(global_epu, start = c(1997, 1), frequency = 4)

us_epu <- read.csv("Inputs\\us_epu.csv")
us_epu <- ts(us_epu, start = c(1997, 1), frequency = 4)


# FDI and PI, Current dollars ####
# (Foreign) Direct Investment
brazil_fdi <- read.csv("Inputs\\brazil_fdi.csv")
brazil_fdi <- ts(brazil_fdi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
brazil_fdi <- window(brazil_fdi, start = c(1997, 01))

chile_fdi <- read.csv("Inputs\\chile_fdi.csv")
chile_fdi <- ts(chile_fdi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
chile_fdi <- window(chile_fdi, start = c(1997, 01))

colombia_fdi <- read.csv("Inputs\\colombia_fdi.csv")
colombia_fdi <- ts(colombia_fdi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
colombia_fdi <- window(colombia_fdi, start = c(1997, 01))

greece_fdi <- read.csv("Inputs\\greece_fdi.csv")
greece_fdi <- ts(greece_fdi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
greece_fdi <- window(greece_fdi, start = c(1997, 01))


# (Foreign) Portfolio Investment
brazil_pi <- read.csv("Inputs\\brazil_pi.csv")
brazil_pi <- ts(brazil_pi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
brazil_pi <- window(brazil_pi, start = c(1997, 01))

chile_pi <- read.csv("Inputs\\chile_pi.csv")
chile_pi <- ts(chile_pi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
chile_pi <- window(chile_pi, start = c(1997, 01))

colombia_pi <- read.csv("Inputs\\colombia_pi.csv")
colombia_pi <- ts(colombia_pi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
colombia_pi <- window(colombia_pi, start = c(1997, 01))

greece_pi <- read.csv("Inputs\\greece_pi.csv")
greece_pi <- ts(greece_pi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
greece_pi <- window(greece_pi, start = c(1997, 01))




# FDI and PI, Constant dollars (2015) ####
# Convert to 2015 prices with the US CPI:
# Consumer Price Index for USA. 2015 = 100
# Details: https://fred.stlouisfed.org/series/CPALTT01USQ661S

cpi.1997 <- read.csv("Inputs\\cpi_1997.csv")
cpi.1997 <- ts(cpi.1997, start = c(1997, 1), frequency = 4)

# Deflate variables:
brazil_fdi <- brazil_fdi / cpi.1997
brazil_pi <- brazil_pi / cpi.1997

chile_fdi <- chile_fdi / cpi.1997
chile_pi <- chile_pi / cpi.1997

colombia_fdi <- colombia_fdi / cpi.1997
colombia_pi <- colombia_pi / cpi.1997

greece_fdi <- greece_fdi / cpi.1997
greece_pi <- greece_pi / cpi.1997


# Quarterly Real GDP ####
# Source: IMF (International Financial Statistics Dataset)
# Data with Quarterly Frequency and Seasonally Adjusted
brazil_gdp_df <- read_excel("Inputs\\IMF_Brazil_GDP.xlsx", sheet="Real")
brazil_gdp <- ts(as.numeric(brazil_gdp_df$`Real GDP, SA`), start= c(1996,1), frequency=4)
brazil_gdp <- window(brazil_gdp, start = c(1997, 1), end = c(2020, 1))
remove(brazil_gdp_df)

chile_gdp_df <- read_excel("Inputs\\IMF_Chile_GDP.xlsx", sheet="Real")
chile_gdp <- ts(as.numeric(chile_gdp_df$`Real GDP, SA`), start= c(1996,1), frequency=4)
chile_gdp <- window(chile_gdp, start = c(1997, 1), end = c(2020, 1))
remove(chile_gdp_df)

colombia_gdp_df <- read_excel("Inputs\\IMF_Colombia_GDP.xlsx", sheet="Real")
colombia_gdp <- ts(as.numeric(colombia_gdp_df$`Real GDP, SA`), start= c(2005,1), frequency=4)
colombia_gdp <- window(colombia_gdp, start = c(1997, 1), end = c(2020, 1))
remove(colombia_gdp_df)

greece_gdp_df <- read_excel("Inputs\\IMF_Greece_GDP.xlsx", sheet="Real")
greece_gdp <- ts(as.numeric(greece_gdp_df$`Real GDP, SA`), start= c(1995,1), frequency=4)
greece_gdp <- window(greece_gdp, start = c(1997, 1), end = c(2020, 1))
remove(greece_gdp_df)


# Proxy for international interest rate ####

# Effective Federal Funds Rate (FEDFUNDS)
# Details: https://fred.stlouisfed.org/series/FEDFUNDS

fedrate.1985 <- read.csv("Inputs\\fedrate_1985.csv")
fedrate.1985 <- ts(fedrate.1985, start = c(1985, 1), frequency = 4)

fedrate.1997 <- read.csv("Inputs\\fedrate_1997.csv")
fedrate.1997 <- ts(fedrate.1997, start = c(1997, 1), frequency = 4)

fedrate.2003 <- read.csv("Inputs\\fedrate_2003.csv")
fedrate.2003 <- ts(fedrate.2003, start = c(2003, 1), frequency = 4)


# Proxy for "country risk" ####

# JP Morgan´s EMBI 
# Downnloaded from Global Economic Monitor (World Bank)
# Data for "Developing Countries"
# https://databank.worldbank.org/reports.aspx?source=1179&series=EMBIG#

embi <- read.csv("Inputs\\embi.csv")
embi <- ts(embi, start=c(1998,1), frequency = 4)
