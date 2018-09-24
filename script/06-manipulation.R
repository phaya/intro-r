## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----message=FALSE, warning=FALSE----------------------------------------
library(tidyverse)
library(here)
load(here("data","core_dataset_clean.RData"))

## ------------------------------------------------------------------------
filter(df, MaritalDesc == "Single")

## ------------------------------------------------------------------------
filter(df, MaritalDesc == "Single", Age < 30)

## ------------------------------------------------------------------------
filter(df, (MaritalDesc == "Single" | Age < 30) & Sex == "Male")

## ------------------------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% filter(Age < 30)

## ------------------------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% 
       filter(Age < 30) %>%
       select(EmployeeName, State, MaritalDesc, Age)

## ------------------------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% 
       filter(Age < 30) %>%
       select(contains("Name"), State)

## ------------------------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% 
       filter(Age < 30) %>%
       select(State, Age, MaritalDesc) %>%
       arrange(Age, State)

## ------------------------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% 
       filter(Age < 30) %>%
       select(State, Age, MaritalDesc) %>%
       arrange(desc(Age), State)

## ------------------------------------------------------------------------
df %>% mutate(Days = Sys.Date() - DateofHire) %>%
       select(Age, Days)

## ----message=FALSE, warning=FALSE----------------------------------------
df_prod <- read_csv(here("data", "production_staff.csv"))
colnames(df_prod) <- str_replace_all(colnames(df_prod), "[ /-]", "")
colnames(df_prod)

## ------------------------------------------------------------------------
dim(df)
dim(df_prod)

## ------------------------------------------------------------------------
df_inner <- df %>% inner_join(df_prod, by="EmployeeName")
df_inner

## ------------------------------------------------------------------------
df_full <- df %>% full_join(df_prod, by = "EmployeeName")
dim(df_full)
dim(df_inner)

## ------------------------------------------------------------------------
sum(is.na(df_full$DailyErrorRate))
sum(is.na(df_inner$DailyErrorRate))

## ------------------------------------------------------------------------
cols <- df %>% inner_join(df_prod, by="EmployeeName") %>% colnames()
cols

## ------------------------------------------------------------------------
df <- df %>% inner_join(df_prod, by="EmployeeName") %>% select(-contains(".y"))
colnames(df) <- str_replace_all(colnames(df), "\\.x", "")
colnames(df)

## ------------------------------------------------------------------------
save(df, file = here("data","join_dataset_clean.RData"))

