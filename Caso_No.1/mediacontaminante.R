function (directorio, y, id = 1:332) 
{
    j <- 0
    cta <- 0
    if (y == "sulfate") {
        j = 2
    }
    if (y == "nitrate") {
        j = 3
    }
    for (k in id) {
        if (i < 10) {
            ar <- read.csv(paste("00", k, ".csv", sep = ""))
        }
        if (k >= 10 && k < 100) {
            ar <- read.csv(paste("0", k, ".csv", sep = ""))
        }
        if (k >= 100) {
            ar <- read.csv(paste(k, ".csv", sep = ""))
        }
        archi <- ar
        media <- pcol(archi, j, quitar.NA = T)
        cta <- cta + pcol(archi, j, quitar.NA = T)
    }
    prom = cta/k
    prom
}
