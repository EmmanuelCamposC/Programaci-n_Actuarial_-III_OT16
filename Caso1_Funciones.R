pcol <- function(x,m, quitar.NA = T){
  med <- mean(x[,m], na.rm = quitar.NA)
  med
}


directorio <-  setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16/specdata")
ar <- read.csv("001.csv")

mediacontaminante <- function(directorio,y,id=1:332){
  j <- 0
  b <- 0
  cta <- 0
  if (y=="sulfate"){ j=1 }
  if (y=="nitrate"){ j=2 }
  for (k in id) {
  if (k<10) { 
   ar <- read.csv(paste("00",k,".csv", sep = ""))
  }
  if (k>= 10 && k< 100){
      ar <- read.csv(paste("0",k,".csv", sep = ""))
  }
  if (k>=100) { 
    ar <- read.csv(paste(k,".csv", sep = ""))
  }
    comp <- complete.cases(ar)
    full <- ar[comp, 2:3]
    cta <- cta + nrow(full)
    b <- b + sum(full[,j])
  }#tenemos que sacar el promedio total 
  prom <- b/cta
  prom
}
mediacontaminante(directorio,"sulfate",1:10)
ar <- read.csv("001.csv")
comp <- complete.cases(ar)
full <- ar[comp, 2:3]
cta <- nrow(full)
b <- sum(full[,1])
ar <- read.csv("002.csv")
comp <- complete.cases(ar)
full <- ar[comp, 2:3]
cta2 <- nrow(full)
v <- sum(full[,1])
e <- v+b
ee <- cta2 + cta
e/ee

mediacontaminante(directorio,"nitrate",70:72)

setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16")
getwd()
dput(pcol, file = "pcol.R")
dput(directorio, file = "directorio.R")
dput(mediacontaminante, file = "mediacontaminante.R")
summary(corr(directorio, 400))


completos(directorio,2)
directorio
setwd(directorio)
archivo <- read.csv("001.csv")
getwd()
com <- complete.cases(archivo) 
full <- archivo[com,2:3]
nrow(full)
caso <- vector("numeric",2)
for (i in 1:2) {
  archivo <- read.csv(paste("00",i,".csv", sep = ""))
  com <- complete.cases(archivo) 
  completos <- archivo[com,2:3]
  caso[i] <-nrow(completos)
  
}


completos <- function(directorio, id=1:332){
  setwd(directorio)
  llenado <- vector("numeric")
  for(k in id) {
    if (k<10) {
      archivo <- read.csv(paste("00", k, ".csv", sep=""))
    }
    if(k>=10 && k<100 ) {
      archivo<-read.csv(paste("0", k,".csv", sep=""))
    }
    if(k>= 100) {
      archivo<-read.csv(paste(k,".csv",sep=""))
    }
    comp <- complete.cases(archivo)
    full <- archivo[comp, 2:3]
    llenar <- nrow(full)
    llenado <- c(llenado,llenar)
  }
  daframe <- data.frame(id=id,nobs=llenado)
  daframe
}
completos(directorio,30:25)


corr <- function(directorio, horizonte = 0){
  setwd(directorio)
  x <- vector("numeric")
  y <- vector("numeric")
  llenado <- vector("numeric")
  for(k in 1:332) {
    if (k<10) {
      archivo <- read.csv(paste("00", k, ".csv", sep=""))
    }
    if(k>=10 && k<100 ) {
      archivo<-read.csv(paste("0", k,".csv", sep=""))
    }
    if(k>= 100) {
      archivo<-read.csv(paste(k,".csv",sep=""))
    }
    comp <- complete.cases(archivo)
    full <- archivo[comp, 2:3]
    llenar <- nrow(full)
    if (llenar >= horizonte) {
      x <- cor(full[,1],full[,2])
      correla <- as.vector(x)
      y <- c(y,correla)
    }
  }
   y
}


corr(directorio, 5000)
head(corr(directorio,150))

setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.1")
getwd()
dput(pcol, file = "pcol.R")
dput(directorio, file = "directorio.R")
dput(mediacontaminante, file = "mediacontaminante.R")
dput(completos, file = "completos.R")
dput(corr, file = "corr.R")

archivo <- read.csv("001.csv")
archi <- read.csv("002.csv")
comp <- complete.cases(archivo)
full <- archivo[comp, 2:3]
llenar <- nrow(full)
llenar
pcol(full,1,T)
suma2(archivo[comp,2],archivo[comp,3])
suma2(full[,2],full[,1])
sum(suma2(full[,2],full[,1]))
sum(full[,1])
sum(full[,2])


mediacontaminante <- function(directorio, contaminante, id= 1:332){
  setwd(directorio)
  suma2 <- 0
  nf2 <- 0
  promedio <- 0
  j <- 0
  if (contaminante== "sulfate") {
    j= 2
  } else if(contaminante == "nitrate"){
    j=3
  } else {
    
  }
  
  for(i in id) {
    #lectura de datos
    if (i<10) {
      tabla <- read.csv(paste("00", i, ".csv", sep=""))
    }else if(i>=10 && i<100 ) {
      tabla<-read.csv(paste("0", i,".csv", sep=""))
    }else {
      tabla<-read.csv(paste(i,".csv",sep=""))
    }
    
    #Datos sin Na o NaN
    columna<-tabla[j]
    buenos <- complete.cases(columna)
    nuevo <- tabla[buenos, ]
    
    
    #cuenta el no. de filas
    nf <- nrow(nuevo)
    nf2 <- nf2+nf
    
    #suma los datos de cada tabla
    suma <- sum(nuevo[,j])
    suma2 <- suma2+suma
  }
  promedio <- suma2/nf2
  print(promedio)
}
mediacontaminante(directorio,"sulfate",1:10)


+columna <- 0
+tabla <- 0
+mediocontaminante <- function(directorio,contaminante,id = 1:332){
  +
    +  if (contaminante=="sulfate"){
      +    x = 2
      +  }else if (contaminante == "nitrate" ) {
        +    x = 3
        +  }
  +  suma<-0
  +  promedio1<-0
  +  suma2 <-2
  +  n<-0
  +  for (i in id) {
    +    if (0<i && i<10){
      +      tabla <- read.csv(paste("00",i,".csv",sep=""))
      +    }else if (i>9 && i<100){
        +      tabla <- read.csv(paste("0",i,".csv",sep=""))
        +    }else {
          +      tabla <- read.csv(paste(i,".csv",sep=""))
          +    }
    +  
      +    columnas <- tabla[x]
      +    columnabien <- na.omit(columnas)
      +    numfilas <- nrow(columnabien)
      +
        +
        +    for (j in 1:numfilas){
          +      suma <- suma + columnabien[j,]
          +      
            +    }
      +    suma2 <- suma/numfilas
      +        n <- n+1
      +    promedio1<- promedio1+suma2
      +    
        +    suma2 <- 0
        +    suma <- 0 
        +  }
    promedio2 <- promedio1/n
    "este es tu promedio"
    print(promedio2)
  
    }


