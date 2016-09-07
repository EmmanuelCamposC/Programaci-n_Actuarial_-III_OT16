setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16")
da <- read.csv("Datos_S&P.csv")
da <- read.table("Datos_S&P.csv",T,",")
da
s <-`class<-`(da,10)
s 

#Creamos un vector 05/09/2016
x <- c("a","b","c","c","d","e")
x
#Extramos []
x[1]
x[2]
#también podemos con secuencias de elementos
x[1:4]
#es posible extraer elmentos que cumplen condiciones
x[x>"b"]
#de Manera equivalente
u <- x=="c"
u
x[u]

#Creamos una lista
x <- list(foo = 1:4, bar = 0.6)
#extraemos el primer elemento de la lista 
# este elmento es una lista  que contiene una secuencia 
x[1]
#extramos nuevamente el primer elemento de la lista,
#ahora el elemtento es la lista en si 
x[[1]]
#Extraemos un elemento por nombre 
x$bar
x[["bar"]]
x["bar"]




