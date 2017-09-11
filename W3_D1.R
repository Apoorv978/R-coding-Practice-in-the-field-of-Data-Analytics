attach(mtcars)
View(mtcars)
newdata <- mtcars[order(mpg),] # sort by mpg (ascending)
View(newdata)
newdata[1:5,] # see the first 5 rows
newdata <- mtcars[order(-wt),] # sort by mpg (descending)
View(newdata)
detach(mtcars)

store.df <- read.csv(paste("Store24.csv",sep = ""))
View(store.df)
attach(store.df)
top10 <- store.df[order(-Profit),]
View(top10)
print(top10$store)
help("print.by")
print(top10$Sales)

top10$Sales[1:10]
plot(store.df$MTenure,store.df$Profit,col="red",
     main = "Scatterplot of Profit vs MTenure",
     xlab = "MTenure",ylab = "Profit")
abline(lm(Profit~MTenure))
