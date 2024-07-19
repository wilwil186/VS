
## Clase 5 30/03/2023

# Clasificación

# Regresión logistica 
data <- data_frame(mtcars$mpg,mtcars$am)
data
plot(x=mtcars$mpg, y =mtcars$am,xlab="Eficiencia del combustibles(millas por gálon)",
      ylab="tipo de transmición del vehiculo(0=manueal, 1=automatico)")

regresion <- lm(mtcars$mpg~mtcars$am)

install.packages("caTools")
library(caTools)

Label.train = train[,9]
Data.train = train[,-9]

Data.train
Label.train

model <- LogitBoost(Data.train,Label.train)
Data.test = test
Lab = predict(model, Data.test, type="raw")
data.frame(row.names(test),test$mpg,test$am,Lab)

# Métodos upervisaods de clustering 
plot(x= iris$Petal.Length,y= iris$Petal.Width,xlab="longitud del pétalo",
      ylab='Ancho del petalo')

data = data.frame(iris$Petal.Length,iris$Petal.Width)
iris.kmeans <- kmeans(data,2)

plot(x=iris$Petal.Length,y = iris$Petal.Width,pch=iris.kmeans$cluster,
      xlab="Longitud del pétalo",ylab="Ancho del pétalo",xlim=c(-1,8),ylim=c(-1,3))

points(iris.kmeans$centers,pch=8,cex=2)

iris.kmeans3 <- kmeans(data,3)

plot(x=iris$Petal.Length,y = iris$Petal.Width,pch=iris.kmeans3$cluster,
     xlab="Longitud del pétalo",ylab="Ancho del pétalo",xlim=c(-1,8),ylim=c(-1,3))
points(iris.kmeans3$centers,pch=8,cex=2,col="red")

par(mfrow=c(1,2))
plot(x=iris$Petal.Length,y = iris$Petal.Width,pch=iris.kmeans3$cluster,
     xlab="Longitud del pétalo",ylab="Ancho del pétalo")

plot(iris$Petal.Length,iris$Petal.Width,
     pch=as.integer(iris$Species))
