#DemographicAnalysis
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

#Replace colnames with shorter names 
source("AnalyzeData/Pre16ShortName.R") 
source("AnalyzeData/Post16ShortName.R") 
colnames(Post16) <- c(Post16shortname)
colnames(Pre16) <- c(Pre16shortname)

summary(Pre16$Age, mean, na.rm=TRUE)
summary(Pre16$AcadStatus)
summary(Pre16$Ethnicity)
summary(Pre16$Gender)



VignPost16 <- read.csv("AnalyzeData/Post16VignettesCoded.csv",
                   na.strings = c( "", " ", "NA"),
                   stringsAsFactors = TRUE )
VignPre16 <- read.csv("AnalyzeData/Pre16_VignettesCoded.csv", 
                  na.strings = c( "", " ", "NA"),
                  stringsAsFactors = TRUE )

summary(VignPre16$X16S_Vignette_Pre)
summary(VignPost16$X16S_Vignette_Post)

summary(VignPre16$Soil_Vignette_Pre)
summary(VignPost16$Soil_Vignette_Post)

summary(VignPost16$OVERALL.WORKSHOP.RATING)
summary(VignPost16$OVERALL.INVITED.SPEAKER.RATING)
summary(VignPost16$How.well.did.this.workshop.meet.your.needs.)
summary(VignPost16$Did.you.learn.what.you.had.hoped.to.learn.from.participating.in.this.workshop.)
summary(VignPost16$Did.your.understanding.of.computational.science.change.because.of.your.participation.in.this.workshop.)
summary(VignPost16$Would.you.recommend.this.workshop.to.your.colleagues.)
summary(VignPost16$Did.you.participate.in.EDAMAME.remotely..e.g..teleconference..)
summary(VignPost16$CommentCode1)
summary(VignPost16$CommentCode2)