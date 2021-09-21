
# This code is just written to check if the transformingDFdata.R file worked 

library(tidyverse)

data <- read.csv("diamondFork/Table4_1a_Long.csv", skip = 2)
colnames(data) <- tolower(colnames(data))

data2 <- data %>%
  group_by(site, gear) %>%
  summarise(total = sum(quantity))

ggplot(data2, aes(x = as.factor(site), y = total, fill = gear)) + 
  geom_col()

# Seems like everything was legit

data3 <- data %>%
  group_by(site, order) %>%
  summarise(total = sum(quantity))

ggplot(data3, aes(x = as.factor(order), y = log(total), fill = site)) + 
  geom_col()

ggplot(data3, aes(x = as.factor(site), y = log(total), fill = order)) + 
  geom_col()

