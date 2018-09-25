## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ----message=FALSE, warning=FALSE----------------------------------------
library(here)
load(here("data","join_dataset_clean.RData"))

## ------------------------------------------------------------------------
summary(df$PayRate)

## ----echo=FALSE----------------------------------------------------------
hist(df$PayRate)

## ------------------------------------------------------------------------
hist(df$PayRate, breaks = 3)

## ------------------------------------------------------------------------
hist(df$PayRate, breaks = 30)

## ----eval=FALSE----------------------------------------------------------
## hist(df$PayRate,
##      main="Distribución del precio por hora",
##      sub="Sólo aplica a plantilla de producción",
##      xlab="Precio (h)", ylab="Frecuencia")

## ----echo=FALSE----------------------------------------------------------
hist(df$PayRate, 
     main="Distribución del precio por hora", 
     sub="Sólo aplica a plantilla de producción",
     xlab="Precio (h)", ylab="Frecuencia")

## ----eval=FALSE----------------------------------------------------------
## hist(df$PayRate,
##      main="Distribución del precio por hora",
##      sub="Sólo aplica a plantilla de producción",
##      xlab="Precio (h)", ylab="Frecuencia",
##      col="azure", border="azure4")

## ----echo=FALSE----------------------------------------------------------
hist(df$PayRate, 
     main="Distribución del precio por hora", 
     sub="Sólo aplica a plantilla de producción",
     xlab="Precio (h)", ylab="Frecuencia",
     col="azure", border="azure4")

## ------------------------------------------------------------------------
plot(density(df$PayRate))

## ------------------------------------------------------------------------
boxplot(PayRate ~ Sex, data=df, 
        xlab="Género", ylab="Precio por hora")

## ------------------------------------------------------------------------
count <- table(df$MaritalDesc)
barplot(count)

## ----eval=FALSE----------------------------------------------------------
## count <- table(df$Sex, df$MaritalDesc)
## barplot(count, col=c("darkseagreen1", "orange"),
##         legend = rownames(count))

## ----echo=FALSE----------------------------------------------------------
count <- table(df$Sex, df$MaritalDesc)
barplot(count, col=c("darkseagreen1", "orange"), 
        legend = rownames(count))

## ----eval=FALSE----------------------------------------------------------
## barplot(count,
##         col=c("darkseagreen1", "orange"),
##         legend = rownames(count),
##         beside=TRUE)

## ----echo=FALSE----------------------------------------------------------
barplot(count, 
        col=c("darkseagreen1", "orange"), 
        legend = rownames(count), 
        beside=TRUE)

## ----eval=FALSE----------------------------------------------------------
## barplot(count,
##         col=c("darkseagreen1", "orange"),
##         legend = rownames(count),
##         beside=TRUE, horiz=TRUE)

## ----echo=FALSE----------------------------------------------------------
barplot(count,
        col=c("darkseagreen1", "orange"), 
        legend = rownames(count),
        beside=TRUE, horiz=TRUE)

## ------------------------------------------------------------------------
plot(df$Age, df$PayRate)

## ------------------------------------------------------------------------
plot(df$Age, df$PayRate, pch=4)

## ----echo=FALSE----------------------------------------------------------
#++++++++++++++++++++++++++++++++++++++++++++
#generate a plot of point shapes which R knows about.
#++++++++++++++++++++++++++++++++++++++++++++
# source: http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r
generateRPointShapes<-function(){
  oldPar<-par()
  par(font=2, mar=c(0.5,0,0,0))
  y=rev(c(rep(1,6),rep(2,5), rep(3,5), rep(4,5), rep(5,5)))
  x=c(rep(1:5,5),6)
  plot(x, y, pch = 0:25, cex=1.5, ylim=c(1,5.5), xlim=c(1,6.5), 
       axes=FALSE, xlab="", ylab="", bg="blue")
  text(x, y, labels=0:25, pos=3)
  par(mar=oldPar$mar,font=oldPar$font )
}
generateRPointShapes()

## ----eval=FALSE----------------------------------------------------------
## plot(df$Age, df$PayRate, col=df$Sex,
##      main="Distribución salarial por cohorte",
##      xlab="Edad", ylab="Precio por hora")
## legend("topleft",
##        levels(df$Sex),
##        col=1:length(levels(df$Sex)),
##        pch = 1)

## ----echo=FALSE----------------------------------------------------------
plot(df$Age, df$PayRate, col=df$Sex,
     main="Distribución salarial por cohorte",
     xlab="Edad", ylab="Precio por hora")
legend("topleft", 
       levels(df$Sex), 
       col=1:length(levels(df$Sex)), 
       pch = 1)

## ----eval=FALSE----------------------------------------------------------
## library(tidyverse)
## hiring <- df %>%
##             mutate(year = format(DateofHire, "%Y")) %>%
##             group_by(year) %>%
##             summarise(total = n())
## hiring

## ----echo=FALSE----------------------------------------------------------
library(tidyverse)
hiring <- df %>%
            mutate(year = format(DateofHire, "%Y")) %>%
            group_by(year) %>%
            summarise(total = n())
hiring

## ------------------------------------------------------------------------
plot(hiring$year, hiring$total, type="l")

## ------------------------------------------------------------------------
plot(hiring$year, hiring$total, type="l",
     lty=3, lwd=2)

## ----eval=FALSE----------------------------------------------------------
## plot(hiring$year, hiring$total)
## lines(hiring$year, hiring$total,
##      lty=3, lwd=2)

## ----echo=FALSE----------------------------------------------------------
plot(hiring$year, hiring$total)
lines(hiring$year, hiring$total,
     lty=3, lwd=2)

## ----eval=FALSE----------------------------------------------------------
## plot(hiring$year, hiring$total)
## lines(hiring$year, hiring$total,
##      lty=3, lwd=2)
## text(hiring$year, hiring$total, labels=hiring$total, pos=3)

## ----echo=FALSE----------------------------------------------------------
plot(hiring$year, hiring$total)
lines(hiring$year, hiring$total,
     lty=3, lwd=2)
text(hiring$year, hiring$total, labels=hiring$total, pos=3)

## ----eval=FALSE----------------------------------------------------------
## png(file = here("img","myplot.png"), bg = "transparent")
## plot(hiring$year, hiring$total)
## lines(hiring$year, hiring$total,
##      lty=3, lwd=2)
## text(hiring$year, hiring$total, labels=hiring$total, pos=3)
## dev.off()

## ----message=FALSE, warning=FALSE----------------------------------------
old_par <- par()
par(col.main="red") 
hist(df$PayRate)   
par(old_par)          

