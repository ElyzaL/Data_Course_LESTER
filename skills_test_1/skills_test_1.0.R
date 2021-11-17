#Part I: Read the cleaned_covid_data.csv file into an R data frame.
library(tidyverse)
df <- read.csv("~/Desktop/Data_Course_LESTER/cleaned_covid_data.csv")
head(df)

#answer
#df <- read.csv(~'to your file path')



#Part II:Subset the data set to just show states that begin with "A" and save this as an object called A-states
A_states <- df[grepl("A", df$Province_State),]

#answer
#df %>% glimpse
#A-states <- df[grepl("A", df$Province_State),]



#Part III: Create a plot _of that subset_ showing Active cases over time, with a separate facet for each state.
library(ggplot2)
ggplot(A_states, aes(x= Last_Update, y= Active)) +
  geom_point()+
  geom_smooth(method = "loess", se= FALSE) +
  facet_wrap(~Province_State, scales = "free")

#A-states %>% 
#   ggplot(aes(x=last_update, y=active)) +
#     geom_point+
#     geom_smooth(se= FALSE) +
#     facet_wrap(~Province_State, Scales = "free")



# Part IV:Find the "peak" of Case_Fatality_Ratio for each state and save this as a new data frame object called state_max_fatality_rate.
require(data.table)
dt <- data.table(df)
state_max_fatality_rate<- dt[, max(Case_Fatality_Ratio), by = Province_State]
state_max_fatality_rate

#answer
#df %>% 
#  group_by(Province_state) %>% 
#  summarize(Max_Fatality = max(Case_Facility_Ratio, na.rm =TRUE)) %>% 
#  arrange(desc(Max_Fatality))



#Part V:Use that new data frame from task IV to create another plot.
as.factor(state_max_fatality_rate)
rate_factor <- as.factor(state_max_fatality_rate)
class(rate_factor)
ggplot(state_max_fatality_rate, aes(x=Region, y= Maximum_Fatality_Ratio)) +
  geom_bar()

#Answer
#state_max_fatality_rate %>% 
#   mutate(Province_State = factor(Province_State, levels = state_max_fatality_rate$Province_State))
#or
#state_max_fatality_rate %>% 
#   ggplot(aes(x= reorder(Province_State, -Max_Fatality), y= Max_Fatality)) +
#    geom_col() +
#    theme(axis.text.x = element_text(angle = 90, h just= 1))



#Part VI:plot cumulative deaths for the entire US over time
df %>% 
  group_by(Last_Update) %>% 
  summarise()
ggplot(df, aes(x=Deaths , y= Last_Update))

#answer
#df %>% 
# group_by(Last_Update) %>% 
#summerise(cumulative = sum(Deaths)) +
#ggplot(aes(x= Last_Update, y= Cumulative))+
# geom_point()


#get rid of scientific notation
#options(scipen =999)
