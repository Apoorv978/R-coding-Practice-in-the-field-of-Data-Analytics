deandata.df <- read.csv(paste("Deans Dilemma.csv",sep = " "))
View(deandata.df)
placed.df <- deandata.df[deandata.df$Placement_B!=0,,drop=TRUE]
View(placed.df)
aggregate(Salary~Gender,data=placed.df,FUN = mean)
aggregate(deandata.df$Salary,by(deandata.df[deandata.df$Gender=="M"],deandata.df[deandata.df$Placement=="Placed"]),FUN = mean)
aggregate(Salary~Gender,data = deandata.df,FUN = mean)
mytable <- aggregate(Salary~Gender,data = deandata.df,FUN = mean)
t.test(deandata.df$Salary~deandata.df$Gender)
t.test(deandata.df$Salary[deandata.df$Gender=="F"],deandata.df$Salary[deandata.df$Gender=="M"])
placed_male.df <- placed.df[placed.df$Gender=="M", ,drop=TRUE]
View(placed_male.df)
mean(placed_male.df$Salary)
