#DataLoadIn 2018 

## DATA GROUPINGS TURNED OFF JUST UNDO THE # BELOW TO TURN BACK ON AGAIN

#setwd("~/git/Edamame")

library(likert)
library(tidyverse)
library(likert)
library(reshape2)

# Data --------------------------------------------------------------------
Post18 <- read.csv("Data/EDAMAME_2018_POST_SURVEY.csv",
  na.strings = c( "", " ", "NA", "I did not participate in the QIIME tutorial","I did not participate in the mothur tutorial"), stringsAsFactors = TRUE)
Pre18 <- read.csv("Data/EDAMAME_2018_PRE_SURVEY.csv", 
  na.strings = c("", " ", "NA", "I did not participate in the QIIME tutorial", 
"I did not participate in the mothur tutorial"), stringsAsFactors = TRUE)

#Put Long Variable Names into a list.  
Post18LongName <- names(Post18)
Pre18LongName <- names(Pre18)

#Replace colnames with shorter names 
source("Analysis2017_18/Pre18ShortName.R") 
source("Analysis2017_18/Post18ShortName.R") 
colnames(Post18) <- c(Post18shortname)
colnames(Pre18) <- c(Pre18shortname)

#Call in the 18 Data Groupings 
#source("Analysis2017_18/DataGroupings18.R") 



