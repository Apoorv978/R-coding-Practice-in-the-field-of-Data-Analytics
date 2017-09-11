titanic.df <- read.csv(paste("Titanic Data.csv",sep = " "))
titanic.df$Survived <- factor(titanic.df$Survived,labels = c("Not Survived","Survived"))
aggregate(Age~Survived,data = titanic.df,FUN = mean)
