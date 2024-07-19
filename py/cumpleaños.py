import random

def paradoja(np):
  x=[]
  for i in range(0,np):
    x.append(int(random.random()*365))
  for j in range(0,np):
    for k in range(0,np):
      if(x[j] == x[k] and j != k):
        return 1
  return 0

if __name__ == "_main__":
  n = 0
  p = 0
  np = 70
  iter = 1000
  for i in range(0,iter):
    z = paradoja(np)
    if(z==1):
      p = p+1.0
    else: 
      n = n+1.0
  prom = (p/(p+n))*100
  print("\n Si se toma" + str(np) +"personas al azar ")
  print("Eso implica que la probabilidad promedio es "+ str(prom)+" %")