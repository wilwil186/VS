# Wilson Eduardo Jerez Hernández
# Cod. 20181167034
# Fecha: 24 de feb del 2024

# Estadisticos muestrales
mu <- 500 # media poblacional
# Estadisticos poblacionales
media_muestra <- 518
sigma <- 40  # desviación 

m <- 10000 #Número de replicas del experimento 
n <-5 #Tamaño de la muestra

datos <- matrix(nrow = m, ncol = n) #Matriz para alojar las replicas del experimento
for (i in 1:m) {
  datos[i,] <- rnorm(n, mean = media_muestra, sd = sigma)
}

varianza <- apply(datos, 1, var) #Calculo de la media de cada repetición del experimento

datos <- cbind(datos, varianza) #Incluir una columna con la media en la base de datos

hist(varianza, breaks = 15) #Grafico de histograma de frecuencia

t <- (media_muestra - mu) / (sqrt(varianza) / sqrt(n))

hist(t)

media_t <- mean(t) #Media de t

hist(t, breaks = 15, freq = FALSE) #Grafico de histograma de densidad
# Valores de -t_0.05 y t_005 segun la tabla A4 para grados de libertad n-1 = 4
grados_libertad <- n - 1
t_0.05 <-  2.132
Nt_0.05 <- -t_0.05
abline(v=media_t,col='blue',lty=2)
abline(v = t_0.05, col = "red", lty = 2) # el valor de t
abline(v=Nt_0.05, col = "red", lty = 2 )

# Calcular el valor p para una prueba t unilateral
p_valor <- pt(media_t, df = grados_libertad, lower.tail = FALSE)

# Interpretar los resultados
if (p_valor < 0.05) {
  cat("Se rechaza la hipótesis nula. Es probable que el rendimiento medio de la población sea mayor que 500 gramos por milímetro.")
} else {
  cat("No se rechaza la hipótesis nula. No hay suficiente evidencia para concluir que el rendimiento medio de la población sea diferente de 500 gramos por milímetro.")
}
