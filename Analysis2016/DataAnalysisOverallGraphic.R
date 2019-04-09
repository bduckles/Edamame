# This is RScript for an overall scalar graphic for the Likerts in 2016  

#This code sources: 
#source("AnalyzeData/Pre16ShortName.R") 
#source("AnalyzeData/Post16ShortName.R") 
#source("AnalyzeData/DataGroupings.R")
#source("AnalyzeData/rename.R")

setwd("/Users/Anaya/Dropbox/**EDAMAME")
library(tidyr)
library(likert)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(likert)
library(forcats)

Post16 <- read.csv("Data/EDAMAME_2016_POST_SURVEY.csv",
                   na.strings = c( "", " ", "NA", "I did not participate in the QIIME tutorial", 
                                   "I did not participate in the mothur tutorial"),
                   stringsAsFactors = TRUE )
Pre16 <- read.csv("Data/EDAMAME_2016_PRE_SURVEY.csv", 
                  na.strings = c("", " ", "NA", "I did not participate in the QIIME tutorial", 
                                 "I did not participate in the mothur tutorial"),
                  stringsAsFactors = TRUE)

#Put Long Variable Names into a list.  
Post16LongName <- names(Post16)
Pre16LongName <- names(Pre16)

#Replace colnames with shorter names 
source("AnalyzeData/Pre16ShortName.R") 
source("AnalyzeData/Post16ShortName.R") 
colnames(Post16) <- c(Post16shortname)
colnames(Pre16) <- c(Pre16shortname)


