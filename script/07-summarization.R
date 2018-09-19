## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(here)
library(tidyverse)
load(here("data","join_dataset_clean.RData"))
head(df)

## ------------------------------------------------------------------------
df %>% summarise(mean(PayRate))

## ------------------------------------------------------------------------
df %>% summarise(mean(PayRate), median(PayRate), var(PayRate))

## ------------------------------------------------------------------------
df %>% summarise(mean(PayRate), mean(Age))

## ------------------------------------------------------------------------
df %>% summarise(media=mean(PayRate), mediana=median(PayRate), var=var(PayRate))

## ----echo=TRUE-----------------------------------------------------------
by_sex <- df %>% group_by(Sex)
by_sex

## ----echo=TRUE-----------------------------------------------------------
df %>% group_by(Sex) %>%
       summarise(PayRate = mean(PayRate))

## ----echo=TRUE-----------------------------------------------------------
df %>% group_by(Sex) %>%
       summarise(PayRate = mean(PayRate), Age = mean(Age))

## ----echo=TRUE-----------------------------------------------------------
df %>% group_by(Sex) %>%
       summarise(count = n())

## ----echo=TRUE-----------------------------------------------------------
df %>% group_by(Sex, Age) %>%
       summarise(count = n())

## ----echo=TRUE-----------------------------------------------------------
df_c <- df %>% group_by(year=format(DateofHire, "%Y")) %>%
            summarise(count = n()) %>%
            mutate(contratacion=cumsum(count)) %>%
            select(year, contratacion)
df_c

## ----echo=TRUE-----------------------------------------------------------
df_e <- df %>% group_by(year=format(DateofTermination, "%Y")) %>%
               summarise(count = n()) %>%
               mutate(despidos=cumsum(count)) %>%
               filter(!is.na(year)) %>%
               select(year, despidos)
df_e

## ----echo=TRUE-----------------------------------------------------------
library(scales)
df_c %>% full_join(df_e, by="year") %>% 
         mutate(despidos=ifelse(is.na(despidos), 0, despidos)) %>%
         mutate(plantilla=contratacion-despidos) %>%
         mutate(plantilla_1=lag(plantilla)) %>%
         mutate(crecimiento=(plantilla-plantilla_1)/plantilla) %>%
         mutate(crecimiento=percent(crecimiento)) %>%
         select(year, plantilla, crecimiento)

