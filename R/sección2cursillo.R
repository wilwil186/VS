Reclamar <- c(4,1,0,2,4,0,2,0,2,3)
Errores <- c(3,2,2,1,1,3,3,1,4,2)
Spam <- c(1,0,0,0,1,0,1,0,1,1)
data <- cbind(Spam,Reclamar,Errores)
data <- data.frame(data)
plot(Reclamar,Spam)
plot(Errores,Spam)
plot(Reclamar,Errores, col=Spam+1)
model <- glm(Spam ~ ., data = data, family = binomial)
summary(model)
abline(a = 95.74/23.68, # Intercepto
       b = -24.19/23.68)  # Pendiente
install.packages("caTools")
Features <- data[,-1]
model1 <- LogitBoost(Features, Spam)
