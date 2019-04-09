# Likert Summary Data 

library(tidyr)
library(likert)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(likert)
library(forcats)

#Data and Data Frames A is Pre Survey, B is Post Survey 
Q1A <- c("low", "medium", "low", "low", "medium")
Q1B <- c("high", "high", "medium", "low", "high")

Q2A <- c("low", "low", "medium", "low", "medium")
Q2B <- c("high", "medium", "high", "high", "high")

Q3A <- c("low", "low", "low", "medium", "medium")
Q3B <- c("high", "medium", "low", "high", "high")

Q4A <- c("low", "low", "low", "low", "medium")
Q4B <- c("high", "medium", "high", "high", "medium")

Q5A <- c("low", "low", "medium", "low", "medium")
Q5B <- c("high", "medium", "high", "medium", "medium")

Q6A <- c("medium", "low", "low", "medium", "low")
Q6B <- c("high", "high", "high", "high", "medium")

#Apple Scale is Q1 and 2, Banana Scale is Q3 and 4 Cantelope scale is Q5 and 6. 
#I want a likert plot for each scale that shows pre and post totals. 

DF <- data.frame(Q1A, Q1B, Q2A, Q2B, Q3A, Q3B, Q4A, Q4B, Q5A, Q5B, Q6A, Q6B)
Agroup <- c(Q1A, Q2A, Q3A, Q4A, Q5A, Q6A)
Bgroup <- c(Q1B, Q2B, Q3B, Q4B, Q5B, Q6B)

#Create a function that will add an ID variable and the group variable) 
GroupColAdd <- function(mydata, grouplist, groupname){
  select(mydata, grouplist) %>%
  mutate(mydata, 
         Group =rep("groupname"), nrow(mydata),
         ID = rownames(mydata))
}

GroupColAdd(DF, Agroup, Pre) 

AppleSc <- data.frame(Q1A, Q1B, Q2A, Q2B)
BananaSc <- data.frame(Q3A, Q3B, Q4A, Q4B)
CantelopeSc <- data.frame( Q5A, Q5B, Q6A, Q6B)

#Melt Datasets 
AppleSc <- melt(AppleSc, id = )

#set factor levels 
levelset <- c("low", "medium", "high")

# Create the function that sets factor levels for every variable 
factfunc <- function(mydata, factlevel){
  factor(mydata, 
         levels=factlevel, 
         ordered = TRUE)
  fct_unify(mydata, 
            levels=factlevel) 
}






