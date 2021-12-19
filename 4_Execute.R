### ### ### ### ### ###

# Economic Policy Uncertainty - Visualization

# 

# Franco Nuñez

### ### ### ### ### ###

# Set directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# These two lines check and install packages if needed
if (!require("pacman")) install.packages("pacman")
pacman::p_load(vars, ggplot2, tidyverse, reshape2, "ggthemes", readxl)


# Brazil ####
# Model with Embi Index
source("3_Analysis_Brazil_3variables_embi.R")
# Model with Fed funds rate
source("3_Analysis_Brazil_3variables_fedrate.R")
# Model with Global EPU Index
source("3_Analysis_Brazil_3variables_globalepu.R")

# Different ordering: model with GDP
source("3_Analysis_Brazil_3variables_gdp.R")

# Chile ####
# Model with Embi Index
source("3_Analysis_Chile_3variables_embi.R")
# Model with Fed funds rate
source("3_Analysis_Chile_3variables_fedrate.R")
# Model with Global EPU Index
source("3_Analysis_Chile_3variables_globalepu.R")

# Different ordering: model with GDP
source("3_Analysis_Chile_3variables_gdp.R")

# Colombia ####
# Model with Embi Index
source("3_Analysis_Colombia_3variables_embi.R")
# Model with Fed funds rate
source("3_Analysis_Colombia_3variables_fedrate.R")
# Model with Global EPU Index
source("3_Analysis_Colombia_3variables_globalepu.R")

# Different ordering: model with GDP
# Important. The sample of this model is different. For the other countries,
# the sample starts in 1997Q1; for Colombia (due to data availability), it starts
# in 2005Q1.
source("3_Analysis_Colombia_3variables_gdp.R")


# Greece ####
# Model with Embi Index
source("3_Analysis_Greece_3variables_embi.R")
# Model with Fed funds rate
source("3_Analysis_Greece_3variables_fedrate.R")
# Model with Global EPU Index
source("3_Analysis_Greece_3variables_globalepu.R")

# Different ordering: model with GDP
source("3_Analysis_Greece_3variables_gdp.R")



