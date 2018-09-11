## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
library(tidyverse)
library(here)
load(here("data","core_dataset_clean.RData"))

## ----echo=TRUE-----------------------------------------------------------
filter(df, MaritalDesc == "Single")

## ---- echo = TRUE--------------------------------------------------------
filter(df, MaritalDesc == "Single", Age < 30)

## ---- echo = TRUE--------------------------------------------------------
filter(df, (MaritalDesc == "Single" | Age < 30) & Sex == "Male")

## ----echo = TRUE---------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% filter(Age < 30)

## ----echo = TRUE---------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% 
       filter(Age < 30) %>%
       select(EmployeeName, State, MaritalDesc, Age)

## ----echo = TRUE---------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% 
       filter(Age < 30) %>%
       select(contains("Name"), State)

## ----echo = TRUE---------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% 
       filter(Age < 30) %>%
       select(State, Age, MaritalDesc) %>%
       arrange(Age, State)

## ----echo = TRUE---------------------------------------------------------
df %>% filter(MaritalDesc == "Single") %>% 
       filter(Age < 30) %>%
       select(State, Age, MaritalDesc) %>%
       arrange(desc(Age), State)

## ---- echo = TRUE--------------------------------------------------------
df %>% mutate(Days = Sys.Date() - DateofHire) %>%
       select(Age, Days)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
df_prod <- read_csv(here("data", "production_staff.csv"))
colnames(df_prod) <- str_replace_all(colnames(df_prod), "[ /-]", "")
colnames(df_prod)

## ----echo=TRUE-----------------------------------------------------------
dim(df)
dim(df_prod)

## ----echo=TRUE-----------------------------------------------------------
df_inner <- df %>% inner_join(df_prod, by="EmployeeName")
df_inner

## ----echo=TRUE-----------------------------------------------------------
df_full <- df %>% full_join(df_prod, by = "EmployeeName")
dim(df_full)
dim(df_inner)

## ----echo=TRUE-----------------------------------------------------------
sum(is.na(df_full$DailyErrorRate))
sum(is.na(df_inner$DailyErrorRate))

## ----echo=TRUE-----------------------------------------------------------
cols <- df %>% inner_join(df_prod, by="EmployeeName") %>% colnames()
cols

## ----echo=TRUE-----------------------------------------------------------
df <- df %>% inner_join(df_prod, by="EmployeeName") %>% select(-contains(".y"))
colnames(df) <- str_replace_all(colnames(df), "\\.x", "")
colnames(df)

## ----echo=TRUE-----------------------------------------------------------
save(df, file = here("data","join_dataset_clean.RData"))

