# Wilson Eduardo Jerez Hernández
# Cod. 20181167034
# Fecha: 2 de marzo del 2023


# Asignando valores a vectores
v1 = c(1,2,3) 
v2 = c("Jerry","George","Elaine")
v3 = c(TRUE,FALSE,TRUE)

# Creando un data frame con los vectores creados anteriormente
data_frame = data.frame(v1,v2,v3) 
data_frame
str(data_frame)

# Comenzando con modelos supervisados, en este caso regresión

# Cargando el dataset mtcars, que viene preinstalado en R
head(mtcars)

# Graficando la relación entre dos variables del dataset 
plot(y=mtcars$mpg,x=mtcars$disp,
     xlab="Tamaño del motor(onzas cubicas)(mpg)",
     ylab="Eficenica de combustible (Millas por Galón)(disp)")

# Creando un modelo de regresión lineal simple
model <- lm(mtcars$mpg~mtcars$disp)
View(model)
coef(model)
model$coefficients
class(model)

# Agregando la línea de regresión al gráfico
abline(model)

# Calculando el valor de la variable de respuesta (mpg) para un valor específico de la variable independiente (disp)
-0.04121512*200+29.59985476 
coef(model)[2]*200+coef(model)[1]

# Resumiendo el modelo de regresión creado
summary(model)

# Separando los datos en conjuntos de entrenamiento y prueba
split_size = 0.8
sample_size = floor(split_size*nrow(mtcars))
sample_size
set.seed(123) # Definiendo la semilla para replicar los resultados
train_indices <- sample(seq_len(nrow(mtcars)),size=sample_size)
train_indices

train <- mtcars[train_indices,]
train

test <- mtcars[-train_indices,]
test

# Seleccionando filas específicas del dataset
mtcars[3,]
mtcars[3:5,]
mtcars[c(1,5,10),]

# Creando un nuevo modelo de regresión lineal simple con los datos de entrenamiento
model2 <- lm(mpg~disp,data=train)
abline(model2,col="red")

# Creando un data frame con los valores de la variable independiente (disp) para los datos de prueba
new.data <- data.frame(disp=test$disp)
View(new.data)

# Calculando los valores de la variable de respuesta (mpg) para los datos de prueba usando el modelo creado
test$output <- predict(model2,new.data)
test

# Calculando el error cuadrático medio (MSE) para el modelo creado
sqrt(sum(test$mpg-test$output)^2/nrow(test))
