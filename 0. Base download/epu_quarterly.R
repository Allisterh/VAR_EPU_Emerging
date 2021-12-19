# Call
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source("0. Base download\\EPU.R")
library(tsbox)
library(data.table)
library("TSstudio")

# Example: Brazil
brasil_epu <- as.numeric(epu_1997$Brazil)
brasil_epu <- ts(brasil_epu, start = c(1997, 01), frequency = 12)
brasil_epu <- window(brasil_epu,end = c(2020, 03))
brasil_epu <- ts_df(brasil_epu)
brasil_epu <- setDT(brasil_epu)
brasil_epu <- brasil_epu[, mean(value), keyby = .(year(time), quarter(time))]
brasil_epu <- as.numeric(brasil_epu$V1)
brasil_epu <- ts(brasil_epu, start = c(1997, 1), frequency = 4)


# Chile
chile_epu <- as.numeric(epu_1997$Chile)
chile_epu <- ts(chile_epu, start = c(1997, 01), frequency = 12)
chile_epu <- window(chile_epu,end = c(2020, 03))
chile_epu <- ts_df(chile_epu)
chile_epu <- setDT(chile_epu)
chile_epu <- chile_epu[, mean(value), keyby = .(year(time), quarter(time))]
chile_epu <- as.numeric(chile_epu$V1)
chile_epu <- ts(chile_epu, start = c(1997, 1), frequency = 4)

# Colombia
colombia_epu <- as.numeric(epu_1997$Colombia)
colombia_epu <- ts(colombia_epu, start = c(1997, 01), frequency = 12)
colombia_epu <- window(colombia_epu,end = c(2020, 03))
colombia_epu <- ts_df(colombia_epu)
colombia_epu <- setDT(colombia_epu)
colombia_epu <- colombia_epu[, mean(value), keyby = .(year(time), quarter(time))]
colombia_epu <- as.numeric(colombia_epu$V1)
colombia_epu <- ts(colombia_epu, start = c(1997, 1), frequency = 4)

# Greece
greece_epu <- as.numeric(epu_1997$Greece)
greece_epu <- ts(greece_epu, start = c(1997, 01), frequency = 12)
greece_epu <- window(greece_epu,end = c(2020, 03))
greece_epu <- ts_df(greece_epu)
greece_epu <- setDT(greece_epu)
greece_epu <- greece_epu[, mean(value), keyby = .(year(time), quarter(time))]
greece_epu <- as.numeric(greece_epu$V1)
greece_epu <- ts(greece_epu, start = c(1997, 1), frequency = 4)

# US
us_epu <- as.numeric(epu_1997$US)
us_epu <- ts(us_epu, start = c(1985, 01), frequency = 12)
us_epu <- window(us_epu,end = c(2020, 03))
us_epu <- ts_df(us_epu)
us_epu <- setDT(us_epu)
us_epu <- us_epu[, mean(value), keyby = .(year(time), quarter(time))]
us_epu <- as.numeric(us_epu$V1)
us_epu <- ts(us_epu, start = c(1997, 1), frequency = 4)

# Global
global_epu <- as.numeric(epu_1997$GEPU_ppp)
global_epu <- ts(global_epu, start = c(1997, 01), frequency = 12)
global_epu <- window(global_epu,end = c(2020, 03))
global_epu <- ts_df(global_epu)
global_epu <- setDT(global_epu)
global_epu <- global_epu[, mean(value), keyby = .(year(time), quarter(time))]
global_epu <- as.numeric(global_epu$V1)
global_epu <- ts(global_epu, start = c(1997, 1), frequency = 4)


# Correlations
epu_1997_for_corr <- epu_1997[-c(1)]
cor(epu_1997_for_corr)
