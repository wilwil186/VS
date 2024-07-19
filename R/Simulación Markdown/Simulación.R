## Simulación de Distribuciones Muestrales

# Se instalan y cargan los paquetes necesarios
install.packages("matrixStats")
library(matrixStats)
# Generación de datos siguiendo una distribución normal
x <- rnorm(n = 10, mean = 70, sd = 10)
hist(x, breaks = 30)
mean(x)
var(x)
sd(x)

# Simulación de la edad de vida de colonos en diferentes planetas
# Tomamos una muestra de tamaño n de una población cuya edad de vida promedio
# es 70 años y cuya desviación estándar es 10 años. Replicamos este experimento
# m veces.
n <-10  # Tamaño de muestra
m <-10000  # Número de réplicas
datos <- matrix(nrow = m, ncol = n)
for (i in 1:m) {
  datos[i,] <- rnorm(n, mean = 70, sd = 10)
}
datos <- data.frame(datos)
hist(datos$X5, breaks = 30)
hist(datos$X10, breaks = 30)

## Distribución de la Media Muestral
Media <- rowMeans(datos)
datos <- cbind(datos,Media)
hist(Media, breaks = 30)
hist(Media, breaks = 30, prob = TRUE)
lines(density(Media), col = 4, lwd = 2)
x2 <- seq(min(Media), max(Media), length = 40)
fun <- dnorm(x2, mean = mean(Media), sd = sd(Media))
lines(x2, fun, col = 2, lwd = 2)

## Cálculo de estadísticos para una de las variables de la población
mean(datos$X5)
var(datos$X5)
sd(datos$X5)

## Cálculo de estadísticos para la variable aleatoria Media Muestral
mean(Media)
var(Media)
sd(Media)

## Distribución de la Varianza Muestral
Varianza <- rowVars(as.matrix(datos[,1:n]))
datos <- cbind(datos,Varianza)
hist(Varianza, breaks = 30)
hist(Varianza, breaks = 30, prob = TRUE)
lines(density(Varianza), col = 4, lwd = 2)
Chi <- (n-1)*Varianza/100
hist(Chi, breaks = 30)
hist(Chi, breaks = 30, prob = TRUE)
x2 <- seq(min(Chi), max(Chi), length = 100)
fun <- dchisq(x2, df = 9)
lines(x2, fun, col = 2, lwd = 2)


## Cálculo de estadísticos para la variable aleatoria Varianza Muestral
mean(Chi)
var(Chi)

