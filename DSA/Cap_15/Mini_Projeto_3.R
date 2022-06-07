# definindo pasta de trabalho
setwd("C:/Users/guga_/OneDrive/Documentos/Power_Bi/Cap_15")
getwd()

# instalando pacotes
install.packages("Amelia") # tratar valores ausentes
install.packages("caret") # contruir modelos de ML
install.packages("ggplot2") # construção gráficos
install.packages("dplyr") # tratar dados
install.packages("reshape") # modificar formato dos dados
install.packages("randomForest") # trabalhar com ML
install.packages("e1071") # trabalhar com ML

# carregando pacotes
library(Amelia)
library(ggplot2)
library(caret)
library(reshape)
library(randomForest)
library(dplyr)
library(e1071)

# carregando o dataset
dados_clientes <- read.csv("dados/dataset.csv")

# visualizando dados e estruturas
View(dados_clientes)
str(dados_clientes)
summary(dados_clientes)

# Removendo a primeira coluna ID
dados_clientes$ID <- NULL
dim(dados_clientes)
View(dados_clientes)

# Renomear coluna
colnames(dados_clientes)
colnames(dados_clientes)[24] <- 'Inadimplente'
colnames(dados_clientes)
View(dados_clientes)

# verificando valores ausentes e removendo do dataset
sapply(dados_clientes, function(x) sum(is.na(x)))

# verificar valores ausentes graficamente, para documentação
missmap(dados_clientes, main = 'Valores Ausentes Observados')

# remover valores ausentes
dados_clientes <- na.omit(dados_clientes)


# renomenado colunas
colnames(dados_clientes)
colnames(dados_clientes)[2] <- 'Genero'
colnames(dados_clientes)[3] <- 'Escolaridade'
colnames(dados_clientes)[4] <- 'Estado_Civil'
colnames(dados_clientes)[5] <- 'Idade'
colnames(dados_clientes)
View(dados_clientes)

# convertendo variaveis ( numero -> texto) cut
# genero
View(dados_clientes$Genero)
str(dados_clientes$Genero) # tipo da variavel
dados_clientes$Genero <- cut(dados_clientes$Genero, 
                             c(0,1,2), labels = c('Masculino', 'Feminino'))
str(dados_clientes$Genero)
summary(dados_clientes$Genero)

# escolaridade
dados_clientes$Escolaridade <- cut(dados_clientes$Escolaridade,
                                   c(0,1,2,3,4), labels = c('Pos_Graduado','Graduado','Ensino_medio','Outros'))
summary(dados_clientes$Escolaridade)

# estado civil
str(dados_clientes$Estado_Civil)
summary(dados_clientes$Estado_Civil)
dados_clientes$Estado_Civil <- cut(dados_clientes$Estado_Civil, c(-1,0,1,2,3),
                                   labels = c('Desconhecido','Casado','Solteiro','Outro'))
str(dados_clientes$Estado_Civil)
summary(dados_clientes$Estado_Civil)

# convertendo variavel para fator com faixa etaria
str(dados_clientes$Idade)
summary(dados_clientes$Idade)
hist(dados_clientes$Idade)
dados_clientes$Idade <- cut(dados_clientes$Idade, c(0,30,50,100),
                            labels = c('Jovem','Adulto','Idoso'))
str(dados_clientes$Idade)
summary(dados_clientes$Idade)
View(dados_clientes)

# convertendo apenas o tipo 
dados_clientes$PAY_0 <- as.factor(dados_clientes$PAY_0)
dados_clientes$PAY_2 <- as.factor(dados_clientes$PAY_2)
dados_clientes$PAY_3 <- as.factor(dados_clientes$PAY_3)
dados_clientes$PAY_4 <- as.factor(dados_clientes$PAY_4)
dados_clientes$PAY_5 <- as.factor(dados_clientes$PAY_5)
dados_clientes$PAY_6 <- as.factor(dados_clientes$PAY_6)

