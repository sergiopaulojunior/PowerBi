#Parte3 - Medidas de Posição Relativa - Percentil, Quartil

#Definindo o caminho
setwd("C:/Users/guga_/OneDrive/Documentos/Power_Bi/Cap_12")
getwd()

#Carregando o dataset
vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

#Resumo dos dados
head(vendas)
tail(vendas)
View(vendas)

#Medidas de Tendencia Central
summary(vendas$Valor)
summary(vendas[c('Valor', 'Custo')])# c - vetor

#Explorando Variaveis Numéricas
mean(vendas$Valor)
median(vendas$Valor)
quantile(vendas$Valor)
quantile(vendas$Valor, probs = c(0.01, 0.99))
quantile(vendas$Valor, seq(from = 0, to = 1, by = 0.20))#percentil de 20 em 20
IQR(vendas$Valor)#Diferença entre Q3 e Q1
range(vendas$Valor)# minimo e máximo
summary(vendas$Valor)
diff(range(vendas$Valor))# diferença entre minimo e maximo
