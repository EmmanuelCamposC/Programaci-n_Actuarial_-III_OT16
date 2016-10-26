setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16")
getwd()
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
head(outcome)
 outcome[, 11] <- as.numeric(outcome[, 11])
 ## You may get a warning about NAs being introduced; that is okay
 hist(outcome[, 11]) 
# > best("TX", "ataque")
# [1] "CYPRESS FAIRBANKS MEDICAL CENTER"
 
 mejor <- function(estado, resultado) {
     setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
        # Lectura de datos
     outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     val  <- unique(outcome[,7])
        # Revisión de la validez de estado y resultado
     if ((sum(val == estado) != 1)) {
         stop("estado invalido")
     }
     if (resultado == "ataque") { 
         j <- 11
     } else if (resultado == "falla"){
         j <- 17
     } else if (resultado == "neumonia"){
         j <- 23
     } else {
         stop("resultado invalido") 
     }
        # Regresa el nombre del hospital con la tasa más baja de mortalidad de 30 días
     tra <- subset(outcome, outcome[,11] != "Not Available" & outcome[,17] != "Not Available" & outcome[,23] != "Not Available")
     tra <- tra[tra$State == estado , c( 2, j)]
     tra1 <- tra[order(tra[,1]),]
     tra[which.min(tra[,2]),1]
 }
 
 
 source(mejor)
 mejor("TX","ataque")
 mejor("AL","falla")
 mejor("NY","neumonia")
 
 rankhospital <- function(estado, resultado, num = "mejor") {
     setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
     # Lectura de datos
     outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     val  <- unique(outcome[,7])
     tra <- subset(outcome, outcome[,11] != "Not Available" & outcome[,17] != "Not Available" & outcome[,23] != "Not Available")
     # Revisión de la validez de estado y resultado
     if ((sum(val == estado) != 1)) {
         stop("estado invalido")
     }
     if (resultado == "ataque") { 
         j <- 11
     } else if (resultado == "falla"){
         j <- 17
     } else if (resultado == "neumonia"){
         j <- 23
     } else {
         stop("resultado invalido") 
     }
     # Regresa el nombre del hospital con el puesto dado de la tasa más
     # baja de mortalidad de 30 días 
     tra1 <- tra[tra$State == estado , c( 2, j)]
     #tra1 <- tra1[order(tra1[,1]),]
     #tra2 <- which.min(tra1[,2])
     tra3 <- order(tra1[,2], tra1[,1], decreasing = F )
     #tra1 <- tra1[order(tra1[,2], decreasing = F ),]
     tra1 <- tra1[tra3,]
     
     if (is.numeric(num)){
         #num <- num - 1
         if ( num > nrow(tra1)){
             stop(return(NA))
         }
         tra2 <- num
         #for (i in 1:num) {
          #   tra2 <- which.min(tra1[,2])
           #  tra1 <- tra1[-tra2,]
             
         #}   
     } else if ( num == "mejor"){
         tra2 <- which.min(tra1[,2])
     } else if ( num == "peor"){
         tra2 <- which.max(tra1[,2])
     }
     tra1[tra2,1]
     
 }  
 rankhospital("TX","falla",4)
 rankhospital("MD","ataque","peor")
 rankhospital("TX","falla",5000)
 ?order
 fo <- c("B","A")
 fo <- order(c("B","A"))
 
 
 rankingcompleto <- function(resultado, num = "mejor") {
     setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
     outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     val  <- unique(outcome[,7])
     sigla <- vector("character")
     
     if (resultado == "ataque") { 
         j <- 11
     } else if (resultado == "falla"){
         j <- 17
     } else if (resultado == "neumonia"){
         j <- 23
     } else {
         stop("resultado invalido") 
     }
     val <- val[order(val)]
     tra <- subset(outcome, outcome[,11] != "Not Available" & outcome[,17] != "Not Available" & outcome[,23] != "Not Available")
     for (i in 1:length(val)) {
         tra1 <- tra[tra$State == val[i] , c( 2, j)]
         #tra1 <- tra1[order(tra1[,1], na.last = NA),]
         #tra2 <- tra1[order(tra1[,2], na.last = NA),]
         tra2 <- order(tra1[,2], tra1[,1], decreasing = F )
         tra1 <- tra1[tra2,]
         if (is.numeric(num)){
             
             #tra2 <- order(tra1[,2], tra1[,1], decreasing = F )
             #tra1 <- tra1[tra2,]
             #for (i in 1:num) {
             #    tra3 <- which.min(tra1[,2])
             #    tra1 <- tra1[-tra3,]
             #}
             sigla <- c(sigla, tra1[num,1])
             
         } else if ( num == "mejor"){
             sigla <- c(sigla, tra1[which.min(tra1[,2]),1])
         } else if ( num == "peor"){
             sigla <- c(sigla, tra1[which.max(tra1[,2]),1])
         }
     }
     daframe <- data.frame(Hospital= sigla, State=val)
     row.names(daframe) <- val
     daframe
     
 }
 mejor("MD","falla")
 rankingcompleto("ataque",10)
 ?next
 d <- "e"
 d <- c(d,NA)
 length(d)
 tra <- subset(outcome, outcome[,11] != "Not Available" & outcome[,17] != "Not Available" & outcome[,23] != "Not Available")
 tra1 <- tra[tra$State == "WI" , c( 2, 11)]
 tra2 <- order(tra1[,2], tra1[,1], decreasing = F )
 tra1 <- tra1[tra2,]
 tra1[10,1]
 tra1 <- tra1[order(tra1[,1], na.last = NA),]
 tra2 <- tra1[order(tra1[,2], na.last = NA),]
 which.min(tra2[,2])
 
 head(rankingcompleto("ataque", 20),10) 
 tail(rankingcompleto("neumonia", "peor"),3)
 tail(rankingcompleto("falla"),10)
 getwd()
 setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2/Funciones")
 setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
 
 dput(mejor, file = "mejor.R")
 dput(rankhospital, file = "rankhospital.R")
 dput(rankingcompleto, file = "rankingcompleto.R")
 dget("mejor.R")
 dget("rankhospital.R")
 dget("rankingcompleto.R")
 
 mejor("IL","neumonia")
 
 rankhospital("FL","neumonia",7)
 rankhospital("MN","ataque",6)
 rankhospital("IN","falla",8)
 
 rankingcompleto("falla", 7)
 rankingcompleto("neumonia", "peor")
 tail(rankingcompleto("falla"),10)
 
 
 
 
 
 rankhospital <- function(estado, resultado, num){
     
     outcome<-read.csv("outcome-of-care-measures.csv",colClasses= "character")
     
     #validar estado, resultados y num
     states <- unique(outcome[,7])
     validar <- states == estado
     suma <- sum(validar)
     
     resultados<-c("falla", "ataque","neumonia")
     validar2 <- resultados==resultado
     suma2 <- sum(validar2)
     
     if (suma!=1){
         stop("Estado inválido")
     } else if(suma2!=1){
         
         stop("resultado inválido")
     }
     
     if (resultado =="ataque"){
         i<-11 
     } else if (resultado=="falla"){
         i <- 17
     }else if(resultado=="neumonia"){
         i<-23
     }
     
     separa<-split(outcome, outcome[,7])
     s <- separa[[estado]]
     limite <- dim(s)
     limite<-limite[1]
     limite
     
     if(num=="mejor"){
         num<-1
     }
     if (num<=limite) {
         s[,i]<-suppressWarnings(as.numeric(s[,i]))
         cual <- order(s[,i],s[,2])
         hospitales <- s[cual,2]
         regresar <- hospitales[num]
     } else if (num=="peor"){
         s[,i]<-suppressWarnings(as.numeric(s[,i]))
         fila <-which(s[,i] == max(s[,i],na.rm=T))
         regresar<-s[fila, 2]
     } else {
         stop(return(NA))
     }
     regresar
 }
 
 
 rankingcompleto <- function(resultado, num="mejor"){
     
     outcome<-read.csv("outcome-of-care-measures.csv",colClasses= "character")
     vector1<-vector("numeric")
     vector2<-vector("numeric")
     
     resultados<-c("falla", "ataque","neumonia")
     validar2 <- resultados==resultado
     suma2 <- sum(validar2)
     
     if (suma2!=1) {
         stop("resultado inválido")
     }
     
     if (resultado =="ataque"){
         i<-11 
     } else if (resultado=="falla"){
         i <- 17
     }else if(resultado=="neumonia"){
         i<-23
     }
     
     if(num=="mejor"){
         num<-1
     }
     
     separa <- split(outcome,outcome[,7])
     if( is.numeric(num)==T){
         for (j in 1:54) {
             s <- separa[[j]]
             s[,i]<-suppressWarnings(as.numeric(s[,i]))
             cual <- order(s[,i],s[,2])
             hospitales <- s[cual,2]
             regresar <- hospitales[num]
             vector1 <- c(vector1,regresar)
         }
     } else if(num=="peor") {
         num <- 1
         for (j in 1:54) {
             s <- separa[[j]]
             s[,i]<-suppressWarnings(as.numeric(s[,i]))
             cual <- order(s[,i],s[,2],decreasing = T)
             hospitales <- s[cual,2]
             regresar <- hospitales[num]
             vector1 <- c(vector1,regresar)
         }
     }
     datos <- data.frame(vector1,names(separa))
     names(datos)<-c("hospital","state")
     rownames(datos) <- names(separa)
     datos
     
 }
 
 rankhospital("MI","falla",2)
 