#26 sep
lm 
lm <- function(x){x*x}
lm
rm(lm)
lm #está en stats
search()

library(stats)
search()
searchpaths()

hacer.potencia <- function(n){
  potencia <- function(x){
    x ^ n
  }
  potencia
}
hacer.potencia(3)

cubica <- hacer.potencia(3)
cuadrada <- hacer.potencia(2)
cubica(3)
cuadrada(3)

#entorno 
 ls(environment(cubica))
 get("n",environment(cubica))
 ls(environment(cuadrada))
 get("n",environment(cuadrada))

#PRUEBA A 4 ESPACAIOS
 #  tabulacion
 
    
 # dates and tomes
 x <-as.Date("1970-01-01")
 x
 unclass(x)
 unclass(as.Date("1970-01-02"))
date()
as.POSIXct(date())
 

    #lapply

?match.fun
 ?!is.vector
#function (X, FUN, ...) 
#{
#    FUN <- match.fun(FUN)  . match.fun busca si el argumento es una funcion en algun lado
#    if (!is.vector(X) || is.object(X)) .si no es un vector ó es un objeto
#        X <- as.list(X)  .coecciona 
#    .Internal(lapply(X, FUN))  .resuleve las operaciones en C
#}
#<bytecode: 0x0000000005cf6e90>
#    <environment: namespace:base>
 
 x <- list( a= 1:5 , b = rnorm(10000)) # rnorm genera numeros aleatoriios, distribucion normal
    lapply(x, mean) 

 x <- list(a = 1:5, b = rnorm(10), c = rnorm(10,1), d = rnorm(10,2))
    lapply(x, mean)
    sapply(x, mean) # en este caso regresa un vector, es casi lo mismo que lapply
                    # pero dependiendo del resultado nos regresa una lista, matriz o vector

 x <- 1:4
  lapply(x, runif)
  lapply(x, runif, max = 15, min = 5) # max es el numero mas grande hasta el 
                                      #que llega 
  sapply(x, runif,max = 15, min = 5)  #regresa una lista
 
 # apply
 x <- matrix(rnorm(200), 20, 10)
 apply(x, 2, mean)#saca el promedio de cada columna, columnas variables
 
 apply(x, 1, sum)# saca el promedio de cada fila, filas son registros 
 
 x <- matrix(rnorm(200), 20, 10)
  apply(x, 1, quantile, probs = c(.25, .75))
  # te dice el numero en el cual el 25 % de los datos son menores a el 
  
 a <- array(rnorm(2*2*10), c(2,2,10))
  apply(a,c(1,2),mean) # el promedio del primer elemento  y asi sucesivamente
  rowMeans(a, dims = 2)
  
  #Mapply
 list(rep(1,4),rep(2,3),rep(3,2),rep(4,1))
  mapply(rep,1:4,4:1) #hacen lo mismo, puede servir para tablas. sirve para armar
   # valores vectorizados ejm.
  
  noise
  
  
  #tapply recive
 x <- c(rnorm(10), runif(10), rnorm(10,1))
 f <- gl(3,10) #genera niveles, 3 nivels 10 veces aparecen
  tapply(x,f,mean)
  tapply(x,f,mean, simplify = F) #los siplifica si es que puede
  
  #split
  x <- c(rnorm(10), runif(10), rnorm(10,1))
  f <- gl(3,10) #genera niveles, 3 nivels 10 veces aparecen
   split(x,f)
   lapply(split, x, f)
  
  #Split en data frame  
   library(datasets)
   head(airquality)
  print(airquality)
  split(airquality, airquality$Month)
  
  s <- split(airquality, airquality$Month)
  lapply(s, function(x) colMeans(x[,1:3], na.rm = T))
  #como nos da algo que podemos reordenar ent. ocupamos sapply, para simplificarlo
  sapply(s, function(x) colMeans(x[,1:4], na.rm = T))
  
  #Manejo de errores 
  traceback()#te muestra como fue corriendo y cual fue el ultimo paso ejecutado 
  #que no corrio bien
  debug(lm)#muestra paso a paso hasta encontrar el error, con "n" camina
  
  #cuando hay error
  #con selection marcas donde quieres verificar cuando te manda a un error
  
  
  
  
  
  
  
  
  
  
  