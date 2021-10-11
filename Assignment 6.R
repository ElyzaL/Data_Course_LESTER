library(tidyverse)
dat <- read_csv("~/Data_Course/Data/BioLog_Plate_Data.csv")
dat



#clean 
dat <- dat %>% 
  pivot_longer(cols = starts_with("hr_"), 
               names_to = "time", 
               values_to = "absorbance", 
               names_prefix = "hr_") %>% 
  mutate(time= as.numeric(time)) %>% 
  mutate(type= case_when('Sample_ID' == "CLear_Creek" ~ "water",
                         'Sample_ID' == "Waste_Water" ~ "water",
                         TRUE ~ "soil"))



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
