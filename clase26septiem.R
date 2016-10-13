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
  
  #swirl es un estilo de tutorial
  
  #05/10/16
  #str, nos da informacion ultil, un resumen de programador
  #nos dice su tamaño, clase, los primeros elementos y que es
  str(str)
  str(lm)
  str(ls)
  x <- rnorm(100)
   str(x)
   summary(x)
  f <- gl(40,10)
   str(f)
   summary(f)
  
   str(airquality)
   
  m <- matrix(rnorm(100),10,10)
   m
   str(m)
  
  s <- split(airquality,airquality$Month) 
   s
   str(s)
   
  #generacion de alatorios
   #dnorm te dice la probabilidad de que sea exactamente un número 
   # d desidad
   # r genera una variable aleatoria 
   # p 
   
  x <- rnorm(10)
   x
  
  y <- rnorm(10,50,5)
   y
   
  summary(x) 
  summary(y) 
  
  set.seed(1)
  rnorm(5)
  set.seed(2)
  rnorm(5)
  
  normal1 <- rnorm(10000)
  normal2 <- rnorm(10000,10,5)
  hist(normal1)
  summary(normal1)
  hist(normal2)
  summary(normal2)
  
  rpois(10,1)
  poisson1 <- rpois(10000,1)  
  poisson2 <- rpois(10000,10)
  hist(poisson1)
  hist(poisson2)
  
  ppois(2,2)
  ppois(4,2)
  ppois(6,2)
  
  hist(rpois(10000,2))
  rpois(10000,2) == 0
  length(m)
  for (i in 0:11) {
      print(dpois(i,2))
  }
  #length(rpois(10000,2)[rpois(10000,2)==1])/10000
  #as.numeric(as.integer(probs *10000))/100
  
  hist(runif(10000,10,20))
  
  set.seed(20)
  x <- rnorm(100)
  e <- rnorm(100, 0, 2)
  y <- 0.5 + 2*x + e 
  plot(x,y)
  
  z <- 0.5 +2* x
   plot(x,z)
   summary(y)
  
   #rbinom
  set.seed(10)
   x <- rbinom(100,1,0.5) #1 intentos, 0.5 la probabilidad de exito con un intento
   #y digamos son 100 intentos 
   e <- rnorm(100,0,1) #original era 2-1
   y <- 0.5 + 6*x + e # 6-2
   summary(y)
   plot(x,y, main = "Modelo Lineal", col="Blue")
   
  set.seed(1)
   x <- rnorm(100)
   log.mu <- 0.5 + 0.3*x
   y <- rpois(100,exp(log.mu))
   summary(y)
   plot(x,y, main = "Modelo Poisson", col="Forestgreen")
   
   #10 de octubre
   #Muestreo
   set.seed(1)
   sample(1:10,4)
   sample(1:10,4)
   sample(letters,5)
   sample(1:10)
   sample(1:10)
   sample(1:10, replace = T)#10^10
   
   #Perfilaje
   #user time el tiempo que ocupa el cpu
   #elapsed time el tiempo que yo espere 
 system.time(readLines("http://www.fcfm.buap.mx"))
 
 hilert <- function(n){
     i <- 1:n
     1/outer(i-1,i,"+")
 }  
 x <-hilert(1000)  
 system.time( x <-hilert(1000))
 system.time(svd(x))
 #RProf() me dice cada .02 segundos en que función trabaja
 #No usar system y Rprof porque se puede ciclar...
 
 
   
   
   
   
   
   
   
   
   