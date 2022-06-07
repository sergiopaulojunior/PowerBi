#Estatistica Basica

#Parte1 - Medidas de posição

#Definindo o caminho
setwd("C:/Users/guga_/OneDrive/Documentos/Power_Bi/Cap_12")
getwd()

#Carregando o dataset
vendas <- read.csv("Vendas.csv", fileEncoding = "windows-1252")

#Resumo do dataset
View(vendas) #mostra dataset
str(vendas) #resumo do arquivo
summary(vendas$Valor)
summary(vendas$Custo)

#Média
?mean #Exibe resumo da função
mean(vendas$Valor)
mean(vendas$Custo)

#Média Ponderada
?weighted.mean
weighted.mean(vendas$Valor, w = vendas$Custo)

#Mediana
median(vendas$Valor)
median(vendas$Custo)

#Moda
#Criando função
moda <- function(v) {
  valor_unico <- unique(v)
  valor_unico[which.max(tabulate(match(v, valor_unico)))]
}

#Obtendo a moda
resultado <- moda(vendas$Valor)
print(resultado)

#instalando pacote ggplot2
install.packages("ggplot2")
library(ggplot2)# carregar pacote sempre que for utilizar

#criar grafico
ggplot(vendas) +
  stat_summary(aes(x = Estado,
                   y = Valor),
               fun = mean,
               geom = "bar",
               fill = "lightgreen",
               col = "grey50") + 
  labs(title = "Média de Valor por Estado")

















