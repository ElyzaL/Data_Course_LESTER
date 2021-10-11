library(tidyverse)
dat <- read_csv("~/Data_Course/Data/BioLog_Plate_Data.csv")
dat



# 1. Clean this data into tidy (long) form
dat %>% 
  pivot_longer(cols = c("Hr_24", "Hr_48", "Hr_144"),
               names_to = "absorbance",
               values_to = "Time")
 


# 2. Creates a new column specifying whether 
#      a sample is from soil or water
dat$sample_type <- dat$`Sample ID`
  levels(dat$sample_type) <- c(levels(dat$sample_type),"water")
  dat[dat$`Sample ID` %in% c("Clear_Creek", 
                           "Waste_Water"), "sample_type"] <- "water"
  
dat$sample_type <- dat$`Sample ID`
  levels(dat$sample_type) <- c(levels(dat$sample_type),"soil")
  dat[dat$`Sample ID` %in% c("Soil_1", 
                             "Soil_2"), "sample_type"] <- "soil"
dat



# 3. Generates a plot that matches this one (note just plotting dilution == 0.1):

samples <- c("Clear_Creek", "Waste_Water", "Soil_1", "Soil_2")

graph.of.dat <- dat %>% 
  filter(`Sample ID` == "samples") %>% 
  ggplot(aes(x= Dilution, y=absorbance)) +
  geom_point() +
  geom_smooth() +
  theme_minimal()
  
head(graph.of.dat)



#3. Generates an animated plot that matches this one 
#   (absorbance values are mean of all 3 replicates for each group):
mean_absorbance <- mean(dat, c(Hr_24, Hr_48, Hr_144))

p <- dat %>%
  plot_ly(x = ~mean_absorbance, 
          y = ~time,
          size = ~pop, 
          frame = ~year, 
          text = ~Sample ID, 
          showarrow = TRUE,
          hoverinfo = "text",
          type = 'scatter',
          mode = 'markers', 
          symbol = ~Sample ID,
          marker = list(size = ~pop, 
                        opacity = 10)) %>% 
  layout(xaxis = list(type = "log")) 
p
















