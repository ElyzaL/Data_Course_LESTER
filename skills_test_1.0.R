#Part I: Read the cleaned_covid_data.csv file into an R data frame.
library(tidyverse)
df <- read.csv("~/Desktop/Data_Course_LESTER/cleaned_covid_data.csv")
head(df)
#Part II:Subset the data set to just show states that begin with "A" and save this as an object called A-states
A_states <- df[grepl("A", df$Province_State),]
#Part III: Create a plot _of that subset_ showing Active cases over time, with a separate facet for each state.
library(ggplot2)
ggplot(A_states, aes(x= Last_Update, y= Active)) +
  geom_point()+
  geom_smooth(method = "loess", se= FALSE) +
  facet_wrap(~Province_State, scales = "free")
# Part IV:Find the "peak" of Case_Fatality_Ratio for each state and save this as a new data frame object called state_max_fatality_rate.
require(data.table)
dt <- data.table(df)
state_max_fatality_rate<- dt[, max(Case_Fatality_Ratio), by = Province_State]
state_max_fatality_rate
#Part V:Use that new data frame from task IV to create another plot.
as.factor(state_max_fatality_rate)
rate_factor <- as.factor(state_max_fatality_rate)
class(rate_factor)
ggplot(state_max_fatality_rate, aes(x=Region, y= Maximum_Fatality_Ratio)) +
  geom_bar()
#Part VI:plot cumulative deaths for the entire US over time
df %>% 
  group_by(Last_Update) %>% 
  summarise()
ggplot(df, aes(x=Deaths , y= Last_Update))

