#Definindo o caminho
setwd("C:/Users/guga_/OneDrive/Documentos/Power_Bi/Cap_12/Exercícios")
getwd()

#Carregando o arquivo
notas <- read.csv("Notas.csv", fileEncoding = "windows-1252")

#Ex1
View(notas)#dados
summary(notas)#Estatisticas Dataset
str(notas)

#Ex2 - Média
mean(notas$TurmaA)
mean(notas$TurmaB)

#Ex3 - Variabilidade
sd(notas$TurmaA)#apresenta maior variabilidade
sd(notas$TurmaB)

#Ex4 #Coeficiente de variação (desvio padrão / media * 100)
media_ta <- mean(notas$TurmaA)
media_tb <- mean(notas$TurmaB)

sd_ta <- sd(notas$TurmaA)
sd_tb <- sd(notas$TurmaB)

cvA <- sd_ta / media_ta * 100
cvB <- sd_ta / media_tb * 100

cvA
cvB

#Ex5 - valor que mais aparece(moda)
moda <- function(v) {
  valor_unico <- unique(v)
  valor_unico[which.max(tabulate(match(v, valor_unico)))]
}

#Obtendo a moda
resultado <- moda(notas$TurmaA)
resultado <- moda(notas$TurmaB)
print(resultado)

