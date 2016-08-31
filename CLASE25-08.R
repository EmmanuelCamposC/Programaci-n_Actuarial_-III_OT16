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
data <- read.table("Datos_S&P.csv",T,",")
data


