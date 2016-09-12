co <- 0
gu <- 0
d <- vector("numeric")
fu <- 0
for (i in 1:100) {
  
  z <- 5
    while (z>= 3 &&  z<= 10) {
    print(z)
    fu <- fu+1
    d <- c(d,z)
    moneda <- rbinom(1,1,0.5)  
    if (moneda==1){
      z <- z + 1
    } else { 
      z <- z - 1
    }
    
  }
  if (d[[fu]]==3){co <- co+1} else {gu <- gu+1}
  #if (d[fu]==3){gu <- (gu+1) }
}
#d
#d[[fu]]
co 
gu