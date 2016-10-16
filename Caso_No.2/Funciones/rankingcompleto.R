function (resultado, num = "mejor") 
{
    setwd("C:/Users/Propietario/Documents/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.2")
    outcome <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    val <- unique(outcome[, 7])
    sigla <- vector("character")
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
    val <- val[order(val)]
    tra <- subset(outcome, outcome[, j] != "Not Available" & 
        outcome[, 17] != "Not Available" & outcome[, 23] != "Not Available")
    for (i in 1:length(val)) {
        tra1 <- tra[tra$State == val[i], c(2, j)]
        tra1 <- tra1[order(tra1[, 1], na.last = NA), ]
        if (is.numeric(num)) {
            sigla <- c(sigla, tra1[num, 1])
        }
        else if (num == "mejor") {
            sigla <- c(sigla, tra1[which.min(tra1[, 2]), 1])
        }
        else if (num == "peor") {
            sigla <- c(sigla, tra1[which.max(tra1[, 2]), 1])
        }
    }
    daframe <- data.frame(Hospital = sigla, State = val)
    row.names(daframe) <- val
    daframe
}
