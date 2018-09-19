## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
f <- factor(c("M", "F", "F", "M", "F"))
f

## ------------------------------------------------------------------------
f <- factor(c("M", "F", "F", "M", "F"))
summary(f)

## ------------------------------------------------------------------------
f <- factor(c("TD", "TA", "TA", "NN", "TA"), ordered = TRUE)
f

## ------------------------------------------------------------------------
f <- factor(c("TD", "TA", "TA", "NN", "TA"), ordered = TRUE,
            c("TD", "NN", "TA"))
            
f
min(f)

## ------------------------------------------------------------------------
f <- factor(c("TD", "TA", "TA", "NN", "TA"), ordered = TRUE,
            c("TD", "D", "NN", "A", "TA"))
            
f
summary(f)

## ------------------------------------------------------------------------
f <- factor(c("TD", "TA", "TA", "NN", "TA"), ordered = TRUE,
            c("TD", "D", "NN", "A", "TA"), 
            labels = c("Totalmente en desacuerdo",
                       "En desacuerdo",
                       "Ni de acuerdo ni en desacuerdo", 
                       "De acuerdo", 
                       "Totalmente de acuerdo"))
f

## ------------------------------------------------------------------------
f <- factor(c("TD", "TA", "TA", "NN", "TA"), ordered = TRUE,
            c("TD", "D", "NN", "A", "TA"))
levels(f)
levels(f) <- c("Totalmente en desacuerdo","En desacuerdo",
               "Ni de acuerdo ni en desacuerdo", "De acuerdo", 
               "Totalmente de acuerdo")
levels(f)

## ------------------------------------------------------------------------
x <- runif(1000, 0, 10)
length(x)
f <- cut(x, breaks=4)
summary(f)

## ------------------------------------------------------------------------
f <- cut(x, breaks=c(0, 5, 7, 9, 10), 
            labels=c("SUSPENSO", "APROBADO", 
                     "NOTABLE", "SOBRESALIENTE"))
summary(f)

