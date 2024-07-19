# Simulación en R para Análisis Estadístico en Inferencia para Investigación Médica
# Muestra
set.seed(42)
n <- 100 # Muestra
p <- 0.5 # Estimación
Datos <- rbinom(n, 1, p) # Distribución Bernoulli
Datos
table(Datos)
Frecuencia <- mean(Datos)
Frecuencia

Y <- sum(Datos) # Y es el exito de la muestra (Cantidad de 1 en la distribución de bernoulli)
estimador_muestra <- Y / n
cat("Estimador de la proporción de éxito:", estimador_muestra)


# 5. Distribución del Estimador
m <- 10000 # número de simulaciones
datos <- matrix(nrow = m, ncol = n)
for (i in 1:m) {
  datos[i,] <- rbinom(n, 1, p)
}
datos <- data.frame(datos) # DataFrame con 1000 obs, y 100 muestras.
SumaXi <- apply(datos,1,sum)
SumaXi <- data.frame(SumaXi)
media <- apply(datos, 1, mean)
SumaXi <- cbind(SumaXi, media)
head(SumaXi)

cat("Distribución del Estimador:\n")
hist(media, main="Distribución del Estimador", xlab="Proporción de Éxito", 
     col="lightblue", border="black",prob=TRUE)
abline(v = Frecuencia, col="red", lwd=2)
# Ajustar una curva a la distribución del estimador
curve(dnorm(x, mean = 0.5, sd = sqrt(p * (1 - p) / n)), 
      col = "blue", lwd = 2, add = TRUE)



# 6. Aproximación de la Binomial por la Normal
valor_z <- (estimador_muestra - p) / sqrt((p * (1 - p)) / n)
cat("Aproximación de la Binomial por la Normal:\n")
cat("Valor Z:", valor_z, "\n")

