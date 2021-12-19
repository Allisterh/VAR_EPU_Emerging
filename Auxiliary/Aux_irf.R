# A function for generating all the IRFs and Orthogonalized IRFs. 3 variables
# Arguments:
# varmodel:
# Y: the vector of variables included in the var. Example : Y = (gdp, epu, fdi)
# H: horizon, the "X axis" for the IRF plot
# ort: if TRUE, generates an orthogonalized IRF. If FALSE, generates a IRF.
# R: number of replications in the bootstrap


library(vars)

gen_irf <- function(varmodel= var1, Y = Y, H = 8, ort = TRUE, R =1000, seed_number= 101){
  irf1.1 <- irf(varmodel, impulse = colnames(Y)[1], response = colnames(Y)[1], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  irf1.2 <- irf(varmodel, impulse = colnames(Y)[1], response = colnames(Y)[2], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  irf1.3 <- irf(varmodel, impulse = colnames(Y)[1], response = colnames(Y)[3], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  
  irf2.1 <- irf(varmodel, impulse = colnames(Y)[2], response = colnames(Y)[1], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  irf2.2 <- irf(varmodel, impulse = colnames(Y)[2], response = colnames(Y)[2], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  irf2.3 <- irf(varmodel, impulse = colnames(Y)[2], response = colnames(Y)[3], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  
  
  irf3.1 <- irf(varmodel, impulse = colnames(Y)[3], response = colnames(Y)[1], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  irf3.2 <- irf(varmodel, impulse = colnames(Y)[3], response = colnames(Y)[2], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  irf3.3 <- irf(varmodel, impulse = colnames(Y)[3], response = colnames(Y)[3], n.ahead = H, ortho = ort, runs = R, seed= seed_number)
  
  list_irf <- list(irf1.1 = irf1.1, irf1.2 = irf1.2, irf1.3 = irf1.3, irf2.1 = irf2.1, irf1.2 = irf2.2, irf2.3 = irf2.3, irf3.1 = irf3.1, irf3.2 = irf3.2, irf3.3 = irf3.3)
  return(list_irf)
  
}