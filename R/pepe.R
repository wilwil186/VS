# Definición de variables
mu <- 500 # Media poblacional
media_muestra <- 518 # Media muestral
sigma <- 40 # Desviación estándar poblacional
m <- 10000 # Número de réplicas del experimento
n <- 5 # Tamaño de la muestra

# Simulación de la distribución muestral
datos <- matrix(nrow = m, ncol = n)
for (i in 1:m) {
  datos[i,] <- rnorm(n, mean = media_muestra, sd = sigma)
}

# Cálculo de la varianza muestral
varianza <- apply(datos, 1, var)

# Cálculo del valor t
t <- (media_muestra - mu) / (sqrt(varianza) / sqrt(n))

# Cálculo de la media y grados de libertad
media_t <- mean(t)
grados_libertad <- n - 1

# Valores críticos para la prueba t unilateral
t_0.05 <- qt(0.05, df = grados_libertad)
Mt_0.05 <- -t_0.05

# Cálculo del valor p
valor_d_t <- pt(media_t, df = grados_libertad, lower.tail = FALSE)

# Interpretación de los resultados
if (valor_d_t < 0.05) {
  cat("Se rechaza la hipótesis del ingeniero.")
} else {
  cat("El ingeniero tiene razón")
}

# Gráficos
hist(varianza, breaks = 15)
hist(t, breaks = 15, freq = FALSE)
abline(v = media_t, col = "blue", lty = 2)
abline(v = t_0.05, col = "red", lty = 2)
abline(v = Mt_0.05, col = "red", lty = 2)
