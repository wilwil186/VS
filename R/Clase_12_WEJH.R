#regresion polinomica

pop <- data.frame(uspop)
pop$uspop <- as.numeric(pop$uspop)
pop$year <- seq(from=1790,to=1970,by=10)
plot(y = pop$uspop,x=pop$year,
     main= "Poblacion de los estados unicods de 1790 a 1970 ",xla="Año",
     ylab="poblacion")

# modelos lineal 
lm1 <- lm(pop$uspop~pop$year)
summary(lm1)


# Graficos de residuos
plot(y=pop$uspop,x=pop$year,main="Poblacion de Estados unidos de 1790 a 1970",
     xlab="año",ylab="poblacion")
abline(a=coef(lm1[1]),b=coef(lm1)[2],lty=2,col="red")

lm2 <- lm(pop$uspop~poly(pop$year,2))
summary(lm2)

lm3 <- lm(pop$uspop~poly(pop$year,3))
summary(lm3)
lm4 <- lm(pop$uspop~poly(pop$year,4))
summary(lm4)
lm5 <- lm(pop$uspop~poly(pop$year,5))
summary(lm5)
lm6 <- lm(pop$uspop~poly(pop$year,6))
summary(lm6)

plot(y=pop$uspop,x=pop$year,main="Poblacion de Estados unidos de 1790 a 1970",
     xlab="año",ylab="poblacion")
pop$lm2.predict = predict(lm2,newdata=pop)
lines(sort(pop$year),fitted(lm2)[order(pop$year)],col="blue",lty=2)

# Graficos de residuales por cada modelo 
par(mfrow = c(2, 3))
plot(resid(lm1),main ="Grado 1",xlab = "Sucesión de años",
     plot(resid(lm2),main = "Grado 2",xlab = "Sucesión de años",
          plot(resid(lm3),main = "Grado 3",xlab = "Sucesión de años",
               plot(resid(lm4),main = "Grado 4",xlab="Sucesión de años",
                    plot(resid(lm5),main="Grado 5",xlab="Sucesión de años",
                         plot(resid(lm6), main="Grado 6", xlab="Sucesión de años",ylab ="Residuos"),ylab="Residuos"),ylab="Residuos"),ylab="Residuos"),ylab = "Residuos"),ylab="Residuos")

# Suma de risiduales
c(sum(abs(resid(lm1))),sum(abs(resid(lm2))),sum(abs(resid(lm3))),
  sum(abs(resid(lm4))),sum(abs(resid(lm5))),sum(abs(resid(lm6))))
## Bondad del ajuste con datos: los peligros del sobreajuste 

uspop.2020 <- data.frame(year=c(1980,1990,2000,2010),
                         uspop=c(226.5,249.6,282.2,309.3))
uspop.2020.predict <- uspop.2020
pop2 <- data.frame(uspop)
pop2$uspop <- as.numeric(pop$uspop)
pop2$year <- seq(from=1790, to = 1970,by=10)

uspop.2020.predict$lm1 <- predict(lm(uspop~poly(year,1),data=pop2),uspop.2020)
uspop.2020.predict$lm2 <- predict(lm(uspop~poly(year,2),data=pop2),uspop.2020)
uspop.2020.predict$lm3 <- predict(lm(uspop~poly(year,3),data=pop2),uspop.2020)
uspop.2020.predict$lm4 <- predict(lm(uspop~poly(year,4),data=pop2),uspop.2020)
uspop.2020.predict$lm5 <- predict(lm(uspop~poly(year,5),data=pop2),uspop.2020)
uspop.2020.predict$lm6 <- predict(lm(uspop~poly(year,6),data=pop2),uspop.2020)



# and, finally , calculate the MSE

c(sqrt(mean((uspop.2020.predict$uspop - uspop.2020.predict$lm1)^2)),
  sqrt(mean((uspop.2020.predict$uspop - uspop.2020.predict$lm2)^2)),
  sqrt(mean((uspop.2020.predict$uspop - uspop.2020.predict$lm3)^2)),
  sqrt(mean((uspop.2020.predict$uspop - uspop.2020.predict$lm4)^2)),
  sqrt(mean((uspop.2020.predict$uspop - uspop.2020.predict$lm5)^2)),
  sqrt(mean((uspop.2020.predict$uspop - uspop.2020.predict$lm6)^2)))
#simplicidad del moedlo y bondad del



table((summary(lm1)$coefficients[,4]<0.05))
summary(lm1)$r.squared



model.order <- c(1,2,3,4,5,6)
coef.true <- c(
  table((summary(lm1)$coefficients[,4])<0.05) - 1
  ,table((summary(lm2)$coefficients[,4])<0.05) - 1
  ,table((summary(lm3)$coefficients[,4])<0.05)[2] - 1
  ,table((summary(lm4)$coefficients[,4])<0.05)[2] - 1
  ,table((summary(lm5)$coefficients[,4])<0.05)[2] - 1
  ,table((summary(lm6)$coefficients[,4])<0.05)[2] - 1
)
coef.false <- c(
  0
  ,0
  ,table((summary(lm3)$coefficients[,4])<0.05)[1]
  ,table((summary(lm4)$coefficients[,4])<0.05)[1]
  ,table((summary(lm5)$coefficients[,4])<0.05)[1]
  ,table((summary(lm6)$coefficients[,4])<0.05)[1]
)
model.rsq <- c(
  summary(lm1)$r.squared
  ,summary(lm2)$r.squared
  ,summary(lm3)$r.squared
  ,summary(lm4)$r.squared
  ,summary(lm5)$r.squared
  ,summary(lm6)$r.squared
)




model.comparison <- data.frame(model.order, model.rsq, coef.true, coef.false)
model.comparison$goodness <- (model.comparison$coef.true / model.comparison
                              $model.order)
knitr::kable(model.comparison)






model.comparison$rank<-sqrt(model.comparison$goodness^2 + model.comparison$model.rsq^2) 
knitr::kable(model.comparison)