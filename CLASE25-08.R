#Clase de 25/08/2016

#Crear Vectores
x <-vector(mode="numeric", length = 5L)
x

# Crear vectores con la función C
x <- c(0.5,0.6)
x
class(x)

x <- c(TRUE,FALSE, T, F)
x 
class(x)

x <- 10:0
x 
class(x)

x <- c(1+2i,5,3+9i,-4-5i)
x
class(x)

x <- c("a","b","c","d")
x
class(x)

#Mezcla de Objetos
y <- c(1.7,"a") #caracter
y
class(y)

y <- c(T,2)     #numérico
y
class(y)

y <- c("a",T)   #caracter
y
class(y)

y <-c(T, 10L, 8, 1+1i) 
y
class(y)

# Orden de coacción/coerción explicita
# 1 character
# 2 complex
# 3 numeric
# 4 integer
# 5 logical

# Coerción explícita
z <- 0:6
class(z)
as.numeric(z)
as.logical(z)
as.character(z)

z <- c(1+2i, 3+4i, 8, 0+3i,0)
as.logical(z)

z <- c("programación","me cansa","Act.3")
as.numeric(z)
as.logical(z)
as.complex(z)

# Listas (es como un vector de vectores y cada uno tiene su propia clase,
# una colección de vectores)
x <-list(4,"a",5L,4+8i,T)
x
class(x)

# Matríces
m <- matrix(nrow = 2,ncol = 3)
m
dim(m)
attributes(m)
#cambio de dimensiones de 2x3 por 3x2 
dim(m) <- c(3,2)
m
#crear una matriz con datos
m <-matrix(1:6, nrow = 3, ncol = 2 )
m

m <-matrix(1:6,3,3,T)
m
class(m)
str(m)

dim(m) <- c(2,5) #error

x <- c(1,2,3)
y <- c("a","b","c")
z <- c(x,y)
z

m1 <- rbind(m,x)
m1
  
m2 <- cbind(m,x)
m2
  
rbind(m1,y)
cbind(m2,y)

#factores 
x <- factor(c("si","no","si","si","no","si","no"))
x
table(x)
unclass(x)
x <- factor(c("si","no","si","si","no","si","no"),levels = c("si","no")) #unclass(x)

x <- factor(c("azul","azul","rojo","azul","amarillo ","verde","azul"))
x
table(x)

#Valores faltantes 
x <- c(1,2,NaN,10,3)
is.na(x)
is.nan(x)

#Data Frames
x <- data.frame(Erick = 1:4, Lori = c(T,T,F,F))
row.names(x) <- c("Primero","Segundo","Tercero","Cuarto")
x
nrow(x)
ncol(x)
attributes(x)
names(x) <- c("Yarely","Karen")
x





# Los nombres no son exclusivos de los data frames
x <- 1:3
names(x) #NULL
names(x) <- c("Hugo","Paco","Luis")
x

x <- list(a=1:10,b=100:91,c=51:60)
x
names(x) <- c("seq1","SEQ2","sEq3")
x


m <- matrix(1:4,2,2)
m 
attributes(m)
dimnames(m) <- list(c("fil1","fil2"),c("col1","col2"))
m

#lectura de datos 
getwd()
setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16")
data <- read.csv("Datos_S&P.csv")
data <- read.table("Datos_S&P.csv",T,",", nrows = 100)
clases <-sapply(data, class)
data <- read.table("Datos_S&P.csv",T,",", colClasses = clases) #WTF
data

#Uso de dput y dget
y <- data.frame(a =1 , b ="a")
dput(y)
dput(y, file = "y.R")
nueva.y <- dget("y.R")
y
nueva.y

x <- "Programación Acturial III"
y <- data.frame(a=1,b="a")
dump(c("x","y"), file = "data.R")
rm(x,y)
x
source("data.R")
x <- airquality
x
dput(x, file = "HEAD_Airquality.R")
guardo <- dget("HEAD_Airquality.R")
guardo

con <- url("http://www.fcfm.buap.mx/","r")
x <- readLines(con,7)
x

#Creamos un vector
x <- c("a","b","a","c","d","e")
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
#Extraemos un elemento por nombre, lo extrae como lo que es y no como parte de la lista
x$bar
x[["bar"]]
x["bar"]
x$foo[2]

#Creamos una lista de 3 elementos
x <- list(foo = 1:4, bar = 0.6, baz = "Hola")
#Extraemos el primer y tercer elemento de la lista 
x[c(1,3)]
x[[c(1,3)]]
name <- "foo"
x[[name]]
x$name
x$foo

# Se puede extraer elementos de los elementos extraídos 
x <- list( a = list(10,12,14), b = list(3.14,2.81))
x[[c(1,3)]]
x[[1]][[3]]

x <- matrix(1:6, 2,3)
x
x[1,2]
x[2,1]
x[1,]
x[,2]
#El resultado es un vector 
x[1,2]
#con drop  = F, se matiene la dimensión y
# el resultado será una matriz.
x[1,2, drop = F]
#si dejamos solamente el espacio, el resultado será un vector 
x[1,]
#Si usamos drop = F, el resultado será una matriz.
x[1, ,drop = F]

#Curioso
x <- list(asd = 1:5)
x$a
X[["asd"]]
x[["a", exact = F]]

#VAlores Faltantes 
airquality[1:6,]
completos <- complete.cases(airquality)
completos
airquality[completos,][1:6,]
airquality[1:6,][completos,]

#Operaciones vectores  
x <- 1:4 ; y <- 9:6
x + y
x > 2
x >= 2
x == 8
x * y
x / y

#Operaciones matriz 
x <- matrix(1:4,2,2) ; y <- matrix(rep(10,4),2,2)
x * y # multiplica los elementos
x / y 
x %*% y # %*% multiplica las matrices 

#Estructuras control
y <-if (x>3){
    10 #instruciones
} else {
    0 #otras
}

for (i in 1:10){print(i)}

x <- c("a","b","c","d")
for ( i in 1:4){print(x[i])}
for ( i in seq_along(x)){print(x[i])}
for ( letra in x){print(letra)}

x <- matrix(1:6, 2,3)
x
for (i in seq_len(nrow(x)) ){
  for (j in seq_len(ncol(x))) {
    print(x[i,j])
  }
}

#while
z <- 5
while (z>= 3 &&  z<= 10) {
  print(z)
  moneda <- rbinom(1,1,0.5)# variable binomial,
  # cuantos datos, numero de intentos , probabilidad de exitos  
  if (moneda==1){#caminata aleatoria
    z <- c(z+1)
  } else { 
    z <- (z-1)
    }
}
for (i in 1:100) {
  

z <- 5
d <- vector("numeric")
while (z>= 3 &&  z<= 10) {
  print(z)
  d <- c(d,z)
  moneda <- rbinom(1,1,0.5)# variable binomial,
  # cuantos datos, numero de intentos , probabilidad de exitos  
  if (moneda==1){#caminata aleatoria
    z <- z+0.5
  } else { 
    z <- z-0.5
  }
 }
}
#d
#plot(d, type = "l")

#Creación de funciones
suma2 <- function(x,y){
  x + y 
}

mayor10 <-function(x){
  x[x>10]
}

mayorque <- function(x,n){
  x[x>n]
}

promedioCol <- function(x, quitar.NA = T){
  nc <-ncol(x)
  medias <- vector("numeric",nc)
  for (i in 1:nc) {
    medias[i] <- mean(x[,i], na.rm = quitar.NA)
  }
  medias
}

#Evaluación perezosa 
f <- function(a,b){
  print(a)
  #print(b)
}

f(2)





