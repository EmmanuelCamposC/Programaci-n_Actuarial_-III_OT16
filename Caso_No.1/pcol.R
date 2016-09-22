function (x, m, quitar.NA = T) 
{
    med <- mean(x[, m], na.rm = quitar.NA)
    med
}
