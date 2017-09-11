#
#
#

Airlines.df <- read.csv(paste("SixAirlinesData2.csv",sep = "")) #reading in R
View(Airlines.df) #viewing dataframe in table form
summary(Airlines.df) #summary of the dataframe



#Informative Graph Plotting

#box-plots of significant varibles:-

# Flight Duration
boxplot(Airlines.df$FlightDuration,horizontal = TRUE,type="count",main="Flight Duration",xlab="Time(in Hrs)")

#Number of Seats in Economy Class
boxplot(Airlines.df$SeatsEconomy,horizontal = TRUE,type="count",main="Seats in Economy",xlab="No. of seats")

#Number of Seats in Premium Class
boxplot(Airlines.df$SeatsPremium,horizontal = TRUE,type="count",main="Seats in Premium",xlab="No. of seats")

#Pitch Difference
boxplot(Airlines.df$PitchDifference,horizontal = TRUE,type="count",main="Pitch difference",xlab="difference")

# Note: from above box plots, we can say that as the no. of seats are less in a premium than in economy with a mean of duration of almost 8 hrs, it can be infered that rate differnce will be there as the duration increases

#Scatter-plots of significant pairs

attach(Airlines.df)

# PriceDifference VS FlightDuration
plot(x=FlightDuration,y=PriceDifference,main = "PriceDifference VS FlightDuration",
     xlab = "Time(in Hrs)", ylab = "Price Difference(in USD)",col="blue")
#Inference: In domestic flights, price difference of the classes is less significant than that in an international flight.

#PriceDifference VS PitchDifference
plot(x=jitter(PitchDifference),y=jitter(PriceDifference),main = "PriceDifference VS PitchDifference",
     xlab = "PitchDifference(in Inches)", ylab = "Price Difference(in USD)",col="pink")
#Observation: Pitch Difference around 7 inches is more prefferable hence, cost difference is more.

#PrecentagePremium Vs PricePremium
plot(x=jitter(PercentPremiumSeats),y=jitter(PricePremium),main = "PercentagePremium VS PricePremium",
     xlab = "premium(in percentage)", ylab = "Price(in USD)",col="Magenta")
# Appropriate amount of premium seats are more costly.

#Correlation Plots

library(corrplot)
library(gplots)

#Mixed Correlation Plot 
corrplot.mixed(corr = cor(Airlines.df[,c(3,8:9,14,18)],use="complete.obs"),
               upper="ellipse",tl.pos = "lt",col=colorpanel(50,"red","gray60","blue4"))

# Pearson's correlation test 

#Correlation test b/w Pitch of economy seat and its price
cor.test(Airlines.df$PitchEconomy,Airlines.df$PriceEconomy) 
#cor test shows stastically significant correation(positive correlation) cor=0.37

#Correlation test b/w Pitch of premium seat and its price
cor.test(Airlines.df$PitchPremium,Airlines.df$PricePremium)
#cor test shows stastical insignificant correlation as p-value > 0.05 

#Correlation test b/w difference in pitch of both classes and price difference
PriceDifference <- Airlines.df$PricePremium-Airlines.df$PriceEconomy 
summary(PriceDifference)
cor.test(PriceDifference,Airlines.df$PitchDifference) 
#cor test shows stastical significant correlation with p-value < 0.05 and cor=0.13(positive correlation)

#Correlation test b/w Flight duration and Price Difference
cor.test(Airlines.df$FlightDuration,PriceDifference)
# Stastical significance with cor=0.47(positive correlation) somewhat strong correlation

#Correlation test b/w number of premium seats and Price difference
cor.test(Airlines.df$SeatsPremium,PriceDifference)
#Stastical significance with cor=0.28(positive correlation) and p-value < 0.05

#Correlation test b/w pitch of premium seats and relative price
cor.test(Airlines.df$PitchEconomy,PriceDifference)
# Stastical significance with cor=-0.125(negative correlation) and p-value<0.05

#Hypothesis 1 : Difference in price of Economy and Premium classes is because of more leg space in the latter class.
#Hypothesis 2 : Difference in price of Economy and Premium classes is because of the flight duration.
#Hypothesis 3 : When the pitch of economy class seats will increase, rate of ticket is higher.

#t-tests 

# Flight Duration Vs Relative Price
t.test(FlightDuration,PriceRelative)
# test shows that there is a significant correlation p-value<0.05
#Hypothesis 2 Stays correct

#Pitch Economy Vs Relative Price
t.test(PitchEconomy,PriceRelative)
#test shows significant correlation p-value<0.05
#Hypothesis 1 Stays correct

#Pitch Premium Vs Relative Price
t.test(PitchPremium,PriceRelative)
#test shows significant correlation p-value<0.05
#Hypothesis 1 Stays correct

#Percentage Premium Seats Vs Relative Price
t.test(PercentPremiumSeats,PriceRelative)
#test shows significant correlation p-vlaue<0.05

#Width of Premium seats Vs Relative Price
t.test(WidthPremium,PriceRelative)
#test shows significant correlation p-value<0.05

#Regression analysis

attach(Airlines.df)

#Indepedent Variables:- Duration, Pitch of Economy class, Pitch of Premium class, Percentage Premium Seats.
#Dependent Variable : Relative Price of Economy and Premium Classes

AirlineModel <- lm(PriceRelative~FlightDuration+PitchEconomy+PitchPremium+PercentPremiumSeats)
summary(AirlineModel)
#Observation: increasing the pitch of premium seats does not significantly contribute to price differnce.
# Dropping the Pitch Premium Variable

#Fitting the linear Model
AirlineModel <- lm(PriceRelative~FlightDuration+PitchEconomy+PercentPremiumSeats)
summary(AirlineModel)
AirlineModel$coefficients
#summary stats shows a0=11.964 , a1=0.037 , a2=-0.366 , a3=-0.022
# Approx linear model will be: y= 0.037*(FlightDuration)-0.366*(PitchEconomy)-0.022*(PrecentPremiumSeats)+11.969

#Checking the usability of the created Model
Airlines.df$PriceRelative
fitted(AirlineModel)
mean(AirlineModel$residuals)
#This shows that the model regressed for the following dependent Variable is significantly correct.