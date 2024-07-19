# 7 de oct del 2023
# seminario de estadistica clasica y bayesiana 

n <- 500 
m <- 10000 
datos <- matrix(nrow=m,ncol=n)
for (i in 1:m) {
   datos[i,] <- runif(n,1,5)
}
datos 
media <- rowMeans(datos)
media
datos <- cbind(datos,media)
datos
hist(media,breaks=15)
mean(media)
var(media)
x <- runif(500,1,5)
