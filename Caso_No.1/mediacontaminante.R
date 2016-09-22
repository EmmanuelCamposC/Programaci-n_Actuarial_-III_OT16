function (directorio, y, id = 1:332) 
{
    j <- 0
    b <- 0
    cta <- 0
    if (y == "sulfate") {
        j = 1
    }
    if (y == "nitrate") {
        j = 2
    }
    for (k in id) {
        if (k < 10) {
            ar <- read.csv(paste("00", k, ".csv", sep = ""))
        }
        if (k >= 10 && k < 100) {
            ar <- read.csv(paste("0", k, ".csv", sep = ""))
        }
        if (k >= 100) {
            ar <- read.csv(paste(k, ".csv", sep = ""))
        }
        comp <- complete.cases(ar)
        full <- ar[comp, 2:3]
        cta <- cta + nrow(full)
        b <- b + sum(full[, j])
    }
    prom <- b/cta
    prom
}
