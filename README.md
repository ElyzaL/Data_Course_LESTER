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
  
  
