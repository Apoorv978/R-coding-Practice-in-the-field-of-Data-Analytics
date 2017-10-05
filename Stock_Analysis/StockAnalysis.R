plot(CocaCola$Date[301:432], CocaCola$StockPrice[301:432], type="l", col="red", ylim=c(0,210),main = "Stock w.r.t Time", xlab = "Date",ylab = "Stock Price")
lines(ProcterGamble$Date[301:432],ProcterGamble$StockPrice[301:432],col="blue")
lines(IBM$Date[301:432],IBM$StockPrice[301:432],col="orange")
lines(Boeing$Date[301:432],Boeing$StockPrice[301:432],col="purple")
lines(GE$Date[301:432],GE$StockPrice[301:432],col="green")
legend(as.Date("2001-05-01"),200,legend = c("CocaCola","Procter and gamble","Genral Electrics","Boeing","IBM"),col=c("red","blue","green","purple","orange"),lty=1,cex=0.8)
abline(v=as.Date("2004-01-01"),lwd=1)
abline(v=as.Date("2005-01-01"),lwd=1)
GE.stockSort<-tapply(GE$StockPrice,months(GE$Date),mean)
coke.stockSort<-tapply(CocaCola$StockPrice,months(CocaCola$Date),mean)
PG.StockSort <- tapply(ProcterGamble$StockPrice,months(ProcterGamble$Date),mean)
Boeing.StockSort <- tapply(Boeing$StockPrice,months(Boeing$Date),mean)
IBM.stockSort <- tapply(IBM$StockPrice,months(IBM$Date),mean)
GE.stockSort["January" & "December"]
coke.stockSort
PG.StockSort
IBM.stockSort
Boeing.StockSort
x <- which.max(coke.stockSort)==which.max(GE.stockSort)
