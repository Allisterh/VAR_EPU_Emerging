# Set current directory and call
#setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
source("1-2. Data\\1_Data_processing.R")

# Normalize: Variables with mean 0 and unit variance ####
brazil_epu <- (brazil_epu -mean(brazil_epu))/sd(brazil_epu)
chile_epu <- (chile_epu -mean(chile_epu))/sd(chile_epu)
colombia_epu <- (colombia_epu -mean(colombia_epu))/sd(colombia_epu)
greece_epu <- (greece_epu -mean(greece_epu))/sd(greece_epu)
global_epu <- (global_epu -mean(global_epu))/sd(global_epu)

brazil_pi <- (brazil_pi -mean(brazil_pi))/sd(brazil_pi)
chile_pi <- (chile_pi -mean(chile_pi))/sd(chile_pi)
colombia_pi <- (colombia_pi -mean(colombia_pi))/sd(colombia_pi)
greece_pi <- (greece_pi -mean(greece_pi))/sd(greece_pi)

brazil_fdi <- (brazil_fdi -mean(brazil_fdi))/sd(brazil_fdi)
chile_fdi <- (chile_fdi -mean(chile_fdi))/sd(chile_fdi)
colombia_fdi <- (colombia_fdi -mean(colombia_fdi))/sd(colombia_fdi)
greece_fdi <- (greece_fdi -mean(greece_fdi))/sd(greece_fdi)

brazil_gdp <- (brazil_gdp - mean(brazil_gdp))/sd(brazil_gdp)
chile_gdp <- (chile_gdp - mean(chile_gdp))/sd(chile_gdp)
colombia_gdp <- (colombia_gdp - mean(colombia_gdp))/sd(colombia_gdp)
greece_gdp <- (greece_gdp - mean(greece_gdp))/sd(greece_gdp)

fedrate.1985 <-(fedrate.1985 -mean(fedrate.1985))/sd(fedrate.1985)
fedrate.1997 <- (fedrate.1997 -mean(fedrate.1997))/sd(fedrate.1997)
fedrate.2003 <- (fedrate.2003 -mean(fedrate.2003))/sd(fedrate.2003)

embi <- (embi - mean(embi))/sd(embi)

