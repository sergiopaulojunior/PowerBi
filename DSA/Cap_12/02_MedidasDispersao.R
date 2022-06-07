#Parte2 - Medidas de Dispersão

#Definindo o caminho
setwd("C:/Users/guga_/OneDrive/Documentos/Power_Bi/Cap_12")
getwd()

#Carregando o dataset
vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

#variancia
var(vendas$Valor)

#desvio padrão
sd(vendas$Valor)

