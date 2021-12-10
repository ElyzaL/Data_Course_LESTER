library(tidyverse)
library(janitor)
library(modelr)
library(GGally)
library(MASS)
library(cowplot)

# reading in the data, making sure the plots will use normal numbers, and looking at the data
df1<- read_csv("~/Desktop/Data_Course_LESTER/Exam_3/FacultySalaries_1995.csv")
options(scipen = 999)
glimpse(df1)

#trying to avoid spelling typos
df1
names(df1) <- make_clean_names(names(df1))

#tiding the data
df1.1 <- rename(df1, Full = avg_full_prof_salary) 
df1.2 <- rename(df1.1, Assoc = avg_assoc_prof_salary) 
df1.3 <- rename(df1.2, Assist =  avg_assist_prof_salary)
  
df1_long <- df1.3 %>% 
  pivot_longer(c(Full, Assoc, Assist),
               names_to = "Rank", 
               values_to = "Salary")

####maybe
modI <- filter(df1_long, tier == "I")
modI1 <- modI %>% 
  ggplot(aes(x= Rank, y = Salary)) +
  geom_boxplot()

modIIA <- filter(df1_long, tier == "IIA")
modIIA1 <- modIIA %>% 
  ggplot(aes(x= Rank, y= Salary)) +
  geom_boxplot()

modIIB <- filter(df1_long, tier == "IIB")
modIIB1 <- modIIB %>% 
  ggplot(aes(x= Rank, y= Salary)) +
  geom_boxplot()



#this will show them on a grid but not on the same axis
plot_grid(modI1, modIIA1, modIIB1)


######### question 2

#anova- specilized version of glm, dumbed down 
mod.aov<- aov(formula = Salary ~ state + tier + Rank,
              data = df1_long)
capture_a <- summary(mod.aov)
capture.output(capture_a, file = "Salary_ANOVA_Summary.txt")
###find where it saved


##########question 3

df2 <- read_csv("~/Desktop/Data_Course_LESTER/Exam_3/Juniper_Oils.csv")
glimpse(df2)

df2_long <- df2 %>% 
  pivot_longer(c("alpha-pinene","para-cymene","alpha-terpineol","cedr-9-ene","alpha-cedrene","beta-cedrene","cis-thujopsene","alpha-himachalene","beta-chamigrene","cuparene","compound 1","alpha-chamigrene","widdrol","cedrol","beta-acorenol","alpha-acorenol","gamma-eudesmol","beta-eudesmol","alpha-eudesmol","cedr-8-en-13-ol","cedr-8-en-15-ol","compound 2","thujopsenal"),
               names_to = "ChemicalID", 
               values_to = "Concentration")

######question 4

fig2 <- df2_long %>% 
  ggplot(aes(x = YearsSinceBurn,
             y = Concentration))+
  geom_smooth()+
  facet_wrap( ~ChemicalID,  scales = "free_y" )


############QUESTION 5

mod2 <- glm(data = df2_long, 
    formula = Yield_percent~ ChemTotal* ChemMean* 
      Concentration* YearsSinceBurn)
mod2 %>% broom::tidy()

