# Set directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#Call
source("2_Data_norm.R")
source("Auxiliar_ggplot.R")
library(vars)

# Make variables compatible
#greece_epu <- window(global_epu, start = c(1998,1))
#greece_fdi <- window(greece_fdi, start = c(1998,1))
#greece_pi <- window(greece_pi, start = c(1998,1))

# FDI: First ordering ####
Y <- cbind(greece_epu, greece_gdp, greece_fdi)
Y.d <- diff(Y) # Data in differences
#plot(Y.d)

# Set (for graph names)
country <- "greece"
investment <- "fdi"
model <- "gdp"
ordering <- "1"

### VAR Analysis
source("Aux_functions.R")
VAR_list <- auto_var(Y = Y.d)
VAR = VAR_list$var
m = VAR_list$m
Amat <-Amat(m)
Bmat <-Bmat(m)

# Check: IRF
#testing <- gen_irf(varmodel= VAR, Y = Y.d, H = 8, ort = FALSE, R =1000)

### SVAR
# Model
SVAR <- auto_svar(VAR = VAR)

# IRFs
source("Aux_irf.R")
SVAR_irfs <-  gen_irf(varmodel= SVAR , Y = Y.d, H = 8, ort = TRUE, R =1000)

# Check: IRFs
#irf1.1 <- irf(SVAR , impulse = "greece_gdp", response = "greece_epu", n.ahead = 8, ortho = TRUE, runs=1000, seed=101)
#irf1 <- irf(SVAR , n.ahead = 8, ortho = TRUE, runs=1000, seed=101)

# Loop: make all IRFs plots and export
source("Aux_ggplot.R")
for (i in SVAR_irfs){
  all_irfs <- graph(irf_est = i, col_fill = "darkorange1" , col_bounds = 'darkorange2' , col_irf = 'darkorange3', country = country, investment = investment, model = model, ordering = ordering)
}

# FDI: Second ordering ####
Y <- cbind(greece_gdp, greece_fdi, greece_epu)
Y.d <- diff(Y) # Data in differences
#plot(Y.d)

# Set (for graph names)
country <- "greece"
investment <- "fdi"
model <- "gdp"
ordering <- "2"

### VAR Analysis
source("Aux_functions.R")
VAR_list <- auto_var(Y = Y.d)
VAR = VAR_list$var
m = VAR_list$m
Amat <-Amat(m)
Bmat <-Bmat(m)

# Check: IRF
#testing <- gen_irf(varmodel= VAR, Y = Y.d, H = 8, ort = FALSE, R =1000)

### SVAR
# Model
SVAR <- auto_svar(VAR = VAR)

# IRFs
source("Aux_irf.R")
SVAR_irfs <-  gen_irf(varmodel= SVAR , Y = Y.d, H = 8, ort = TRUE, R =1000)

# Check: IRFs
#irf1.1 <- irf(SVAR , impulse = "greece_gdp", response = "greece_epu", n.ahead = 8, ortho = TRUE, runs=1000, seed=101)
#irf1 <- irf(SVAR , n.ahead = 8, ortho = TRUE, runs=1000, seed=101)

# Loop: make all IRFs plots and export
source("Aux_ggplot.R")

for (i in SVAR_irfs){
  all_irfs <- graph(irf_est = i, col_fill = "darkorange1" , col_bounds = 'darkorange2' , col_irf = 'darkorange3', country = country, investment = investment, model = model, ordering = ordering)
}

# PI: First ordering ####
Y <- cbind(greece_gdp, greece_pi, greece_epu)
Y.d <- diff(Y) # Data in differences
#plot(Y.d)

# Set (for graph names)
country <- "greece"
investment <- "pi"
model <- "gdp"
ordering <- "1"

### VAR Analysis
source("Aux_functions.R")
VAR_list <- auto_var(Y = Y.d)
VAR = VAR_list$var
m = VAR_list$m
Amat <-Amat(m)
Bmat <-Bmat(m)

# Check: IRF
#testing <- gen_irf(varmodel= VAR, Y = Y.d, H = 8, ort = FALSE, R =1000)

### SVAR
# Model
SVAR <- auto_svar(VAR = VAR)

# IRFs
source("Aux_irf.R")
SVAR_irfs <-  gen_irf(varmodel= SVAR , Y = Y.d, H = 8, ort = TRUE, R =1000)

# Check: IRFs
#irf1.1 <- irf(SVAR , impulse = "greece_gdp", response = "greece_epu", n.ahead = 8, ortho = TRUE, runs=1000, seed=101)
#irf1 <- irf(SVAR , n.ahead = 8, ortho = TRUE, runs=1000, seed=101)

# Loop: make all IRFs plots and export
source("Aux_ggplot.R")

for (i in SVAR_irfs){
  all_irfs <- graph(irf_est = i, col_fill = "midnightblue" , col_bounds = 'midnightblue' , col_irf = 'navyblue', country = country, investment = investment, model = model, ordering = ordering)
}

# PI: Second ordering ####
Y <- cbind(greece_gdp, greece_pi, greece_epu)
Y.d <- diff(Y) # Data in differences
#plot(Y.d)

# Set (for graph names)
country <- "greece"
investment <- "pi"
model <- "gdp"
ordering <- "2"

### VAR Analysis
source("Aux_functions.R")
VAR_list <- auto_var(Y = Y.d)
VAR = VAR_list$var
m = VAR_list$m
Amat <-Amat(m)
Bmat <-Bmat(m)

# Check: IRF
#testing <- gen_irf(varmodel= VAR, Y = Y.d, H = 8, ort = FALSE, R =1000)

### SVAR
# Model
SVAR <- auto_svar(VAR = VAR)

# IRFs
source("Aux_irf.R")
SVAR_irfs <-  gen_irf(varmodel= SVAR , Y = Y.d, H = 8, ort = TRUE, R =1000)

# Check: IRFs
#irf1.1 <- irf(SVAR , impulse = "greece_gdp", response = "greece_epu", n.ahead = 8, ortho = TRUE, runs=1000, seed=101)
#irf1 <- irf(SVAR , n.ahead = 8, ortho = TRUE, runs=1000, seed=101)

# Loop: make all IRFs plots and export
source("Aux_ggplot.R")

for (i in SVAR_irfs){
  all_irfs <- graph(irf_est = i, col_fill = "midnightblue" , col_bounds = 'midnightblue' , col_irf = 'navyblue', country = country, investment = investment, model = model, ordering = ordering)
}