import ccxt
import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestRegressor
from sklearn.metrics import r2_score

# Definir el marco de tiempo y el par de monedas que se utilizarán
timeframe = '30m'  # Marco de tiempo de 30 minutos
moneda = 'BNB/BTC'  # Par de monedas Binance Coin (BNB) a Bitcoin (BTC)

# Cargar el exchange de Binance con tus credenciales de API
exchange = ccxt.binance({
    'apiKey': 'TU_API_KEY_AQUÍ',
    'secret': 'TU_SECRET_KEY_AQUÍ',
})

# Obtener los datos históricos de precios de BTC/BUSD
historical_data = exchange.fetch_ohlcv(moneda, timeframe=timeframe, limit=100)

# Procesar los datos históricos
data = []
for item in historical_data:
    timestamp = item[0]
    open_price = item[1]
    high_price = item[2]
    low_price = item[3]
    close_price = item[4]
    volume = item[5]
    data.append([timestamp, open_price, high_price, low_price, close_price, volume])

# Convertir los datos a un DataFrame de pandas
df = pd.DataFrame(data, columns=['Timestamp', 'Open', 'High', 'Low', 'Close', 'Volume'])

# Crear una columna con el precio siguiente
df['Next Close'] = df['Close'].shift(-1)

# Eliminar la última fila (donde no hay precio siguiente)
df = df[:-1]

# Separar los datos en conjunto de entrenamiento y validación temporal
train_size = int(0.8 * len(df))
train_df = df[:train_size]
validation_df = df[train_size:]

# Seleccionar características para el modelo (variables de entrada)
X_train = train_df[['Open', 'High', 'Low', 'Volume']]
y_train = train_df['Next Close']

X_validation = validation_df[['Open', 'High', 'Low', 'Volume']]
y_validation = validation_df['Next Close']

# Crear y entrenar el modelo de Regresión Random Forest
rf = RandomForestRegressor(n_estimators=100, max_depth=None, min_samples_split=2)
rf.fit(X_train, y_train)

# Hacer la predicción en el conjunto de validación
y_pred = rf.predict(X_validation)

# Calcular el coeficiente de determinación (R^2) para evaluar el rendimiento del modelo
r2 = r2_score(y_validation, y_pred)
print("Coeficiente de determinación (R^2) en el conjunto de validación:", r2)

# Obtener los datos más recientes del par de negociación 'BNB/BTC'
ticker = exchange.fetch_ticker(moneda)
# Obtener el precio actual
current_price = ticker['last']

# Imprimir el precio actual
print('Precio actual de', moneda, current_price)

# Preparar los datos más recientes para la predicción
latest_features = [ticker['open'], ticker['high'], ticker['low'], ticker['baseVolume']]

# Hacer la predicción con el modelo entrenado
prediction = rf.predict([latest_features])[0]

# Calcular el stop loss y límite para una orden de compra o venta
stop_loss_pct = 0.03  # Porcentaje de pérdida deseado para el stop loss
if prediction > current_price:
    stop_loss = current_price - stop_loss_pct * current_price
    limit = stop_loss - 0.05
    order = 'Compra'
else:
    stop_loss = current_price + stop_loss_pct * current_price
    limit = stop_loss + 0.05
    order = 'Venta'

# Imprimir los resultados
print('Marco de tiempo:', timeframe)
print('Tipo de orden:', order)
print('Predicción del precio:', prediction)
print('Stop Loss:', stop_loss)
print('Límite:', limit)

