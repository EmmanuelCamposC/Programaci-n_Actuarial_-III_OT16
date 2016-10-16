setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
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
     tra1 <- tra1[order(tra1[,1]),]
     tra[which.min(tra[,2]),1]
 }
 
 
 source(mejor)
 mejor("TX","ataque")
 mejor("TX","falla")
 mejor("MD","neumonia")
 
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
     tra1 <- tra1[order(tra1[,1]),]
     tra2 <- which.min(tra1[,2])
     if (is.numeric(num)){
         num <- num - 1
         if ( num > nrow(tra1)){
             stop(return(NA))
         }
         for (i in 1:num) {
             tra1 <- tra1[-tra2,]
             tra2 <- which.min(tra1[,2])
         }   
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
     # Lectura de datos
     setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
     # Lectura de datos
     outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
     val  <- unique(outcome[,7])
     tra <- subset(outcome, outcome[,11] != "Not Available" & outcome[,17] != "Not Available" & outcome[,23] != "Not Available")
     # Revisión de la validez de estado y resultado
     if (resultado == "ataque") { 
         j <- 11
     } else if (resultado == "falla"){
         j <- 17
     } else if (resultado == "neumonia"){
         j <- 23
     } else {
         stop("resultado invalido") 
     }
     # Para cada estado, encuentra el hospital con la posición dada.
     # Regresa un data frame con el nombre del hospital y la abreviatura
     # del nombre del estado al que pertenece.
     for (i in 1:length(val)) {
         tra1 <- tra[tra$State == val[i], c(2,j)]
         tra1 <- tra1[order(tra1[,1]),]
         if ( num == "mejor") {
             sigla <- c(sigla,tra[which.min(tra1[,2])]) 
         } else if ( num == "peor"){
             sigla <- c(sigla,tra[which.max(tra1[,2])])
         }
         
     }
     daframe <- data.frame(Hospital=id, State=val)
     
     daframe
     
 } 
 
 ii <- order(x <- c(1,1,3:1,1:4,3), y <- c(9,9:1), z <- c(2,1:9))
## 6  5  2  1  7  4 10  8  3  9
rbind(x, y, z)[,ii] # shows the reordering (ties via 2nd & 3rd arg)

j <- 11
outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
val  <- unique(outcome[,7])
tra <- subset(outcome, outcome[,11] != "Not Available" & outcome[,17] != "Not Available" & outcome[,23] != "Not Available")
val[54]
class(val[54])
sigla <- vector("character")
class(val)
val
for (i in 1:length(val)) {
    tra1 <- tra[tra$State == val[i], c(2,j)]
    tra1 <- tra1[order(tra1[,1]),]
    sigla <- c(sigla,tra[which.min(tra1[,2])])
}
tra1
tra1 <- tra[tra$State == estado , c( 2, j)]
tra1[which.min(tra1[,2]),1]
class(tra1[which.min(tra1[,2]),1]) 
sigla <- vector("character")
sigla <- c(sigla,tra1[which.min(tra1[,2]),1])
 
 estado <- "TX"
 j <- 11
 outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
 tra <- subset(outcome, outcome[,11] != "Not Available" & outcome[,17] != "Not Available" & outcome[,23] != "Not Available")
 tra1 <- tra[tra$State == estado , c( 2, j)]
 tra1 <- tra1[order(tra1[,1]),]
 tra1[,1]
 dim(tra1)
 length(tra1)
 
 tra2 <- which.min(tra1[,2])
 tra1 <- tra1[-tra2,]
 tra2 <- which.min(tra1[,2])
 
 dim(tra3)
 dim(tra2)
 dim(tra1)
 dim(tra)
 
 
 a=data.frame(M1=c(1,0,0,0,0),M2=c(0,1,0,0,0),M3=c(0,0,0,1,0),M4=c(0,0,0,0,1),M5=c(0,0,0,0,1),row.names=c("A","B","C","D","E"))
 b=a[-1,]
 c=a[-2,]
 d=a[-3,]
 b
 c
 
 tra <- subset(outcome, outcome[,11] != "Not Available" & outcome[,17] != "Not Available" & outcome[,23] != "Not Available")
 resultado <- "TX"
 j <- 11
 tra <- tra[tra$State == resultado ,c(2,j)]
 tra[which.min(tra[,2]),1]
 
 baja <- min(tra[,2])
 tra <- subset(tra,tra$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == baja,1)
 tra <- tra[tra$Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack == baja,1]
 tra[which.min(tra[,2]),1]
 which.min(tra[,2])
 
