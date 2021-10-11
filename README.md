# Data_Course_LESTER
## This README file contains information about my uploaded assignments

edit 1

## commiting a change
- `git status`
- git add .
- git commit -m "text" 
- git push 

this is a paragraph 

this is **bold text**

this is *italic* 

## list
1. first line
2. second line 
3. third line


- 1998\. this is a year

# title #1
## title #2
### title #3
#### title #4
##### title #5
###### title #6

Alternitive Heading #1
=======================

Alternative heading #2
-----------------------

This is the first line.
this is the second line. 


 __Alternitive Bold Text__

 this is **Bold** in the middle of a line hehe

 and some *italic* in the middle

 alternitive _italic_ text

 this is my 26th commit 

 can you tell this bolded text ***is important*** 

 this is another way of making the text __*Bold*__

 this is **_Bold_** too

 30th commit bc i have to get to class now
 









 csv_files= list.files(path = "Data", pattern = ".csv$")
length(csv_files)
df= read.csv("Data/wingspan_vs_mass.csv")
head(df,5)
b_files <- list.files(path = "Data", pattern = "^b",recursive = TRUE)
for (file_name in b_files) {
  b_data<- read.csv(paste0("Data/",file_name))
  print(head(b_data,1))
}
for (file_name in csv_files) {
  b_data<- read.csv(paste0("Data/",file_name))
  print(head(b_data,1))
}

csv_files= list.files(path = "Data", pattern = ".csv$")
length(csv_files)
df= read.csv("Data/wingspan_vs_mass.csv")
head(df,5)
b_files <- list.files(path = "Data", pattern = "^b",recursive = TRUE)
for (file_name in b_files) {
  b_data<- read.csv(paste0("Data/",file_name))
  print(head(b_data,1))
}
for (file_name in csv_files) {
  b_data<- read.csv(paste0("Data/",file_name))
  print(head(b_data,1))
  
  
  
  
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

 
  
