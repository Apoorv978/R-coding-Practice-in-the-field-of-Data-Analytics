deandata.df <- read.csv(paste("Deans Dilemma.csv",sep=" "))
View(deandata.df)
library(psych)
library(car)
summary(deandata.df)
describe(deandata.df)
describe(deandata.df[,(3:7)])
describe(deandata.df$Salary) #for median salary of all students 3(a)
placement <- table(deandata.df$Placement)
prop.table(placement)*100    #for % placed 3(b)
summary(placement)
median(deandata.df$Salary)
placed.df <- with(deandata.df$Placement_B==1)
mean(deandata.df$Salary)
placedsal <- xtabs(~ Salary+Placement, data = deandata.df)
median(placedsal)
median(deandata.df$Salary)
library("gmodels")
CrossTable(deandata.df$Salary, deandata.df$Placement)
mytable <- xtabs(~ deandata.df$Gender+deandata.df$Placement)
mytable
deandata.df$Salary
describe(deandata.df$Salary)
mytable <- xtabs(~ Salary+Gender,data=deandata.df)
mytable
mean(mytable,2)
hist(deandata.df$Placement_B,deandata.df$Percent_MBA)
boxplot(deandata.df$Salary ~ deandata.df$Gender.B, horizontal=TRUE,yaxt="n",
        ylab="Gender", xlab="Salary", las=1,
        main="Salary distribution amongst male and female students",
        col=c("red","blue","green","yellow"),
        axis(side=2, at=c(1,2), labels=c("Male", "Female"))
)
placedET <- deandata.df[deandata.df$Placement_B!=0&&deandata.df$S.TEST!=0,,drop=TRUE]
View(placedET)
ls()
