peso <- seq(from = 0, to = 3.8, by = 0.2)
alargamiento <- c(5.1, 5.0, 5.1, 5.1, 5.1, 5.2, 5.3, 5.2, 5.2, 5.5, 5.4, 5.6, 5.5, 5.5, 5.6, 5.6, 5.6, 5.8, 5.7, 5.8)
n <- length(peso)
Tabla_1 <- data.frame( 
  peso = peso,
  alargamiento = alargamiento
)

modelo <- lm(formula = alargamiento ~ peso, data = Tabla_1)
summary (modelo)

plot(Tabla_1$peso, Tabla_1$alargamiento, 
     main = "Gráfico de Dispersión de Peso vs Alargamiento",
     xlab = "Peso",
     ylab = "Alargamiento",
     pch = 19, # Tipo de punto
     col = "blue") 

abline(modelo)

sxx <- sum((peso -mean(peso))^2)
sxx
syy <- sum((alargamiento-mean(alargamiento))^2)
syy
sxy <- sum((peso - mean(peso))*(alargamiento -mean(alargamiento)))
b1 <- sxy/sxx
s2 <- (syy-b1*sxy)/(18)
s <- sqrt(s2)
b0 <- mean(alargamiento)-b1*mean(peso)
coo <- (sum(peso)^2)/(n*sxx)
c11 <- 1/sxx
var_b0 <- sqrt(coo)*s
var_b0
var_b1 <- sqrt(1/sxx)*s
var_b1
t_b0 = b0/(sqrt(coo)*s)
t_b1 = b1/(sqrt(c11)*s)
sse <- s2*(n-2)
r2 <- 1 -(sse/syy)  
r2
r2a <- 1 - ((n-1)*(1-r2)/(n-2-1))
r2a
pvalue(t_b0)