# dataset após conversão
str(dados_clientes)
sapply(dados_clientes, function(x) sum(is.na(x)))
dados_clientes <- na.omit(dados_clientes)
sapply(dados_clientes, function(x) sum(is.na(x)))
dim(dados_clientes)

# inadimplete
str(dados_clientes$Inadimplente)
dados_clientes$Inadimplente <- as.factor(dados_clientes$Inadimplente)
str(dados_clientes$Inadimplente)

# total inadimplentes x não inadimplentes
table(dados_clientes$Inadimplente)
prop.table(table(dados_clientes$Inadimplente))

# distribuição usando ggplot2
qplot(Inadimplente, data = dados_clientes, geom = 'bar') +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))

#set seed
set.seed(12345)

# seleciona as linhas de acordo com a variavel inadimplente como strata
indice <- createDataPartition(dados_clientes$Inadimplente, p = 0.75, list = FALSE)
dim(indice)

# definindo dados de treino como subconjunto do conjunto de dados original
dados_treino <- dados_clientes[indice,]
table(dados_treino$Inadimplente)

# porcentagem das classes
prop.table(table(dados_treino$Inadimplente))

# comparar porcentagem entre as classes de treinamento e dados originais
compara_dados <- cbind(prop.table(table(dados_treino$Inadimplente)),
                       prop.table(table(dados_clientes$Inadimplente)))
colnames(compara_dados) <- c('treinamento','original')
compara_dados

# 
dados_teste <- dados_clientes[-indice, ]

                            
                            # Machine Learning #

                        # PRIMEIRA VERSAO DO MODELO

modelo_v1 <- randomForest(Inadimplente ~ ., data = dados_treino)
modelo_v1

# avaliando o modelo
plot(modelo_v1)

# previsões com dados de teste
previsoes_v1 <- predict(modelo_v1, dados_teste)

# confusion matrix
cm_v1 <- caret::confusionMatrix(previsoes_v1, dados_teste$Inadimplente, positive = '1')
cm_v1

# CALCULANDO pRECISION, rECALL E f1-sCORE, MÉTRICAS DE AVALIAÇÃO DO MODELO PREDITIVO
y <- dados_teste$Inadimplente
y_pred_v1 <- previsoes_v1

precision <- posPredValue(y_pred_v1, y)
precision

recall <- sensitivity(y_pred_v1, y)
recall

F1 <- (2 * precision * recall) / (precision + recall)
F1

# balanceamento de classes
install.packages('DMwR')
library(DMwR)
chooseCRANmirror()
10

                          # SEGUNDA VERSAO DO MODELO

varImpPlot(modelo_v1)

# obtendo as variaveis importantes
imp_var <- importance(modelo_v1)
varImportance <- data.frame(Variables = row.names(imp_var), Importance = round(imp_var[ ,'MeanDecreaseGini'],2))

# criando o rank de variaveis baseado na importância
rankImportance <- varImportance %>%
  mutate(Rank = paste0('#', dense_rank(desc(Importance))))

# usando ggplot2
ggplot(rankImportance,
       aes(x = reorder(Variables, Importance),
           y = Importance,
           fill = Importance)) + 
  geom_bar(stat='Identity') +
  geom_text(aes(x = Variables, y = 0.5, label = Rank), 
            hjust = 0,
            vjust = 0.55,
            size = 4,
            colour = 'red') +
  labs(x = 'Variables') + 
  coord_flip()

                            # TERCEIRA VERSAO DO MODELO

colnames(modelo_v1)
modelov3 <- randomForest(Inadimplent ~ PAY_0 + PAY_2 + PAY_3 + PAY_AMT1 + PAY_AMT2 + PAY_5 +
                           BILL_AMT1, data = modelo_v1)
modelo_v3

# salvando modelo em disco
saveRDS(modelo_v1, file = 'modelo/modelo_V1.rds')

# carregando o modelo
modelo_final <- readRDS('modelo/modelo_v1.rds')


