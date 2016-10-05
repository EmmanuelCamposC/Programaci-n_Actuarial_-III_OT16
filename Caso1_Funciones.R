pcol <- function(x,m, quitar.NA = T){
  med <- mean(x[,m], na.rm = quitar.NA)
  med
}


directorio <-  setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16/specdata")
ar <- read.csv("001.csv")
getwd()
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
mediacontaminante(directorio,"sulfate",1:332)
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
mediacontaminante(directorio,"nitrate",1:10)
directorio <-  setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16/specdata")
ar <- read.csv("001.csv")
getwd()
completos <- function(directorio, id=1:332){
  setwd(directorio)
  getwd()
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
completos(directorio,1:5)
getwd()

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

