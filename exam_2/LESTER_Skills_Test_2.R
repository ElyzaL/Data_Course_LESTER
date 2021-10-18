library(tidyverse)
library(modelr)
library(GGally)
library(patchwork)
library(caret)
library(janitor)
library(gridExtra)

#I. Load the landdata-states.csv file into R
# Re-create the graph shown in "fig1.png"
#Export it to your Exam_2 folder as LASTNAME_Fig_1.jpg 
#(note, that's a jpg, not a png) To change the y-axis 
#values to plain numeric, add options(scipen = 999) to your script
df <- read_csv("~/Desktop/BIOL3100_Exams/Exam_2/landdata-states.csv")
options(scipen = 999)
p1 <- ggplot(df, aes(x= Year, y= Land.Value, color = region)) +
  geom_smooth(method = "loess", level = 0.8,)
#need a geom_curve here?
p1 +labs(y= "Land Value (USD)", x= "Year", (scipen = 999))

#II.     What is "NA Region???"
#Write some code to show which state(s) are found 
#  in the "NA" region   
sum(df$region =="NA")
df [is.na(df$region),]
#DC is the NA region

#III.    The rest of the test uses another data set. 
#  The unicef-u5mr.csv data. Get it loaded and take a look.
#   It's not exactly tidy. You had better tidy it!

dat <- read_csv("~/Desktop/BIOL3100_Exams/Exam_2/unicef-u5mr.csv")
colnames(dat) <- janitor::make_clean_names(colnames(dat))
dat$continent %>% unique()

long_dat <- dat %>% 
  pivot_longer(cols = c("u5mr_1950", "u5mr_1951", "u5mr_1952", "u5mr_1953",
                        "u5mr_1954", "u5mr_1955", "u5mr_1956", "u5mr_1957", "u5mr_1958",
                        "u5mr_1959", "u5mr_1960", "u5mr_1961", "u5mr_1962", "u5mr_1963",
                        "u5mr_1964", "u5mr_1965", "u5mr_1966", "u5mr_1967", "u5mr_1968",
                        "u5mr_1969", "u5mr_1970", "u5mr_1971", "u5mr_1972", "u5mr_1973",
                        "u5mr_1974", "u5mr_1975", "u5mr_1976", "u5mr_1977", "u5mr_1978",
                        "u5mr_1979", "u5mr_1980", "u5mr_1981", "u5mr_1982", "u5mr_1983",
                        "u5mr_1984", "u5mr_1985", "u5mr_1986", "u5mr_1987", "u5mr_1988",
                        "u5mr_1989", "u5mr_1990", "u5mr_1991", "u5mr_1992", "u5mr_1993",
                        "u5mr_1994", "u5mr_1995", "u5mr_1996", "u5mr_1997", "u5mr_1998",
                        "u5mr_1999", "u5mr_2000", "u5mr_2001", "u5mr_2002", "u5mr_2003",
                        "u5mr_2004", "u5mr_2005", "u5mr_2006", "u5mr_2007", "u5mr_2008",
                        "u5mr_2009", "u5mr_2010", "u5mr_2011", "u5mr_2012", "u5mr_2013",
                        "u5mr_2014", "u5mr_2015"),
               names_to = "year",
               values_to = "MortalityRate") 

#IV.   Re-create the graph shown in fig2.png
#Export it to your Exam_2 folder as LASTNAME_Fig_2.jpg 
#(note, that's a jpg, not a png)

p2 <- long_dat %>% 
 ggplot(aes(x=year, y=MortalityRate, color = continent)) +
  scale_x_discrete(breaks= seq(1960, 2000, by = 20)) +
  geom_line()
p2

#IV.     Re-create the graph shown in fig3.png
#Note: This is a line graph of average mortality rate over
#time for each continent (i.e., all countries in each continent, 
#yearly average), this is NOT a geom_smooth() Export it to your 
#Exam_2 folder as LASTNAME_Fig_3.jpg (note, that's a jpg, not a png)
 mean_mortality_rate <-  mean(long_dat$MortalityRate, na.rm = 0)

 p3 <- long_dat %>% 
   group_by(year, MortalityRate) %>% 
   summarise(mean_mortality_rate =mean(MortalityRate), year) %>% 
   ggplot(aes(x= year, y= mean_mortality_rate, color = continent)) +
   scale_x_discrete(breaks= seq(1960, 2000, by = 20)) +
   geom_line()+
   geom_smooth(method= lm)+
   labs(y= "Mean Mortality Rate (deaths per 1000 live births)", x= "Year") +
   theme_minimal()
p3

#V.      Re-create the graph shown in fig4.png
#Note: The y-axis shows proportions, not raw numbers
#This is a scatterplot, faceted by region
#Export it to your Exam_2 folder as LASTNAME_Fig_3.jpg 
#(note, that's a jpg, not a png)

p4 <- long_dat %>% 
   ggplot(aes(x= year, y= MortalityRate)) +
   geom_point(color= "blue")+
   geom_smooth(se = FALSE) +
   facet_wrap(~ region) +
   scale_x_discrete(breaks= seq(1960, 2000, by = 20)) +
   labs(x= "year", y= "Mortality Rate") +
   theme_minimal()
p4
