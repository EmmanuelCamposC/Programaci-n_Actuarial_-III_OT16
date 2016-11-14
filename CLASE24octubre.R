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
 
    #26 octubre
 install.packages("XML")
 library(XML)
 
 url <- "http://www.w3schools.com/xml/simple.xml"
 data <- xmlTreeParse(url, useInternalNodes = T)
 nodoRaiz <- xmlRoot(data)
 xmlName(nodoRaiz)
 names(nodoRaiz)
 nodoRaiz[[1]]
 nodoRaiz[[1]][[1]]
 xmlApply(nodoRaiz, xmlValue)
 #/nodo nodo nivel superior
 #
 xpathSApply(nodoRaiz, "//name", xmlValue)
 xpathSApply(nodoRaiz, "//price", xmlValue)
 
 install.packages("jsonlite")
 library(jsonlite)
 jsonData <- fromJSON("https://api.github.com/users/EmmanuelCamposC/repos")
 names(jsonData)
 jsonData$name
 #me los separa
 myjson <- toJSON(iris, pretty = T)
 cat(myjson)
 #lo suiguiente hace lo inverso, de tal manera que devuelve el original
 iris2 <- fromJSON(myjson)
 head(iris2)
 
    #data.table
 install.packages("data.table")
 library(data.table)
 DT = data.frame(x =rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
 DT = data.table(x =rnorm(9), y=rep(c("a","b","c"), each=3), z=rnorm(9))
 tables()
 
 DT[2,]
 DT[DT$y=="b",]
 class(DT)
 DT[c(2,3),]
 DT[,c(2,3)]
 
 DT[,list(mean(x),sum(z))]#quieron una lista con ...
 DT[, w:= z^2] #agregar := a w, anexa una nueva columna
 DT2 <- DT
 DT[, y:=2] #imprimir DT y DT2
 
 DT[, m:= {tmp <- (x+z); log2(tmp + 5)}]
 DT[, a:= x>0]
 DT[, b:= mean(x+w), by=a]
 set.seed(123) #la misma semilla
 DT <- data.table(x =sample(letters[1:3],1E5,TRUE))
 DT[, .N, by=x]
 
    #3 Noviembre 2016
 library(swirl)
 install_from_swirl("Getting_and_Cleaning_Data")
 swirl()
 
    # 9 Noviembre 2016
 DT <- data.table(x=rep(letters[1:3], each = 100), y = rnorm(300))
 setkey(DT,x)
 DT['a']
 DT1 <- data.table(x=c('a','a','b','dt1'), y=1:4)
 DT2 <- data.table(x=c('a','b','dt2'), z=5:7)
    setkey(DT1,x);setkey(DT2,x) #es como si intersectara las tablas, ve cuales tiene en comun 
    merge(DT1,DT2) #y asigna el valor de y o z corespondiente a la letra
 
 set.seed(1)
 df_gde <- data.frame(x=rnorm(1E6),y=rnorm(1E6))
 file <- tempfile()
 write.table(df_gde, file = file, row.names = F, col.names = T, sep = "\t", quote = F)
 system.time(fread(file))
 system.time(read.table(file,header = T, sep = "\t"))
        
        #priemero instala mysql
        install.packages("RMySQL")
        library(RMySQL)
        ucscDb <- dbConnect(MySQl(), user = "genome", host="genome-mysql.cse.ucsc.edu")
        result <- dbGetQuery(ucscDb, "show databases;",) ; dbDisconnect(ucscDb)
        result
        
        #10 noviembre    
    hg19 <- dbConnect(MySQL(), user = "genome", db = "hg19",host="genome-mysql.cse.ucsc.edu")
    tablas <- dbListTables(hg19)
    length(tablas)
    tablas[1:3]
        
    dbListFields(hg19, "affyU133Plus2")
    
    affyData <- dbListFields(hg19, "affyU133Plus2")
    head(affyData)
    
    query <- dbSendQuery(hg19, "select * from affyU133Plus2 where misMatches between 1 and 3")
    affyMis <- fetch(query)
        
    dbDisconnect(hg19)
        
 
 
    
    
    
    