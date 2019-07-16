

setwd("C:/Users/Dr.Kim/OneDrive - Clark Atlanta University/CAU/Class/2019 Summer/Data Science")

titan<- read.csv("titanic_original.csv")
library(readxl)
library(dplyr)

titan$embarked = as.character(titan$embarked)
titan1 <- titan %>%
  mutate(embarked = ifelse(embarked == '', 'S', embarked))

titan2<- filter(titan1, age != '')
titanagemean <- mean(titan2$age)
titanagemean2 <-titan1 %>%
  mutate(age = ifelse(is.na(age), titanagemean, age))

titanagemeanboat <-titanagemean2 %>%
  mutate(boat = ifelse(boat == '', NA, boat))

titancabin <- titanagemeanboat %>%
  mutate(has_cabin_number = ifelse(cabin == '', 0, 1))

write.csv(titancabin, file = "titanic_final.csv")