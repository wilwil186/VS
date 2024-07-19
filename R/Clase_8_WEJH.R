# Cargamos la base de datos iris
iris.df = data.frame(iris)

# Resumen estadístico de las variables de iris
summary(iris.df)

# Boxplot de las variables de iris
par(mfrow=c(1,1), mar=c(6.5,2.5,0.5,0.5),xpd=NA)
boxplot(iris.df[,1:4],ylim=c(0,8),las=2)

# Muestreo Aleatorio simple (MAS) sobre la base de datos
iris.sample <- sample(1:nrow(iris.df),nrow(iris.df)*0.75,
                      replace=FALSE)

# Boxplot de la muestra aleatoria simple
par(mfrow=c(1,2),mar=c(6.5,2.5,1.5,0.5),xpd=NA)
boxplot(iris.df[,1:4],ylim=c(0,8),main="base completa",las=2)
boxplot(iris.df[iris.sample,1:4],ylim=c(0,8),
        main="muestra: aleatoria simple",las=2)

# Cargamos la librería "splitstackshape"
install.packages("splitstackshape")
library(splitstackshape)

# Mesuteeo estractificado

# Creamos una muestra estratificada con la variable "Sepal.Length"
iris.strat1 <- stratified(iris, "Sepal.Length", 0.7)

# Boxplot de la muestra estratificada 1
par(mfrow=c(1,2),mar=c(6.5,2.5,1.5,0.5),xpd=NA)
boxplot(iris.df[,1:4],ylim=c(0,8),main="base completa",las=2)
boxplot(iris.strat1[,1:4],ylim=c(0,8),
        main="muestreo estratificado 1",las=2)

# Creamos una muestra estratificada con las variables "Sepal.Width" y "Petal.Width"
iris.strat2 <- stratified(iris,c("Sepal.Width","Petal.Width"), 0.7)

# Boxplot de la muestra estratificada 2
par(mfrow=c(1,2),mar=c(6.5,2.5,1.5,0.5),xpd=NA)
boxplot(iris.df[,1:4],ylim=c(0,8),main="base completa",las=2)
boxplot(iris.strat2[,1:4],ylim=c(0,8),
        main="muestreo estratificado 2", las=2)
<