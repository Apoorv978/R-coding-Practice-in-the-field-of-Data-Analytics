#loading state data set
state.df <- as.data.frame(state.x77) #converting dataset into dataframe
View(state.df)

names(state.df)[names(state.df)=="Life Exp"] <- "Life.Exp"  #synatax for renaming any variable name in a data frame
names(state.df)[names(state.df)=="HS Grad"] <- "HS.Grad"

attach(state.df)

state_modelfit <- lm(Life.Exp~Population,data=state.df) #linear regression 
summary(state_modelfit) #check for p-value

state_modelfit <- lm(Life.Exp~Income,data=state.df) #linear regression 
summary(state_modelfit)

state_modelfit <- lm(Life.Exp~Illiteracy,data=state.df) #linear regression 
summary(state_modelfit)
state.df$Life.Exp
fitted(state_modelfit)

state_modelfit <- lm(Life.Exp~Murder,data=state.df) #linear regression 
summary(state_modelfit)
state.df$Life.Exp
fitted(state_modelfit)

state_modelfit <- lm(Life.Exp~Murder+HS.Grad,data=state.df) #linear regression 
summary(state_modelfit)
state.df$Life.Exp
fitted(state_modelfit)
