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
        ucscDb <- dbConnect(MySQL(), user="genome",
                            host="genome-mysql.cse.ucsc.edu")
        result <-dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);
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
        
 
 
    library(RMySQL)
    ucscDb <- dbConnect(MySQL(), user="genome",
                        host="genome-mysql.cse.ucsc.edu")
    result <-dbGetQuery(ucscDb,"show databases;"); dbDisconnect(ucscDb);
    result
    
    # 16 noviembre 2016
    source("http://bioconductor.org/biocLite.R")
    biocLite("rhdf5")
    library(rhdf5)
    created = h5createFile("example.h5")
    created
    
    created = h5createGroup()
    
    A = matrix(1:10, nr = 5, nc =2)
    h5write(A, "example.h5", "foo/A")
    B = array(seq(0.1,0.2, by = 0.1), dim = c(5,2,2))
    attr(B,"scale")
    
    
    df = data.frame(1L:5L,seq(0,1,length.out=5),
                    c("ab", "cde", "fghi", "a", "s"), stringsAsFactors=FALSE)
    h5write(df, "example.h5", "df")
    h5ls("example.h5")
    
    readA = h5read("example.h5", "foo/A")
    readdf = h5read("examlple.h5","df")
    readA
    
    
    h5write(c(12,13,14), "example.h5", "foo/A", index = list(1:3,1))
    
    
        
    set.seed(13435)
    x <- data.frame("var1" = sample(1:5), "var2" = sample(6:10), "var3" = sample(11:15))
    x <- x[sample(1:5),]
    x$var2[c(1,3)] = NA
    x[,1]
    x[,"var1"]
    x[1:2, "var2"]
    x[x$var1<= 3 & x$var3>11,]
    x[x$var1<= 3 | x$var3>11,]
    # && || asume que son vectores de tamaño uno
    
        #17 noviembre 2016
    which(x$var2>8)
    x[which(x$var2>8),]
    
    sort(x$var1) #ordena por valor
    sort(x$var1, decreasing =T) 
    
    sort(x$var2)
    sort(x$var2, decreasing =T) 
    
    sort(x$var2, na.last = T)
    sort(x$var2, decreasing =T, na.last = T) 
    
    order(x$var1) #ordena por posición 
    x[order(x$var1),]
    
    order(x$var2, na.last = T, decreasing = T)
    x[order(x$var2, na.last = T, decreasing = F),]
    
    install.packages("plyr")
    library(plyr)
    arrange(x,var1)
    arrange(x,desc(var1))
    
    #asignarle una culomna
    x$var4 <- rnorm(5)
    # ó 
    cbind(x, "var5" = rnorm(5))
    
    
        #24 nov 2016
    if(!dir.exists("data")){ dir.create("data")}
    url <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
    
    download.file(url, "./data/Restaurants.csv")
    data <- read.csv("./data/Restaurants.csv")
    
    head(data, n=3)
    tail(data,n=3)
    summary(data)#un resumen matematico estadista 
    str(data) #resumen computacional, tipo de datos y como estan almacenados
    
     #30 noviembre, un día después del martes negro
    quantile(data$councilDistric, na.rm = T)
    quantile(data$councilDistric, probs = c(0.50,0.75, 0.9))
     
    #hacer una tabla
    table(data$zipCode, useNA = "ifany")
    table(data$councilDistric,data$zipCode) #segmentar para saber cuantos estan en cada distrito
    # tablas contingentes, para saber si dos variables son id.
    
    #valores faltantes 
    sum(is.na(data$councilDistric))#is na te da T o F, si en la posicion tengo valor faltante (T)
    any(is.na(data$councilDistric))# any <- algún, evalua un o en los elemtos, si todos son False ent. false
    all(!is.na(data$councilDistric))# all <- como un y, para que sea verdadero todos deben ser verdaderos
    all(data$zipCode > 0) #reviso cada uno de los numeros, si encuentra un negativo da F
    colSums(is.na(data)) # simplificacion de la funcion apply, si dan ceros es porque no hay valores faltantes.
    all(colSums(is.na(data))==0)# si hay valores faltantes,donde estan y cuantos son
    
    #valores con caracteristicas esperciales
    table(data$zipCode %in% c("21212")) # como si hicera un subconjunto del dela izquierda
    table(data$zipCode %in% c("21212","21213")) 
    data[data$zipCode %in% c("21212","21213"),]
    nrow(data[data$zipCode %in% c("21212","21213"),])#conmprobar que hay 59
    
    #tablas cruzadas
    data(UCBAdmissions)
    DF = as.data.frame(UCBAdmissions)
    summary(DF)
    xt <- xtabs(Freq ~ Gender + Admit,data = DF)
    xt
    
    #tablas planas
    library(war)
    warpbreaks$replicate <- rep(1:9, len = 54)
    xt = xtabs(breaks ~.,data = warpbreaks)
    xt
    #para organizarlas ocupamos ftable(xt)
    ftable(xt)
    
    #tamaño de una tabla
    fakeData = rnorm(1e5)
    object.size(fakeData)#es peso del archivo y se le agrega el metadato, los 40
    print(object.size(fakeData), units = "Mb")
    #un valor para los datos faltantes
    #acotar variables cuantitativas
    
    #crear secuencias
    s1 <- seq(1,10, by=2); s1
    s2 <- seq(1,10, by=3); s2
    x <- c(1,3,8,25,100); seq(along= x)
    
    #subconjunto de variables
    data$cerca <- data$neighborhood %in% c("Roland Park","Homeland")# creo una nueva varible "cerca", si los vecindatrios
    #ronal... estan cerca entonces esta cerca
    table(data$cerca)
    head(data)#fijarse en los false
    
    #variables binarias
    data$zipError <- ifelse(data$zipCode < 0, TRUE,FALSE)
    data[data$zipError,]
    table(data$zipError, data$zipCode < 0)
    
    #variables categóricas 
    data$zipGrupo <- cut(data$zipCode, breaks = quantile(data$zipCode))#cut toma 
    #el maximo y minimo y lo divide entre el quantile
    table(data$zipGrupo)
    table(data$zipGrupo,data$zipCode)#te dice en que intervalo estan cada codigo 
    #postal, en que clase estoy y cual es el codigo postal
    
    #corte simplificado 
    install.packages("Hmisc")
    library(Hmisc)
    data$zipGrupo <- cut2(data$zipCode, g= 4)
    table(data$zipGrupo)# no son tan cual como una tabla de frecuencias
    #crea factores
    
    #crear factores de variables, agregamos una columna de factores
    data$zcf <- factor(data$zipCode)
    data$zcf[1:10]
    class(data$zcf)
    data$zipCode[1:10]
    class(data$zipCode)
    
    #01 diciembre mes del mame 2016
    #Niveles de los factores 
    set.seed(1)
    yesno <- sample(c("si","no"), size=10,replace = TRUE)
    yesnofac <- factor(yesno, levels = c("si","no"))
    yesno
    yesnofac #cuando habla de levels, esa info. la maneja como factores
    relevel(yesnofac, ref ="no")
    as.numeric(yesnofac)
    as.numeric(relevel(yesnofac, ref = "no"))
    
    #función mutate
    library(Hmisc);library(plyr)
    data2 <- mutate(data, zipGrupo=cut2(zipCode, g = 4))
    table(data2$zipGrupo)
    ?cut2
    
    #transformaciones comunes 
    abs(x) 
    sqrt(x) #raíz cuadrada
    ceiling(x)
    signif(x)#redondea desde el primer digito hacia la derecha 
    round(x)#redondea desde decimales
    
    
    
    
    
    
    
    