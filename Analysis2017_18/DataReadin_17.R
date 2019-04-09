#DataLoadIn 2017 
## DATA GROUPINGS TURNED OFF JUST UNDO THE # BELOW TO TURN BACK ON AGAIN

#setwd("~/git/Edamame")

library(likert)
library(tidyverse)
library(likert)
library(reshape2)

# Data --------------------------------------------------------------------
Post17 <- read.csv("Data/EDAMAME_2017_POST_SURVEY.csv",
  na.strings = c( "", " ", "NA", "I did not participate in the QIIME tutorial","I did not participate in the mothur tutorial"), stringsAsFactors = TRUE)
Pre17 <- read.csv("Data/EDAMAME_2017_PRE_SURVEY.csv", 
  na.strings = c("", " ", "NA", "I did not participate in the QIIME tutorial", 
"I did not participate in the mothur tutorial"), stringsAsFactors = TRUE)

#Put Long Variable Names into a list.  
Post17LongName <- names(Post17)
Pre17LongName <- names(Pre17)

#Replace colnames with shorter names 
source("Analysis2017_18/Pre17ShortName.R") 
source("Analysis2017_18/Post17ShortName.R") 
colnames(Post17) <- c(Post17shortname)
colnames(Pre17) <- c(Pre17shortname)

#Call in the 17 Data Groupings 
#source("Analysis2017_18/DataGroupings17.R") 

