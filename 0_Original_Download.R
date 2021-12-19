# Call
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source("0. Base download\\Download.R")
source("0. Base download\\epu_quarterly.R")

setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# FDI and PI, Current dollars ####
# (Foreign) Direct Investment
brasil_fdi_df <- download.BOP.20.03("BR", "BFD_BP6_USD")
brasil_fdi <- as.numeric(brasil_fdi_df$value)
brasil_fdi <- ts(brasil_fdi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
brasil_fdi <- window(brasil_fdi, start = c(1997, 01))
remove(brasil_fdi_df)

colombia_fdi_df <- download.BOP.20.03("CO", "BFD_BP6_USD")
colombia_fdi <- as.numeric(colombia_fdi_df$value)
colombia_fdi <- ts(colombia_fdi, start = c(1996, 01), end = c(2020, 1), frequency = 4)
colombia_fdi <- window(colombia_fdi, start = c(1997, 01))
remove(colombia_fdi_df)

greece_fdi_df <- download.BOP.20.03("GR", "BFD_BP6_USD")
greece_fdi <- as.numeric(greece_fdi_df$value)
greece_fdi <- ts(greece_fdi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
greece_fdi <- window(greece_fdi, start = c(1997, 01))
remove(greece_fdi_df)

chile_fdi_df <- download.BOP.20.03("CL", "BFD_BP6_USD")
chile_fdi <- as.numeric(chile_fdi_df$value)
chile_fdi <- ts(chile_fdi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
chile_fdi <- window(chile_fdi, start = c(1997, 01))
remove(chile_fdi_df)

# (Foreign) Portfolio Investment
brasil_pi_df <- download.BOP.20.03("BR", "BFP_BP6_USD")
brasil_pi <- as.numeric(brasil_pi_df$value)
brasil_pi <- ts(brasil_pi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
brasil_pi <- window(brasil_pi, start = c(1997, 01))
remove(brasil_pi_df)

colombia_pi_df <- download.BOP.20.03("CO", "BFP_BP6_USD")
colombia_pi <- as.numeric(colombia_pi_df$value)
colombia_pi <- ts(colombia_pi, start = c(1996, 01), end = c(2020, 1), frequency = 4)
colombia_pi <- window(colombia_pi, start = c(1997, 01))
remove(colombia_pi_df)

greece_pi_df <- download.BOP.20.03("GR", "BFP_BP6_USD")
greece_pi <- as.numeric(greece_pi_df$value)
greece_pi <- ts(greece_pi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
greece_pi <- window(greece_pi, start = c(1997, 01))
remove(greece_pi_df)

chile_pi_df <- download.BOP.20.03("CL", "BFP_BP6_USD")
chile_pi <- as.numeric(chile_pi_df$value)
chile_pi <- ts(chile_pi, start = c(1991, 01), end = c(2020, 1), frequency = 4)
chile_pi <- window(chile_pi, start = c(1997, 01))
remove(chile_pi_df)

# FDI and PI, Constant dollars (2015) ####
# Convert to 2015 prices with the US CPI:
# Consumer Price Index for USA. 2015 = 100
# Details: https://fred.stlouisfed.org/series/CPALTT01USQ661S

cpi.usa <- read.csv(url("https://fred.stlouisfed.org/graph/fredgraph.csv?bgcolor=%23e1e9f0&chart_type=line&drp=0&fo=open%20sans&graph_bgcolor=%23ffffff&height=450&mode=fred&recession_bars=on&txtcolor=%23444444&ts=12&tts=12&width=1168&nt=0&thu=0&trc=0&show_legend=yes&show_axis_titles=yes&show_tooltip=yes&id=CPALTT01USQ661S&scale=left&cosd=1960-01-01&coed=2020-07-01&line_color=%234572a7&link_values=false&line_style=solid&mark_type=none&mw=3&lw=2&ost=-99999&oet=99999&mma=0&fml=a&fq=Quarterly&fam=avg&fgst=lin&fgsnd=2020-02-01&line_index=1&transformation=lin&vintage_date=2020-11-27&revision_date=2020-11-27&nd=1960-01-01"))

cpi.usa <- as.numeric(cpi.usa$CPALTT01USQ661S)
cpi.usa <- ts(cpi.usa, start = c(1960, 1), end = c(2020, 3), frequency = 4)

# Limit the series:
cpi.1985 <- window(cpi.usa, start = c(1985, 1), end = c(2020, 1))
cpi.1997 <- window(cpi.usa, start = c(1997, 1), end = c(2020, 1))
cpi.2003 <- window(cpi.usa, start = c(2003, 1), end = c(2020, 1))

# Deflact variables:
brasil_fdi <- brasil_fdi / cpi.1997
brasil_pi <- brasil_pi / cpi.1997

colombia_fdi <- colombia_fdi / cpi.1997
colombia_pi <- colombia_pi / cpi.1997

greece_fdi <- greece_fdi / cpi.1997
greece_pi <- greece_pi / cpi.1997

chile_fdi <- chile_fdi / cpi.1997
chile_pi <- chile_pi / cpi.1997

# Proxy for international interest rate ####

# Effective Federal Funds Rate (FEDFUNDS)
# Details: https://fred.stlouisfed.org/series/FEDFUNDS

fed.rate <- read.csv(url("https://fred.stlouisfed.org/graph/fredgraph.csv?bgcolor=%23e1e9f0&chart_type=line&drp=0&fo=open%20sans&graph_bgcolor=%23ffffff&height=450&mode=fred&recession_bars=on&txtcolor=%23444444&ts=12&tts=12&width=1168&nt=0&thu=0&trc=0&show_legend=yes&show_axis_titles=yes&show_tooltip=yes&id=FEDFUNDS&scale=left&cosd=1954-07-01&coed=2020-10-01&line_color=%234572a7&link_values=false&line_style=solid&mark_type=none&mw=3&lw=2&ost=-99999&oet=99999&mma=0&fml=a&fq=Quarterly&fam=avg&fgst=lin&fgsnd=2020-02-01&line_index=1&transformation=lin&vintage_date=2020-11-27&revision_date=2020-11-27&nd=1954-07-01"))

fed.rate <- as.numeric(fed.rate$FEDFUNDS)
fed.rate <- ts(fed.rate, start = c(1954, 3), end = c(2020, 4), frequency = 4)

fedrate.1985 <- window(fed.rate, start = c(1985, 1), end = c(2020, 1))
fedrate.1997 <- window(fed.rate, start = c(1997, 1), end = c(2020, 1))
fedrate.2003 <- window(fed.rate, start = c(2003, 1), end = c(2020, 1))

# Delete base variables
remove(cpi.usa, fed.rate)


# Proxy for "country risk" ####

# JP Morgan´s EMBI 
# Downloaded from Global Economic Monitor (World Bank)
# Data for "Developing Countries"
# https://databank.worldbank.org/reports.aspx?source=1179&series=EMBIG#

# Read and transform
embi <- read_excel("Inputs\\Data_Extract_FromGlobal Economic Monitor (GEM).xlsx", n_max =1)
# Drop last observations (only reported on mensual basis)
embi <- subset(embi, select = -c(Annual, Monthly,Quarterly))

# Transform
library(data.table)
embi_transpose <- transpose(embi)
embi_transpose$time <- colnames(embi)
names(embi_transpose)[1] <- "embi"
#Drop years and errors
embi_transpose <- embi_transpose[-c(2, 10,16,29),]
#Drop missing values (we start in 1998 because we need a full quarter, 1997M12 is useless)
embi_transpose <- embi_transpose[-c(1:133),]


# Convert to time-series format
embi.ts <- as.numeric(sub(",", "", embi_transpose$embi, fixed = TRUE))
embi.ts <- ts(embi.ts, start=c(1998,1), end = c(2020,7), frequency = 12)
embi.ts <- window(embi.ts, end = c(2020,03))
# Convert to quartery data
library(tsbox)
library(data.table)
library("TSstudio")

embi.ts <- ts_df(embi.ts)
embi.ts <- setDT(embi.ts)
embi.ts <- embi.ts[, mean(value), keyby = .(year(time), quarter(time))]
embi.ts <- as.numeric(embi.ts$V1)
embi.ts <- ts(embi.ts, start = c(1998, 1), frequency = 4)

# Final time-series variable:
embi <- embi.ts


# Remove auxiliary elements
remove(embi.ts, embi_transpose)




# Save and export ####

# First, export EPU data (dataframes and series)
write.csv(epu, "Inputs\\epu.csv", row.names = FALSE)
write.csv(epu_1991, "Inputs\\epu_1991.csv", row.names = FALSE)
write.csv(epu_1997, "Inputs\\epu_1997.csv", row.names = FALSE)
write.csv(epu_1997, "Inputs\\epu_1997.csv", row.names = FALSE)
write.csv(epu_1997_for_corr, "Inputs\\epu_1997_for_corr.csv", row.names = FALSE)
write.csv(epu_2003, "Inputs\\epu_2003.csv", row.names = FALSE)
write.csv(epu_all, "Inputs\\epu_all.csv", row.names = FALSE)
write.csv(epu_full, "Inputs\\epu_full.csv", row.names = FALSE)

write.csv(brasil_epu, "Inputs\\brazil_epu.csv", row.names = FALSE)
write.csv(chile_epu, "Inputs\\chile_epu.csv", row.names = FALSE)
write.csv(colombia_epu, "Inputs\\colombia_epu.csv", row.names = FALSE)
write.csv(greece_epu, "Inputs\\greece_epu.csv", row.names = FALSE)
write.csv(us_epu, "Inputs\\us_epu.csv", row.names = FALSE)


# After, export IMF data (series)
write.csv(brasil_fdi, "Inputs\\brazil_fdi.csv",row.names = FALSE)
write.csv(brasil_pi, "Inputs\\brazil_pi.csv",row.names = FALSE)

write.csv(chile_fdi, "Inputs\\chile_fdi.csv",row.names = FALSE)
write.csv(chile_pi, "Inputs\\chile_pi.csv",row.names = FALSE)

write.csv(colombia_fdi, "Inputs\\colombia_fdi.csv",row.names = FALSE)
write.csv(colombia_pi, "Inputs\\colombia_pi.csv",row.names = FALSE)

write.csv(greece_fdi, "Inputs\\greece_fdi.csv",row.names = FALSE)
write.csv(greece_pi, "Inputs\\greece_pi.csv",row.names = FALSE)

# Finally, other data (series)
write.csv(cpi.1985, "Inputs\\cpi_1985.csv",row.names = FALSE)
write.csv(cpi.1997, "Inputs\\cpi_1997.csv",row.names = FALSE)
write.csv(cpi.2003, "Inputs\\cpi_2003.csv",row.names = FALSE)

write.csv(embi, "Inputs\\embi.csv",row.names = FALSE)

write.csv(fedrate.1985, "Inputs\\fedrate_1985.csv",row.names = FALSE)
write.csv(fedrate.1997, "Inputs\\fedrate_1997.csv",row.names = FALSE)
write.csv(fedrate.2003, "Inputs\\fedrate_2003.csv",row.names = FALSE)

