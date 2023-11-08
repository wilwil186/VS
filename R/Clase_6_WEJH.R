# Wilson Eduardo Jerez Hernández
# Cod. 20181167034
# Fecha: 13/04/2023

# Cargar paquetes necesarios
library(party)       # Para árboles de decisión
library(randomForest)# Para Random Forest
library(knitr)       # Para tablas

# Cargar datos de mtcars
data(mtcars)

# Separar datos en conjuntos de entrenamiento y prueba
set.seed(123) # Definir semilla para reproducibilidad
split_size <- 0.8
sample_size <- floor(split_size * nrow(mtcars))
train_indices <- sample(seq_len(nrow(mtcars)), size = sample_size)
train <- mtcars[train_indices, ]
test <- mtcars[-train_indices, ]

## Árboles de decisión

# Crear árbol de decisión con todos los datos
tree <- ctree(mpg ~ ., data = mtcars)
plot(tree)

# Crear árbol de decisión con datos de entrenamiento
tree.train <- ctree(mpg ~ ., data = train)
plot(tree.train)

# Predecir valores para el conjunto de prueba y obtener clase de nodo
test$mpg.tree <- predict(tree.train, test)
test$class <- predict(tree.train, test, type = "node")

# Mostrar tabla con valores reales y predichos
kable(data.frame(row.names(test), test$mpg, test$mpg.tree, test$class),
      col.names = c("Observación", "mpg real", "mpg predicho", "Clase de nodo"))

## Random Forest

# Crear modelo Random Forest
mtcars.rf <- randomForest(mpg ~ ., data = mtcars, ntree = 1000,
                          keep.forest = FALSE, importance = FALSE)
plot(mtcars.rf, log = "y")

## Redes neuronales

# Definir función sigmoide
sigmoide <- function(x) 1 / (1 + exp(-x))

# Graficar función sigmoide
x <- seq(-10, 10, length = 100)
plot(x, sigmoide(x), type = "l", col = "pink", lwd = 3)



#Tarea: correr un árbol de decisión utilizando los datos de iris, separando el 80% para entrenamiento y el 20% para prueba.
#Semilla aleatoria: 3 ultimos digitos de la cedula
#Modelo de clasificación: la variable de salida es una categoría que puede ser 1 para setosa, 2 para versicolor y 3 para virginica.
#Variables predictoras: ancho del pétalo, largo del pétalo, ancho y largo del sépalo.

# Cargar paquetes necesarios
library(party)       # Para árboles de decisión

# Cargar datos de iris
data(iris)

# Separar datos en conjuntos de entrenamiento y prueba
set.seed(940) # Definir semilla para reproducibilidad
split_size <- 0.8
sample_size <- floor(split_size * nrow(iris))
train_indices <- sample(seq_len(nrow(iris)), size = sample_size)
train <- iris[train_indices, ]
test <- iris[-train_indices, ]

# Crear árbol de decisión con datos de entrenamiento
iris.tree <- ctree(Species ~ Petal.Width + Petal.Length + Sepal.Width + Sepal.Length, data = train)
plot(iris.tree)

# Predecir valores para el conjunto de prueba y obtener clase de nodo
test$Species.tree <- predict(iris.tree, test)
test$class <- predict(iris.tree, test, type = "node")

# Mostrar tabla con valores reales y predichos
kable(data.frame(row.names(test), test$Species, test$Species.tree, test$class),
      col.names = c("Observación", "Especie real", "Especie predicha", "Clase de nodo"))

#Pensar en los pesos necesarios para que el o y el OR exclusivo sean clasificados correctamente por una neurona.

#Para clasificar correctamente el operador lógico OR (o inclusivo) 
#con una neurona, es suficiente tener un peso positivo en 
#cada una de las entradas y un sesgo negativo en la salida. Es decir, si la entrada 1 es 0, la entrada 2 es 1 y el sesgo es -0.5, entonces la salida será 1, que es el resultado correcto para el operador OR.

#Por otro lado, para clasificar correctamente el operador lógico XOR (o exclusivo) 
#con una neurona, no es posible hacerlo con una única neurona ya que este operador no es linealmente separable. 
# Se requieren al menos dos neuronas y una capa oculta para lograr una clasificación correcta.
