## Wilson Eduardo Jerez Hernández
## 20181167034
## Taller #1 de Estadística inferencial.

##Sys.setenv(LANG="es.UTF-8")

# Función que simula el lanzamiento de un dado 
dados <- function(n){
  resultado <- sample(1:6,n,replace = TRUE)
  print(resultado)
}
# 7.1
# A)Use el botón “Roll One Set” para tomar una muestra de tamaño 3 de la población de tiros de dados.
#¿Qué valor se obtuvo para la media de esta muestra? ¿Dónde cae este valor en el histograma? ¿El valor obtenido es igual a uno de los posibles valores asociados con un solo tiro de un dado balanceado?
#¿Por qué sí o por qué no?
muestra <- dados(3) # muestra 3
media_muestra <- mean(muestra) # media
print(media_muestra) # observar el valor de la media
## realizar 10000 lanzamientos para hacer un Histograma
num_simulaciones <- 10000
medias_muestrales <- numeric(num_simulaciones)# un contenedor nuemrico.
for (i in 1:num_simulaciones) {
  muestra_h <- sample(1:6,3,replace = TRUE)
  media_muestra_h<- mean(muestra_h)
  medias_muestrales[i] <- media_muestra_h
}
num_de_barras <- length(unique(medias_muestrales))

hist(medias_muestrales, breaks = num_de_barras,
     main = "Histograma de Medias Muestrales al Lanzar un Dado 3 Veces",
     xlab = "Media Muestral", 
     ylab = "Frecuencia", col = "lightblue")

abline(v = media_muestra, col = "red", lty = 2) # ubicar la media
# El valor obtenido es igual a uno de los posibles valores asociados con un solo tiro de un dado balanceado?
#¿Por qué sí o por qué no?
#no se cumple por lo general por que es discreta
#b)
# repetir el experimento y hacer la comparativa. 

muestra_b <- dados(3) # muestra 3
print(muestra_b)
media_muestra_b <- mean(muestra_b) # media
print(media_muestra_b) # observar el valor de la media
media_muestra == media_muestra_b # por lo general no se tiene. 

# c). 10 veces y graficar las medias
num_simulaciones <- 10
medias_muestrales <- numeric(num_simulaciones)# un contenedor nuemrico.
for (i in 1:num_simulaciones) {
  muestra_h <- sample(1:6,3,replace = TRUE)
  media_muestra_h<- mean(muestra_h)
  medias_muestrales[i] <- media_muestra_h
}
num_de_barras <- length(unique(medias_muestrales))
hist(medias_muestrales, breaks = num_de_barras,main = "Histograma de Medias Muestrales al Lanzar un Dado 3 Veces",
     xlab = "Media Muestral", ylab = "Frecuencia", col = "lightblue")
## valores ditintos se obtuvieron?
valores_distintos <- length(unique(medias_muestrales))
# crea un contender de longitud los elementos unicos de medias muestrales.
print(valores_distintos)
# podemos hacer 
print(medias_muestrales) # y comprobarlo por nosotros mismos. 
# d). Graficar 100 valores 
num_simulaciones <- 100
# contenedores nuemricos.
medias_muestrales <- numeric(num_simulaciones)
varianzas_muestrales <- numeric(num_simulaciones)
for (i in 1:num_simulaciones) {
  # lanzo el dado 3 veces.
  muestra_h <- sample(1:6,3,replace = TRUE)
  # Calculo los estadisticos de cada muestra
  media_muestra_h<- mean(muestra_h)
  varianza_muestra_h <- var(muestra_h)
  # lleno los contendores
  medias_muestrales[i] <- media_muestra_h
  varianzas_muestrales[i] <- varianza_muestra_h
}
# ya que estamos en un modelo discreto no alterado la media=esperzanza
num_de_barras <- length(unique(medias_muestrales))
hist(medias_muestrales, breaks = num_de_barras,main = "Histograma de Medias Muestrales al Lanzar un Dado 3 Veces",
     xlab = "Media Muestral", ylab = "Frecuencia", col = "lightblue")
abline(v = 3.5, col = "red", lty = 2) # media probalcional 
# podemos observar que la media es igual a su esperanza.
# Además se parece a la campana de gaus. 
print(medias_muestrales) ## vemos la media
## Calculemos la varianza
print(varianzas_muestrales)

estadisticos_df <- data.frame(
  Media = medias_muestrales,
  Varianza = varianzas_muestrales,
  Desv_E = sqrt(varianzas_muestrales),
  Esperanza = medias_muestrales # en este caso es igual
)

View(estadisticos_df)
# e) son distintas, ya que una es poblacional y otra es muestral. 
# f) es la grafica que hice en el inciso A) mientras mas grande se parece mas a 
# normal. 

# 7.2 
# a). 
# no se el valor exacto de P(mean(Y) = 2),(ɔ◔︣‿◔︣)ɔ 
# ya que el valor exacto de P(W = 2/3) y estamos en valores Enteros del 1:6. 
# b).
abline(v = 2, col = "red", lty = 2)
# En efecto 2 no esta en el histograma
# c) es nula :)
# vamos a comprobarlo 
num_simulaciones <- 10000
medias_muestrales <- numeric(num_simulaciones)# un contenedor nuemrico.
for (i in 1:num_simulaciones) {
  muestra_h <- sample(1:6,3,replace = TRUE)
  media_muestra_h<- mean(muestra_h)
  medias_muestrales[i] <- media_muestra_h
}
num_de_barras <- length(unique(medias_muestrales))

hist(medias_muestrales, breaks = num_de_barras ,main = "Histograma de Medias Muestrales al Lanzar un Dado 3 Veces",
     xlab = "Media Muestral", ylab = "Frecuencia", col = "lightblue")
media_2 <- sum(medias_muestrales == 2) 
# esto tambien me suma los valores cercanos a 2 '._.

# 7.3 
# a). 
dados(12)
num_simulaciones <- 10
medias_muestrales <- numeric(num_simulaciones)# un contenedor nuemrico.
for (i in 1:num_simulaciones) {
  muestra_h <- sample(1:6,12,replace = TRUE)
  media_muestra_h<- mean(muestra_h)
  medias_muestrales[i] <- media_muestra_h
}
num_de_barras <- length(unique(medias_muestrales))

hist(medias_muestrales, breaks = num_de_barras ,main = "Histograma de Medias Muestrales al Lanzar un Dado 3 Veces",
     xlab = "Media Muestral", ylab = "Frecuencia", col = "lightblue")
# a simple viste no veo cambio significativo 
##
##
## 

# Se generan 1000 datos distribuidos normal con media 3 y desviación estandar 2:
x <- rnorm(1000, mean = 3, sd = 2)
# Se grafica un histograma de los datos generados en el paso anterior considerando 15 intervalos:
hist(x, breaks = 15)
# Las siguientes lineas, establecen, lo que a mi parecer, hace el botón “Toggle Normal” en la app.
# Grafica un histograma de frecuencias relativas y superpone una curva normal con media
# igual a la media de los datos generados y desviación, la desviación de los datos generados:
hist(x, breaks = 15, prob = TRUE)
x2 <- seq(min(x), max(x), length = 40)
fun <- dnorm(x2, mean = mean(x), sd = sd(x))
lines(x2, fun, col = 2, lwd = 2)

#c)