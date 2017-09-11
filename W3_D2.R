store.df <- read.csv(paste("Store24.csv",sep = ""))
View(store.df)

mean(store.df$Profit)

mean(store.df$MTenure) #finding mean of manager tenure 

mean(store.df$CTenure) #finding mean of crew tenure

storeorder <- store.df[order(-store.df$Profit),]
topstore <- storeorder[1:10,1:5]
View(topstore)

storeorder <- store.df[order(store.df$Profit),]
topstore <- storeorder[1:10,1:5]
View(topstore)

plot(store.df$MTenure,store.df$Profit,main = "Profit Vs MTenure",col="red",xlab = "Manager Tenure",ylab = "Profit")
abline(lm(Profit~MTenure,data = store.df),col="blue")

cor.test(store.df$Profit,store.df$MTenure,method = "pearson")
cor.test(store.df$Profit,store.df$CTenure,method = "pearson")

reganal <- lm(Profit~CTenure,data = store.df)
summary(reganal)
