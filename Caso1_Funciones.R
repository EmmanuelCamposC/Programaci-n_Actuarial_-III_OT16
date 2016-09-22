pcol <- function(x,m, quitar.NA = T){
  med <- mean(x[,m], na.rm = quitar.NA)
  med
}

directorio <- setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16/specdata")

mediacontaminante <- function(directorio,y,z){
  j <- 0
  cta <- 0
  if (y=="sulfate"){ j=2 }
  if (y=="nitrate"){ j=3 }
#nombres
  for (k in 1:z) {
  if (i<10) { 
  archivo <- read.csv(paste("00",k,".csv", sep = ""))
  }
  if (k>= 10){
    if (k < 100){
      archivo <- read.csv(paste("0",k,".csv", sep = ""))
    } 
  }
  if (k>=100) { 
    archivo <- read.csv(paste(k,".csv", sep = ""))
  }
    
    arc<- archivo
    media <- pcol(arc,j, quitar.NA = T)
    cta <- cta + media
  }
  
  prom <- cta/z
  prom
}

mediacontaminante(directorio,"sulfate",332)
m <- matrix(1:2,2,3)
archivo <- read.csv("332.csv")
pcol(archivo,2)
pcol(m,2)
m





