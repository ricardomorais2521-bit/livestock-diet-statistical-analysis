library(moments)
# 1ºProjeto - Consultoria
# Faculdade de Ciências da Universidade de Lisboa
# Departamento de Ciências Matemáticas
# 3.º Ano - 2.º Semestre - 2025/2026
# Projeto realizado por: Ricardo Morais(62802), Martim Diniz(62049)
# Projeto realizado no âmbito da cadeira de Consultoria em Estatística/Projeto(código: 22718),
# Docente responsável: Maria Fernanda Diamantino
# Docente auxiliar: Ana Catarina Fernandes



parmfrow = c(3,3)
ganho <- c(
  1.07, 1.66, 1.71, 1.75, 1.78, 1.89,
  1.58, 1.66, 1.71, 1.75, 1.79, 1.89,
  1.63, 1.67, 1.72, 1.76, 1.79, 1.93,
  1.64, 1.68, 1.72, 1.77, 1.81, 1.94,
  1.64, 1.68, 1.73, 1.77, 1.83, 1.94,
  1.66, 1.69, 1.74, 1.77, 1.84, 1.97,
  1.66, 1.69, 1.74, 1.78, 1.86, 2.06
)

mean(ganho)
median(ganho)
sd(ganho)
skewness(ganho)
cv1 <- (sd(ganho) / mean(ganho)) * 100
cv1

# par(mfrow = c(2,2))

# Boxplot Caso 1
boxplot(ganho, horizontal = TRUE, col = "skyblue2", 
        main = "Caso 1: Amostra Completa (n=42)", 
        xlab = "Ganho médio diário de Peso (kg)", 
        pch = 16, medcol = "black", medlwd = 2)
mtext("Boxplot", side = 3, line = 0.3, cex = 0.85, col = "gray40", font = 3)
points(mean(ganho), 1, pch = 4, col = "red", lwd = 2, cex = 1.2)
legend("topright", legend = "Média", pch = 4, col = "red", bty = "o", box.col = "gray50", bg = "white", cex = 0.9)


# Histograma Caso 1
hist(ganho, breaks = "sturges", 
     col = "skyblue2", border = "white",
     main = "Caso 1: Amostra Completa (n=42)", 
     xlab = "Ganho médio diário de Peso (kg)", ylab = "Frequência (Nº de bezerros)", las = 1)
mtext("Histograma", side = 3, line = 0.3, cex = 0.85, col = "gray40", font = 3)

length(ganho)

# H0 : X ⌢ N(µ, σ) vs. H1 : X ̸⌢ N(µ, σ)
shapiro.test(ganho)
# p-value < alpha, logo rejeitamos a hipótese da normalidade
# QQ-Plot Caso 1
qqnorm(ganho, 
       main = "Q-Q Plot: Caso 1 (n=42)", 
       xlab = "Quantis Teóricos (Normal)", 
       ylab = "Quantis Empíricos (Amostra)",
       pch = 16, col = "black", cex = 1.2, las = 1)
qqline(ganho, col = "red", lwd = 2)
mtext("Análise de Normalidade", side = 3, line = 0.3, cex = 0.8, col = "gray40", font = 3)



mediana_ref <- median(ganho)
ganho_valido <- ganho[ganho != mediana_ref]
sucessos <- sum(ganho_valido > mediana_ref)
n_total <- length(ganho_valido)
teste_sinais <- binom.test(x = sucessos, 
                           n = n_total, 
                           p = 0.5, 
                           alternative = "greater")
teste_sinais


# --- Caso 2 ---

ganho2 <- c(
  1.66, 1.71, 1.75, 1.78, 1.89,
  1.58, 1.66, 1.71, 1.75, 1.79, 1.89,
  1.63, 1.67, 1.72, 1.76, 1.79, 1.93,
  1.64, 1.68, 1.72, 1.77, 1.81, 1.94,
  1.64, 1.68, 1.73, 1.77, 1.83, 1.94,
  1.66, 1.69, 1.74, 1.77, 1.84, 1.97,
  1.66, 1.69, 1.74, 1.78, 1.86
)

mean(ganho2)
median(ganho2)
sd(ganho2)
cv2 <- (sd(ganho2) / mean(ganho2)) * 100
cv2

# Boxplot Caso 2
boxplot(ganho2, horizontal = TRUE, col = "pink3", 
        main = "Caso 2: Amostra sem Outliers (n=40)", 
        xlab = "Ganho médio diário de Peso (kg)", 
        pch = 16, medcol = "black", medlwd = 2)
mtext("Boxplot", side = 3, line = 0.3, cex = 0.85, col = "gray40", font = 3)
points(mean(ganho2), 1, pch = 4, col = "red", lwd = 2, cex = 1.2)
legend("topright", legend = "Média", pch = 4, col = "red", bty = "o", box.col = "gray50", bg = "white", cex = 0.9)


cortes <- seq(min(ganho2), max(ganho2), length.out = 6)
# Histograma Caso 2
hist(ganho2, breaks = cortes,
     col = "pink3", border = "white",
     main = "Caso 2: Amostra sem Outliers (n=40)", 
     xlab = "Ganho médio diário de Peso (kg)", ylab = "Frequência (Nº de Bezerros)",
     las = 1, xlim = c(1.55, 2.0))


# Coeficiente de assimetria: g1 = (1/n * sum(xi−x)^3) / √((1/n * sum(xi−x)^2)^3)
skewness(ganho2)
length(ganho2)

# H0 : X ⌢ N(µ, σ) vs. H1 : X ̸⌢ N(µ, σ)
shapiro.test(ganho2)
# p-value = 0.1126 > 0.05 = alpha
# QQ-Plot Caso 2
qqnorm(ganho2, 
       main = "Q-Q Plot: Caso 2 (n=40)", 
       xlab = "Quantis Teóricos (Normal)", 
       ylab = "Quantis Empíricos (Amostra)",
       pch = 16, col = "black", cex = 1.2, las = 1)
qqline(ganho2, col = "red", lwd = 3)
mtext("Análise de Normalidade", side = 3, line = 0.3, cex = 0.8, col = "gray40", font = 3)

t.test(ganho2, mu = 1.745, alternative = "greater", conf.level = 0.95)

