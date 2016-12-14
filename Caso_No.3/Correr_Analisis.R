    getwd()
    library(plyr)
    library(reshape)
    library(reshape2)
    setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.3/UCI HAR Dataset")
    
    #leemos los archivs y unimos
    STs <- read.table("./test/subject_test.txt", col.names=c("Subject"))
    STn <- read.table("./train/subject_train.txt", col.names=c("Subject"))
    
    Fstest <- read.table("./test/X_test.txt")
    Fstrain <- read.table("./train/X_train.txt")
    
    Atest <- read.table("./test/Y_test.txt")
    Atrain<- read.table("./train/Y_train.txt")
    
    Flist<- read.table("features.txt", col.names=c("index", "feature_labels"))
    Alabels<-read.table("activity_labels.txt",sep=" ",col.names=c("activityLabel","Activity"))

    
    
    #Combinamos los datos de Test con los de Train
    subjeall <- rbind(STn, STs)
    featuresdata <- rbind(Fstest, Fstrain)
    activitiesall <- rbind(Atest, Atrain)
    colnames(activitiesall) <- "activityLabel"
    activitiesall<-join(activitiesall,Alabels,by="activityLabel",type="left")
    
    #Extraemos Los que datos que tienen las palabras mean y , para ello creamos
    #el vector que contenga cada uno de los nombres de la antividad, entonces
    #extramos los datos de la columna feature_labels
    featurelabels <- Flist$feature_labels
    
    featuressubset <- grepl('mean\\(\\)|std\\(\\)',featurelabels)
    head(featuressubset,2)

    
    #Colocamos etiquetas
    colnames(featuresdata) <- featurelabels
    head(featuresdata,2)
    
    
    #Creamos el vector que contiene cada uno de los nombres que tienen mean
    #o std, para luego extraerlos.
    Flist <- as.character(featurelabels[featuressubset])
    head(Flist,2)
    
    featuresdata <- featuresdata[,featuressubset]
    head(features_data,2)
    
    #Combinamos cada base para tener una sola y remodelamos
    alldf <- cbind(featuresdata, activitiesall, subjeall)
    head(alldf,2)
    
    #une las data remoldelados mejorados
    tdf <- melt(alldf, id=c("Subject", "Activity"), measure.vars=Flist)
    head(tdf,2)
    
    tdf <- dcast(tdf, Activity + Subject ~ variable, mean)
    head(tdf,2)
    
    tdf <- tdf[order(tdf$Subject, tdf$Activity),]
    head(tdf,2)
    
    rr <- nrow(tdf)
    rownames(tdf) <- 1:rr
    tdf <- tdf[,c(2,1,3:68)]
    head(tdf,2)
    #creamos la nueva base 
    write.table(tdf,file="New_database.txt") 
    
    
