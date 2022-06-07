# setando arquivo
setwd("C:/Users/guga_/OneDrive/Documentos/Power_Bi/Cap_12/TabeladeFrequencia")
getwd

# carregando arquivo
usuarios <- read.csv("Usuarios.csv", fileEncoding = "windows-1252")

# visualizando e sumarizando dados
View(usuarios)
summary(usuarios)
mean(usuarios$salario)
str(usuarios)

# tabela de frequencia absoluta
freq <- table(usuarios$grau_instrucao)
View(freq)

# tabela de frequencia relativa %
freq_rel <- prop.table(freq)
View(freq_rel)

p_freq_rel <- 100 * prop.table(freq_rel)
View(p_freq_rel)

# adiciona linhas de total
freq <- c(freq, sum(freq))
names(freq)[4] <- "Total"
View(freq)

# Tabela final com todos os valores
freq_rel <- c(freq_rel, sum(freq_rel))
p_freq_rel <- c(p_freq_rel, sum(p_freq_rel))

# Tabela final com todos os vetores
tabela_final <- cbind(
    freq,
    freq_rel =  round(freq_rel, digits = 2),
    p_freq_rel = round(p_freq_rel, digits = 2))
View(tabela_final)


