function (directorio, horizonte = 0) 
{
    setwd(directorio)
    x <- vector("numeric")
    y <- vector("numeric")
    llenado <- vector("numeric")
    for (k in 1:332) {
        if (k < 10) {
            archivo <- read.csv(paste("00", k, ".csv", sep = ""))
        }
        if (k >= 10 && k < 100) {
            archivo <- read.csv(paste("0", k, ".csv", sep = ""))
        }
        if (k >= 100) {
            archivo <- read.csv(paste(k, ".csv", sep = ""))
        }
        comp <- complete.cases(archivo)
        full <- archivo[comp, 2:3]
        llenar <- nrow(full)
        if (llenar >= horizonte) {
            x <- cor(full[, 1], full[, 2])
            correla <- as.vector(x)
            y <- c(y, correla)
        }
    }
    y
}
