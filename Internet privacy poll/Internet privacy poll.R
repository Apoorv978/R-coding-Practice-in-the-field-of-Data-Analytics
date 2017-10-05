#Analysis of Internet Privacy poll
setwd("C:/Users/aapoo/Desktop/R Programming work/Analytical_Edge/Internet privacy poll")

Poll.df <- read.csv(paste("AnonymityPoll.csv"),sep = ",")
attach(Poll.df)
str(Poll.df)
View(Poll.df)
table(Poll.df$Smartphone)
table(State,Region)
table(Internet.Use,Smartphone)
table(Internet.Use)
limited <- subset(Poll.df,Internet.Use==1 | Smartphone==1)
str(limited)
colnames(limited)[apply(is.na(limited),2,any)]
mean(Poll.df$Info.On.Internet,na.rm = T)
#continue from problem 3.3
