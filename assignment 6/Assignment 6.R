library(tidyverse)
library(janitor)

dat <- read_csv("~/Desktop/Data_Course_LESTER/assignment 6/BioLog_Plate_Data.csv")
dat
 names(dat) <- make_clean_names(names(dat))


#clean 
dat <- dat %>% 
  pivot_longer(dat, cols = starts_with("Hr_"),
               names_to = "Time", 
               names_prefix = "Hr_", 
               values_to = "absorbance") %>% 
  mutate(time= as.numeric(time)) %>% 
  mutate(type= case_when('Sample_ID' == "CLear_Creek" ~ "water",
                         'Sample_ID' == "Waste_Water" ~ "water",
                         TRUE ~ "soil"))

#we did this part in class
dat %>% 
  filter(substrate == "Itaconic Acid") %>% 
  group_by(time, sample_id, dilution) %>% 
  summarise(avg_for_all_dilutions = mean(absorbance),
            N=n())


#graph 1
dat %>% 
  filter(Dilution == 0.1) %>% 
  ggplot(aes(x= time, y = absorbance)) +
  geom_smooth(se =FALSE) +
  facet_wrap(~ substrate) +
  labs(subtitle = "Just dilution = 0.1", 
       x= "Time",
       y= "Absorbance",
       color= "Type") +
  theme_minimal()



#graph 2
df$Substrate %>% unique()

p <- df %>% 
  filter(substrate == "Itaonic Acid") %>% 
  group_by(dilution, sample_id, time) %>% 
  summarise(Mean_Absorbance = mean(absorbance), time) %>% 
  ggplot(aes(x=time, y=Mean_Absorbance, color= sample_id)) +
  geom_line()+
  facet_wrap(~dilution)

p+ transition_reveal(time)





# model tween 80 ####
 

dat %>% 
  filter(Dilution == 0.1) %>% 
  filter(Substrate == "Tween 80") %>% 
#sqrt makes the bell curve
  ggplot(aes(x= sqrt(absorbance))) +
  geom_density()

#tells us about the graph

dat %>% 
  filter(Dilution == 0.1) %>% 
  filter(Substrate == "Tween 80") %>% 
glm(data =.,
    formula = absorbance ~ type * time) %>% 
  summary()

#plotly
library(plotly)

p <- dat %>% 
  ggplot(aes(x= factor(time), y= absorbance, fill= sample_id)) +
  geom_boxplot()
p
 



