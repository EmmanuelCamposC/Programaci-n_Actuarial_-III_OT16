function (estado, resultado) 
{
    setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    val <- unique(outcome[, 7])
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
    tra <- subset(outcome, outcome[, 11] != "Not Available" & 
        outcome[, 17] != "Not Available" & outcome[, 23] != "Not Available")
    tra <- tra[tra$State == estado, c(2, j)]
    tra1 <- tra1[order(tra1[, 1]), ]
    tra[which.min(tra[, 2]), 1]
}
