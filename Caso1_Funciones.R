pcol <- function(x,m, quitar.NA = T){
  med <- mean(x[,m], na.rm = quitar.NA)
  med
}


directorio <-  setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16/specdata")
ar <- read.csv("001.csv")
archi<- ar
media <- pcol(archi,3,quitar.NA = T)
media
mediacontaminante <- function(directorio,y,id=1:332){
  j <- 0
  cta <- 0
  if (y=="sulfate"){ j=2 }
  if (y=="nitrate"){ j=3 }
  for (k in id) {
  if (i<10) { 
   ar <- read.csv(paste("00",k,".csv", sep = ""))
  }
  if (k>= 10 && k< 100){
      ar <- read.csv(paste("0",k,".csv", sep = ""))
  }
  if (k>=100) { 
    ar <- read.csv(paste(k,".csv", sep = ""))
  }
    archi<- ar
    media <- pcol(archi,j,quitar.NA = T)
    cta <- cta + pcol(archi,j, quitar.NA = T)
  }
  prom = cta/k
  prom
}
mediacontaminante(directorio,"sulfate",1:300)


setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16")
getwd()
dput(pcol, file = "pcol.R")
dput(directorio, file = "directorio.R")
dput(mediacontaminante, file = "mediacontaminante.R")


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

completos<- data.frame()

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
completos(directorio,3:110)


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


corr(directorio, 20)

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








