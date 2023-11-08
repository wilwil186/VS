# Wilson Eduardo Jerez Hernández
# Cod. 20181167034
# Fecha: 9 de marzo del 2023

# Gradiente decendente 
# se espera una función convensa 
datos = matrix(c(1,3,2,5,4,8),ncol=2,byrow=T)
colnames(datos) <- c('x','y')
print(datos)

plot(datos,xlim = c(0,5),ylim = c(0,8),xlab='x',ylab='y')

abline(a=0,b=1) # pendiente 1 intersecto 0

install.packages('ggplot2')
library(ggplot2)

datos <- data.frame(x = c(1, 2, 4), y = c(3, 5, 8))

error_cuadratico_medio <- function(theta, x, y) {
  pred <- theta * x
  mean((y - pred)^2)
}

ajuste <- optim(par = 1, fn = error_cuadratico_medio, x = datos$x, y = datos$y, method = "BFGS")

theta_optimo <- ajuste$par

ggplot(datos, aes(x = x, y = y)) +
  geom_point() +
  geom_abline(intercept = 0, slope = theta_optimo, color = "red")



J <- function(t)
  (7/2)*t^22-15*t+(49/3)


theta_0 <- 5 # valor inicial 
alpha <- 0.001 # tasa de aprendizaje 
n <- 1 # numero de iteraciones
install.packages('numDeriv')
library(numDeriv)
thetas <- rep(NA,n+1)
thetas[1] <- theta_0
for (i in 2:(n+1)){
  thetas[i] <- thetas[i-1]-alpha*grad(func=J,x=thetas[i-1])
}
J_thetas = J(thetas)

t =seq(-1,5.3,length=100)
plot(t,((7/2)*t^22-15*t+(49/3)))

# Adicionalmente al script que se desarrolló en clase, al final de este adicione el código que soluciona el problema: "Encontrar la recta que mejor se ajuste a los mismos tres puntos del problema planteado en clase, pero esta vez la recta debe tener pendiente e intercepto".


# Función de costo (en este caso, la de una recta)
j <- function(theta0, theta1) {
  sum((datos[,2] - theta0 - theta1*datos[,1])^2) / (2*nrow(datos))
}

# Inicialización de parámetros
theta0 <- 0
theta1 <- 0
alpha <- 0.25
n <- 100

# Ciclo for para el descenso de gradiente
for (i in 1:n) {
  temp0 <- theta0 - alpha*(1/nrow(datos))*sum(theta0 + theta1*datos[,1] - datos[,2])
  temp1 <- theta1 - alpha*(1/nrow(datos))*sum((theta0 + theta1*datos[,1] - datos[,2])*datos[,1])
  theta0 <- temp0
  theta1 <- temp1
}

# Resultado final (recta ajustada)
plot(datos, xlim = c(0,5), ylim = c(0,8), xlab = "x", ylab = "y")
abline(a = theta0, b = theta1, col = "red", lwd = 3)
