# Mini-Projeto 2

# Limpeza e Transforma√ß√£o de Dados com Power Query e Linguagem R

# Definindo a pasta de trabalho
# Substitua o caminho abaixo pela pasta no seu computador
setwd("C:/Users/guga_/OneDrive/Documentos/Power_Bi/Cap_12/MiniProjeto02")
getwd()

# Instala os pacotes
install.packages("dplyr")
install.packages("data.table")
install.packages("ggplot2")

# Carrega os pacotes
library(dplyr)
library(data.table)
library(ggplot2)

# Carrega os dados
# Fonte de dados: https://archive.ics.uci.edu/ml/datasets/iris
dados_iris <- iris
View(dados_iris)


# Tarefa 1 - Sumarizar os dados com as m√©dias de cada coluna de um dataset.
library(dplyr)
medias_iris <- summarize(group_by(dados_iris, Species),
                         media_sepal_length = mean(Sepal.Length), 
                         media_sepal_width = mean(Sepal.Width),
                         media_petal_length = mean(Petal.Length), 
                         media_petal_width = mean(Petal.Width))

View(medias_iris)


# Tarefa 2 - Extrair o valor inteiro de uma das colunas decimais.
library(data.table)
dados_iris_id <- data.table(dados_iris)
View(dados_iris_id)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)
View(dados_iris_id)


# Para executar no Power Query
library(data.table)
dados_iris_id <- data.table(dados_iris)
dados_iris_id$Sepal.Length <- as.integer(dados_iris_id$Sepal.Length)


# Tarefa 3 ‚Äì Construir um gr·fico mostrando a relaÁ„o de duas variaveis numÈricas para as 3 categorias de uma vari√°vel categ√≥rica.
library(ggplot2)
ggplot(data = dados_iris, aes(x = Petal.Width, y = Petal.Length)) +
  geom_point(aes(color = Species), size = 3) +
  ggtitle("Largura e Comprimento das PÈtalas") +
  labs(x = "Largura da PÈtala", 
       y = "Comprimento da PÈtala") +
  theme_bw() +
  theme(title = element_text(size = 15, color = "turquoise4"))

# Cores dispon√≠veis na Linguagem R
colors()

