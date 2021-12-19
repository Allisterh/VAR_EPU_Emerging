# A function to generate graphs with ggplot
# Arguments:
# irf_est: the IRF estimated
# H: the horizon


# Load
library(tidyverse)
library(reshape2)
library("ggthemes")




grafico <- function(irf_est, H = 8, col_fill = "goldenrod2" , col_bounds = "goldenrod3" , col_irf = "goldenrod3", alpha_fill = 0.6) {
  t = c(0:H)
  datos <- data.frame(t, irf_est$Lower, irf_est$irf, irf_est$Upper)
  colnames(datos) <- c("t", "lb", "pe", "ub")
  grafico <- ggplot(data=datos,aes(x= t, y=pe))
  grafico <- grafico + scale_x_continuous(expand = c(0, 0), limits = c(0, NA))
  grafico <- grafico + geom_hline(yintercept = 0, colour = "black", size= 0.5)
  grafico <- grafico + geom_ribbon(aes(x=t, ymax=ub, ymin=lb), fill= col_fill, alpha= alpha_fill) 
  grafico <-  grafico +geom_line(aes(y = ub), colour = col_bounds, linetype = "dashed") 
  grafico <-  grafico + geom_line(aes(y = lb), colour = col_bounds, linetype = "dashed")
  grafico <- grafico + geom_line(colour = col_irf, size =1.05)
  grafico <- grafico + labs(x = "Quarters", y =" ", title = "", subtitle = "")
  grafico <- grafico + theme_classic()
  grafico <- grafico + theme(axis.ticks = element_blank())
  
  
  grafico
  #png(file=paste(deparse(substitute(SVAR_name)), ".ERPT.boot", ".png", sep=""),  width=800, height=600)
}
