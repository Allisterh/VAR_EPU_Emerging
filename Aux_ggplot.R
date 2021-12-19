# A function in order to generate graphs with ggplot
# Arguments:
# irf_est: the IRF estimated
# H: the horizon


#Paquetes necesarios
library(tidyverse)
library(reshape2)
library("ggthemes")




graph <- function(irf_est, H = 8, col_fill = "goldenrod2" , col_bounds = "goldenrod3" , col_irf = "goldenrod3", alpha_fill = 0.6, country = "BR" ,investment = "fdi", model = "embi", ordering = "1") {
  
  ## Graph with ggplot
  t = c(0:H)
  datos <- data.frame(t, irf_est$Lower, irf_est$irf, irf_est$Upper)
  colnames(datos) <- c("t", "lb", "pe", "ub")
  graph <- ggplot(data=datos,aes(x= t, y=pe))
  graph <- graph + scale_x_continuous(expand = c(0, 0), limits = c(0, NA))
  graph <- graph + geom_hline(yintercept = 0, colour = "black", size= 0.5)
  graph <- graph + geom_ribbon(aes(x=t, ymax=ub, ymin=lb), fill= col_fill, alpha= alpha_fill) 
  graph <-  graph +geom_line(aes(y = ub), colour = col_bounds, linetype = "dashed") 
  graph <-  graph + geom_line(aes(y = lb), colour = col_bounds, linetype = "dashed")
  graph <- graph + geom_line(colour = col_irf, size =1.05)
  graph <- graph + labs(x = "Quarters", y =" ", title = "", subtitle = "")
  graph <- graph + theme_classic()
  graph <- graph + theme(axis.ticks = element_blank(), 
                         axis.text.x = element_text(size = 12),
                         axis.text.y = element_text(size = 11),
                         axis.title.x = element_text(size = 12),
                         axis.title.y = element_text(size = 12))
  
  graph
  
  ## Save
  # Aux variables
  impulse=irf_est[5]
  response=irf_est[4]
  model_name = paste0("model_", model)
  ord = paste0("ord", ordering)
  
  file_name = paste(country,investment, model_name, ord, impulse, "to", response, ".png", sep="-")
  
  ggsave(file_name, path = "Outputs//Graphs//", width = 10, height = 8, units = "cm")
  
  # Text with status
  print(paste0("Saving image: ", paste(country,investment, model_name, ord, impulse, "to", response, ".png", sep="-")))
  #filename = paste0("Outputs//Graphs//",country, colnames(Y)[i], "to", colnames(Y)[j], ".png", sep="")
  #png(file=paste(deparse(substitute(SVAR_name)), ".ERPT.boot", ".png", sep=""),  width=800, height=600)
}
