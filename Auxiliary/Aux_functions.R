

#Call
library(vars)


### VAR Analysis

# Information criteria
# 1 = AIC(n)  2 = HQ(n)  3 = SC(n)  4 = FPE(n)

auto_var <- function(pmax = 6, Y = Y.d, info_criterion= 2){

  # Lag order selection
  pmax <- pmax
  popt <- VARselect(Y, type = "const")
  #popt
  p <- popt$selection[info_criterion] 

  # VAR estimation and summary
  Yd0 <- Y[1:pmax, ] # Initial values
  Ydt <- Y[p:nrow(Y), ]
  
  var1 <- VAR(Ydt, p=p, type = "const")
  summary1 <- summary(var1)
  m <- var1$K # Number of variables in the VAR
  N <- var1$obs # Number of effective sample observations, excluding "p" starting values
  
  # Testing
  VAR.roots <- roots(var1, modulus = TRUE)
  serial_test <- serial.test(var1, lags.bg = 12, type = "ES")

  # Return elements
  print(paste("Lag selection:", p))
  list_var <- list(m= m, N = N, p= p, Yd0= Yd0, summary1= summary1, var = var1, VAR.roots= VAR.roots, serial_test = serial_test)
  return(list_var)
}


  

auto_svar <- function(VAR){
  
  # A Matrix (as defined below, outside function)
  #Amat <<- diag(m)
  #for (i in 2:m) {
  #  for (j in 1:(i - 1)) {
  #    Amat[i, j] <- NA
  #  }
  #}
  
  # B Matrix (as defined below, outside function)
  #Bmat <<- matrix(0, m, m)
  #for (i in 1:m) {
  #  Bmat[i, i] <- NA
  #}
  
  # SVAR estimation (AB model configuration)
  SVAR <- SVAR(VAR, Amat = Amat, Bmat = Bmat, lrtest = FALSE)
  
  return(SVAR)

}

# A Matrix
Amat <- function(m){
  
  Amat <<- diag(m)
  for (i in 2:m) {
  for (j in 1:(i - 1)) {
    Amat[i, j] <- NA
    }
  }
return(Amat)
}

# B Matrix
Bmat <- function(m){
  Bmat <<- matrix(0, m, m)
  for (i in 1:m) {
    Bmat[i, i] <- NA
  }
return(Bmat)
}