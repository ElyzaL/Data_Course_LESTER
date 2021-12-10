#exam 3 review in class


no warning no 
library(tidyverse)
library(broom)

theme minimal
theme_set= minimal


r code
df <- read.csv()

df

clean <- df %>% 
  select(ends_with("Salary")"FedID", "Tirr", "state") %>% 
  pivot_longer(starts_with("avg"), 
               names_to ="rank",
               mvalues_to = "salary",
               names_prefix = "avg") %>% 
  mutuate(rank = str_remove_all(rank, "profsalary")) %>% 
  filter(Teir!= "VIIB" )

ggplot(clean, aes(x= rank, y= salary, fill =rank))+
  geom_boxplot() +
  facet_wrap (~Teir) +
  theme(axis)
  
  
  
  
  
  #2
mod <- clarn %>% 
  aov(salary ~state +teir +rank, data.)
sink ("thename")




#3 
df <- read.csv(the data)
chems <- c("alpha-pinene","para-cymene","alpha-terpineol","cedr-9-ene","alpha-cedrene","beta-cedrene","cis-thujopsene","alpha-himachalene","beta-chamigrene","cuparene","compound 1","alpha-chamigrene","widdrol","cedrol","beta-acorenol","alpha-acorenol","gamma-eudesmol","beta-eudesmol","alpha-eudesmol","cedr-8-en-13-ol","cedr-8-en-15-ol","compound 2","thujopsenal")

clean <- df %>% 
  pivot_longer(chems, 
               names_to ="compound",
               values_to= "concentration" )
#4

clean %>% 
  ggplot(aes(x=yesrssinceburn, y= concentration)) +
  geom_smooth()+
  facet_wrap(~compound, scales= "free_y")

#5

mod <- glm(data=clean,
           formula = concentration ~compound*yearssineburn)

tidy(mod) %>% 
filter(p.value < 0.05) %>% 
  mutuate(term= str_remove_all(term, "compound"))


qt(p=1.645, df=22, lower.tail=FALSE)

qt(df1=1, df=98, 9.692)

qt(df=10, 2.807)

qt(p=2.807, df=10)










