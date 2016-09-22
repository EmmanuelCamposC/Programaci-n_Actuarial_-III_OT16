function (directorio, id = 1:332) 
{
    setwd(directorio)
    llenado <- vector("numeric")
    for (k in id) {
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
        llenado <- c(llenado, llenar)
    }
    daframe <- data.frame(id = id, nobs = llenado)
    daframe
}
