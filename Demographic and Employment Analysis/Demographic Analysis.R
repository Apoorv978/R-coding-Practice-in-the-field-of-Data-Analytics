setwd("C:/Users/aapoo/Desktop/R Programming work/Analytical_Edge/Demographic and Employment Analysis")

CPS.df <- read.csv(paste("CPSData.csv"),sep = ",") # reading CPS Data in r
MetroCode.df <- read.csv(paste("MetroAreaCodes.csv"),sep = ",") # reading metropolitan Data in r
BirthCountry.df <- read.csv(paste("CountryCodes.csv"),sep = ",") # reading country code Data in r

View(CPS.df) #visulization of the CPS dataset
View(BirthCountry.df)
summary(CPS.df) #summary stats of the CPS dataset
str(CPS.df)  #structure of the CPS data set

maxIndus <- table(CPS.df$Industry) #to find which Industry has most number of employees
maxIndus
which.max(maxIndus)

sort(table(CPS.df$Region)) #Sorting interviewees on the basis of their region
sort(table(CPS.df$State))  #Sorting interviewees on the basis of their state

prop.table(table(CPS.df$Citizenship)) #proportion of citizens of America

table(CPS.df$Race[CPS.df$Hispanic==T]) > 250 #hispanic races more than 250

table(CPS.df$Age,is.na(CPS.df$Married)) #Relation between marriage status and age

table(CPS.df$State,is.na(CPS.df$MetroAreaCode)) #NA Analysis of state vs metropolitian 

table(CPS.df$Region,is.na(CPS.df$MetroAreaCode)) #NA Analysis of state vs metropolitian 
prop.table(table(CPS.df$Region,is.na(CPS.df$MetroAreaCode)),1)

state.metro <-prop.table(table(CPS.df$State,is.na(CPS.df$MetroAreaCode)),1)
state.metro[,which.max(TRUE)]  #state vs metropolitian analysis

str(MetroCode.df)
str(BirthCountry.df)

CPS.df <- merge(CPS.df,MetroCode.df,by.x = "MetroAreaCode",by.y = "Code",all.x = T) #merging cps dataset and metropolitian dataset
View(CPS.df)
table(is.na(CPS.df$MetroArea))
