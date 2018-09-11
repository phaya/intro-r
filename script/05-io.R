## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = FALSE)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
library(here)
df <- read.csv(here("data", "core_dataset.csv"))
head(df)

## ---- echo=TRUE----------------------------------------------------------
library(here)
df <- read.table(here("data", "core_dataset.csv"), header = TRUE, sep = ",")
head(df)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
library(tidyverse)
df <- read_csv(here("data","core_dataset.csv"))
glimpse(df)

## ----echo=TRUE-----------------------------------------------------------
class(df)
head(df)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
glimpse(df)

## ----echo=TRUE, message=FALSE, warning=FALSE-----------------------------
colnames(df) <- str_replace_all(colnames(df), "[ /]", "")
glimpse(df)

## ----echo=TRUE-----------------------------------------------------------
date_cols <- c("DOB", "DateofHire", "DateofTermination")
df[, date_cols] <- map(df[, date_cols], parse_date, "%m/%d/%Y")

## ----echo=TRUE-----------------------------------------------------------
fct_cols <- c("State","Zip", "Sex", "MaritalDesc", "CitizenDesc", 
              "HispanicLatino", "RaceDesc", "ReasonForTerm", 
              "EmploymentStatus", "Department", "Position", 
              "EmployeeSource", "PerformanceScore")
df[, fct_cols] <- map(df[, fct_cols], factor)

## ----echo=TRUE-----------------------------------------------------------
glimpse(df)

## ----eval=FALSE, echo=TRUE, results="hide"-------------------------------
## map(df[, fct_cols], table)
## glimpse(df)

## ------------------------------------------------------------------------
table(df$Sex)
table(df$HispanicLatino)

## ----echo=TRUE-----------------------------------------------------------
df$Sex <- str_replace(df$Sex, "^m", "M")
df$Sex <- factor(df$Sex)

## ----echo=TRUE-----------------------------------------------------------
df$HispanicLatino <- str_replace(df$HispanicLatino, "no", "No")
df$HispanicLatino <- str_replace(df$HispanicLatino, "yes", "Yes")
df$HispanicLatino <- factor(df$HispanicLatino)

## ----echo=TRUE-----------------------------------------------------------
glimpse(df)

## ----echo=TRUE-----------------------------------------------------------
write.csv(df, file = here("data","core_dataset_clean.csv"))

## ----echo=TRUE-----------------------------------------------------------
write_csv(df,  here("data","core_dataset_clean.csv"))

## ----echo=TRUE-----------------------------------------------------------
save(df, file = here("data","core_dataset_clean.RData"))

