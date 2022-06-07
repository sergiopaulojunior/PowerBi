setwd("C:/Users/guga_/OneDrive/Documentos/Power_Bi/Cap_12")
getwd()

vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

library(ggplot2)

?qplot
qplot(Valor, Custo, data = vendas)
