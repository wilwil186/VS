# Cargar la data 
data <- read.csv("/home/wilsonj/Documentos/VS/R/basesdedatos/spam_ham_dataset.csv")
View(data) # visualizamos los datos

# Dividir los datos en características (X) y etiquetas (y)
## Split de datos en train y test
# Split de datos en train y test


set.seed(42) # Para reproducibilidad, semilla de 42 lo que es un estandar de progamacion
split_size = 0.8
sample_size = floor(split_size*nrow(data))
sample_size

train_indices <- sample(seq_len(nrow(data)),size=sample_size)
train_indices

train <- data[train_indices,]
View(train)

test <- data[-train_indices,]
View(test)

X_train <- train$text # esto le asigna a la variable X el texto
y_train <- train$label_num # esto le asigna a la variable y la etiqueta que queremos clasificar
x_test <- test$text
y_test <- test$label_num

# Entrenar el modelo de regresión logística
model <- glm(y_train ~ X_train, data = data.frame(y = y_train, X = X_train), family = binomial)

