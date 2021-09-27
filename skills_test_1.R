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


######
require(dplyr)
df %>%  group_by(Case_Fatality_Ratio) %>% summarise(Province_State= max(Case_Fatality_Ratio))
######
max.col(df$Case_Fatality_Ratio)
df %>%  group_by(Case_Fatality_Ratio) %>% summarise(Province_State= max(Case_Fatality_Ratio))
sort()

#
state_max_fatality_rate <- function(df) sapply(df, max, na.rm = TRUE)
  