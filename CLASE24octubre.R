  #Crear una carpeta para guardar los datos descargados
 if (!file.exists("data")) dir.create("data")
 
  #Desgargar datos de internet
 url <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
 download.file(url,destfile = "./data/camaras.csv")
 list.files("./data")
 
 fechaDescarga <- date()
 
 #caragar los datos desde mi computadora
 dataCam <- read.table("./data/camaras.csv", sep = ",", header = T)
 dataCam <- read.csv("./data/camaras.csv")
 #na.strings establece el caracter que coresponde a valores faltantes
 #quote le dice cuales son los comentarios 
 head(dataCam)
 url <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD&bom=true"
 download.file(url, destfile = "./data/camaras.xlsx")
 fechaDescarga1 <- date() 
 install.packages("rJava")
 install.packages("xlsx")
 library("rJava")
 library("xlsx")
 