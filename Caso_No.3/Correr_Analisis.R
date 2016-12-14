    getwd()
    library(plyr)
    library(reshape)
    library(reshape2)
    setwd("~/GitHub/Programaci-n_Actuarial_-III_OT16/Caso_No.3/UCI HAR Dataset")
    
    #leemos los archivs y unimos
    subject_test <- read.table("./test/subject_test.txt", col.names=c("Subject"))
    subject_train <- read.table("./train/subject_train.txt", col.names=c("Subject"))
    
    features_test <- read.table("./test/X_test.txt")
    features_train <- read.table("./train/X_train.txt")
    
    features_test <- read.table("./test/X_test.txt")
    features_train <- read.table("./train/X_train.txt")
    
    activities_test <- read.table("./test/Y_test.txt")
    activities_train <- read.table("./train/Y_train.txt")
    
    feature_list <- read.table("features.txt", col.names=c("index", "feature_labels"))
    activity_labels<-read.table("activity_labels.txt",sep=" ",col.names=c("activityLabel","Activity"))
    
    #Combinamos los datos de Test con los de Train
    subject_all <- rbind(subject_train, subject_test)
    
    features_data <- rbind(features_test, features_train)
    
    activities_all <- rbind(activities_test, activities_train)
    colnames(activities_all) <- "activityLabel"
    activities_all<-join(activities_all,activity_labels,by="activityLabel",type="left")
    
    #Extraemos Los que datos que tienen las palabras mean y , para ello creamos
    #el vector que contenga cada uno de los nombres de la antividad, entonces
    #extramos los datos de la columna feature_labels
    feature_labels <- feature_list$feature_labels
    
    features_subset <- grepl('mean\\(\\)|std\\(\\)',feature_labels)
    head(features_subset,2)

    
    #Colocamos etiquetas
    colnames(features_data) <- feature_labels
    head(features_data,2)
    
    
    #Creamos el vector que contiene cada uno de los nombres que tienen mean
    #o std, para luego extraerlos.
    feature_list <- as.character(feature_labels[features_subset])
    head(feature_list,2)
    
    features_data <- features_data[,features_subset]
    head(features_data,2)
    
    #Combinamos cada base para tener una sola y remodelamos
    all_df <- cbind(features_data, activities_all, subject_all)
    head(all_df,2)
    
    #une las data remoldelados mejorados
    tdf <- melt(all_df, id=c("Subject", "Activity"), measure.vars=feature_list)
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
    
    
