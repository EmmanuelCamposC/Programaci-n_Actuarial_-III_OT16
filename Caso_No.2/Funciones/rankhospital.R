function (estado, resultado, num = "mejor") 
{
    setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    val <- unique(outcome[, 7])
    tra <- subset(outcome, outcome[, 11] != "Not Available" & 
        outcome[, 17] != "Not Available" & outcome[, 23] != "Not Available")
    if ((sum(val == estado) != 1)) {
        stop("estado invalido")
    }
    if (resultado == "ataque") {
        j <- 11
    }
    else if (resultado == "falla") {
        j <- 17
    }
    else if (resultado == "neumonia") {
        j <- 23
    }
    else {
        stop("resultado invalido")
    }
    tra1 <- tra[tra$State == estado, c(2, j)]
    tra1 <- tra1[order(tra1[, 1]), ]
    tra2 <- which.min(tra1[, 2])
    if (is.numeric(num)) {
        num <- num - 1
        if (num > nrow(tra1)) {
            stop(return(NA))
        }
        for (i in 1:num) {
            tra1 <- tra1[-tra2, ]
            tra2 <- which.min(tra1[, 2])
        }
    }
    else if (num == "mejor") {
        tra2 <- which.min(tra1[, 2])
    }
    else if (num == "peor") {
        tra2 <- which.max(tra1[, 2])
    }
    tra1[tra2, 1]
}
