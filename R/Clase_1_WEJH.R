# Wilson Eduardo Jerez Hernández
# Cod. 20181167034
# Fecha: 2 de marzo del 2023

# ver el directorio actual 

getwd()

#cambiar de directorio 

setwd("/cloud/project/Machine Learnin con R")

# ver archivos en el actual directorio 
list.files()

# Instalar paquetes 
install.packages("MASS")

#cargar libreria 
library(MASS)
# objetos
a <- "pepe"

# Clase del objeto
class(a)
# crear vecores 
vector <- c(1,2,3,4)
#sucuencia
id <- matrix(c(2,4,6,8),2,2)

# vector de 0
zeros <- rep(0,10)

# %*% multiplicación de matrices

dim(id)[1]
# llamar bases de datos
data(mtcars)
class(mtcars)

View(mtcars)
# extraer varibales
mtcars$wt

op <- par(mar = c(10,4,4,2)) #dimensiones de una ventana 
# barplot es para diagrmas de barra 
barplot(mtcars$mpg, names.arg = row.names(mtcars),las=2,ylab="Eficiencia UwU")

# aiiuda
?mtcars
#grafico de dispersión por pares
pairs(mtcars[1:7],lower.panel = NULL)
# creación del modelo
plot(x=mtcars$mpg,y=mtcars$wt)
carlitos <- lm(formula = mpg~wt,data=mtcars)
coef(carlitos)
coef(carlitos)[2]
coef(carlitos)[1]
abline(carlitos)