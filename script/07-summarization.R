## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

## ----echo = TRUE---------------------------------------------------------
library(here)
library(tidyverse)
load(here("data","core_dataset_clean.RData"))
head(df)

## ----echo=TRUE-----------------------------------------------------------
by_sex <- df %>% group_by(Sex)
by_sex

## ----echo=TRUE-----------------------------------------------------------
df %>% group_by(Sex) %>%
       summarise(PayRate = mean(PayRate))

## ----echo = TRUE---------------------------------------------------------
summary(cars)

## ----pressure------------------------------------------------------------
plot(pressure)

