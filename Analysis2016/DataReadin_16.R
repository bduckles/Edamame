# DataReadin_16.R

## DATA GROUPINGS TURNED OFF JUST UNDO THE # BELOW TO TURN BACK ON AGAIN

#setwd("~/git/Edamame")

library(likert)
library(tidyverse)
library(forcats)
library(reshape2)


# Data --------------------------------------------------------------------
Post16 <- read.csv("Data/EDAMAME_2016_POST_SURVEY.csv",
                   na.strings = c( "", " ", "NA", "I did not participate in the QIIME tutorial", 
                                   "I did not participate in the mothur tutorial"),
                   stringsAsFactors = TRUE)
Pre16 <- read.csv("Data/EDAMAME_2016_PRE_SURVEY.csv", 
                  na.strings = c("", " ", "NA", "I did not participate in the QIIME tutorial", 
                                 "I did not participate in the mothur tutorial"),
                  stringsAsFactors = TRUE)

#Put Long Variable Names into a list.  
Post16LongName <- names(Post16)
Pre16LongName <- names(Pre16)

#Replace colnames with shorter names 
source("Analysis2016/Pre16ShortName.R") 
source("Analysis2016/Post16ShortName.R") 
colnames(Post16) <- c(Post16shortname)
colnames(Pre16) <- c(Pre16shortname)

# Data Groupings ----------------------------------------------------------
#Load question data groupings
#source("Analysis2016/DataGroupings16.R")
