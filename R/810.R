#Simulación Distribución de la Varianza Muestral Ejemplo 8.10 Walpole (2007)




#Un fabricante de baterías para automóvil garantiza que sus baterías durarán,

#en promedio, 3 años con una desviación estándar de 1 año. 

#Si cinco de estas baterías tienen duraciones de 1.9, 2.4, 3.0, 3.5 y 4.2 

#años, ¿el fabricante aún está convencido de que sus baterías tienen una 

#desviación estándar de 1 año? Suponga que la duración de la batería sigue 

#una distribución normal.




# Solución




m <- 10000 #Número de replicas del experimento

mu <- 3 #Media poblacional

sigma <- 1 #Desviación estandar poblacional

n <-5 #Tamaño de la muestra




datos <- matrix(nrow = m, ncol = n) #Matriz para alojar las replicas del experimento




for (i in 1:m) {
  
  datos[i,] <- rnorm(n, mean = mu, sd = sigma)
  
}




varianza <- apply(datos, 1, var) #Calculo de la media de cada repetición del experimento

datos <- cbind(datos, varianza) #Incluir una columna con la media en la base de datos

hist(varianza, breaks = 15) #Grafico de histograma de frecuencia




chi_cua <- (n-1)*varianza/sigma^2

media_chi <- mean(chi_cua) 

datos <- cbind(datos, chi_cua)




hist(chi_cua, breaks = 15, freq = FALSE, ylim = c(0,0.2)) #Grafico de histograma de densidad

curve(dchisq(x, df = media_chi), add = TRUE, col="red") #Superponer la curva

#Para la solución del problema, llamemos x el vector de los datos

x <- c(1.9, 2.4, 3.0, 3.5, 4.2)

#Su varianza es

var_x <- var(x)

#cuyo valor es 0.815. La desviación estadar coincide con su raíz cuadrada: 0.9

#La pregunta que surge es: ¿De acuerdo a la afirmación hecha de que la

#duración de las baterías tienen una desviación estandar de 1.0, el valor

#de la muestra (0.9) apoya dicha afirmación. O de manera equivalente, si hablamos

#de las varianzas, la duración de las baterías tienen una varianza de 1.0, 

#el valor obtenido de la muestra (0.815) apoya dicha afirmación.

sum(varianza<0.815)/m

#el calculo anterior nos permite observar que 48.5% de las varianzas son

#menores a 0.815, es decir, bajo el supuesto que la varinza es 1, hay una

#alta probabilidad de obtener una muestra con una varianza igual a este valor.

#De tal forma que la evidencia muestral apoya la afirmación del fabricante.