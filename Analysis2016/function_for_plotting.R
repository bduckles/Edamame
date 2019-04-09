#Factor Levels for a group of variables within a dataset and then plot to likert with factor 
#levels set to the same number. 

#This code sources: 
#source("scripts/Pre16ShortName.R") 
#source("scripts/Post16ShortName.R") 
#source("scripts/DataGroupings.R")
#source("scripts/rename.R")


# setwd("/Users/Anaya/Dropbox/**EDAMAME")
library(likert)
library(tidyverse)
library(forcats)
library(reshape2)

Post16 <- read.csv("data/EDAMAME_2016_POST_SURVEY_Fake.csv",
                   na.strings = c( "", " ", "NA", "I did not participate in the QIIME tutorial", 
                                   "I did not participate in the mothur tutorial"),
                   stringsAsFactors = TRUE, skip = 1, header = FALSE)

Pre16 <- read.csv("data/EDAMAME_2016_PRE_SURVEY_Fake.csv", 
                  na.strings = c("", " ", "NA", "I did not participate in the QIIME tutorial", 
                                 "I did not participate in the mothur tutorial"),
                  stringsAsFactors = TRUE, skip = 1, header = FALSE)
Pre16 <- Pre16[1:3, ]

#Put Long Variable Names into a list.  
Post16LongName <- names(Post16)
Pre16LongName <- names(Pre16)

#Replace colnames with shorter names 
source("scripts/Pre16ShortName.R") 
source("scripts/Post16ShortName.R") 
colnames(Post16) <- c(Post16shortname)
colnames(Pre16) <- c(Pre16shortname)

##Factor levels for each question type 
abilitylevel <- c("No Ability", "Low Ability", "Intermediate Ability", "High Ability")
agreelevel <- c("Strongly Disagree", "Disagree", "Agree","Strongly Agree")
comflevel <- c("I do not know what this is.", "Very Uncomfortable", "Uncomfortable", "Comfortable","Very Comfortable")
comflevel

source("scripts/DataGroupings.R")

process <- function(data_pre, data_post, title, question_levels) {
  data_post <- mutate(data_post, 
                      Group = rep("Post", nrow(data_post)),
                      ID = rownames(data_post))
  data_pre <- mutate(data_pre, 
                    Group = rep("Pre", nrow(data_pre)),
                    ID = rownames(data_pre))
  
  #Add a group variable so that when joined can sort between Pre and post as well as an ID variable
  joined_data <- full_join(data_post, data_pre)
  
  #Factor Functions and make them all the same size (use factfunc)
  
  require(plyr)
  joined_data[, ] <- plyr::colwise(as.factor)(joined_data[, ])
  drops <- c("Group","ID")
  joined_data_test <- fct_unify(joined_data[ , !(names(joined_data) %in% drops)], levels = question_levels) %>% as.data.frame()
  joined_data_bound <- cbind(joined_data_test, joined_data$Group)
  
  #REdo the factoring (maybe don't do earlier factoring? not sure)
  GrpLevel <- c("Post", "Pre")
  
  joined_data_bound$`joined_data$Group` <- factor(joined_data_bound$`joined_data$Group`, levels=GrpLevel, ordered = TRUE)
  
  WOG_joined <- select(joined_data_bound, everything()) %>% 
    select(-starts_with("joined_data$Group"))  
  
  title_wog_joined <- title
  likert_wog_joined <- likert(WOG_joined, grouping = joined_data_bound$`joined_data$Group`)
  
  plot(likert_wog_joined) + ggtitle(title_wog_joined)
}


process(AllPost_PerCompAbilSc, AllPre_PerCompAbilSc, "Title", abilitylevel)




# break -------------------------------------------------------------------










#Load question data groupings
source("scripts/DataGroupings.R")









#create a new level for my new joined dataset to distinguish between Pre and Post groups - 
GrpLevel <- c("Post", "Pre")
Join_PerCompAbilSc$Group <- factor(Join_PerCompAbilSc$Group, levels=GrpLevel, ordered = TRUE)
Join_CompUndSc$Group <- factor(Join_CompUndSc$Group, levels=GrpLevel, ordered = TRUE)
Join_CodeAbilSc1$Group <- factor(Join_CodeAbilSc1$Group, levels=GrpLevel, ordered = TRUE)
Join_CodeAbilSc2$Group <- factor(Join_CodeAbilSc2$Group, levels=GrpLevel, ordered = TRUE)
Join_ComfCompTask$Group <- factor(Join_ComfCompTask$Group, levels=GrpLevel, ordered = TRUE)

#Create df without the group var for plotting. 
WOG_Join_PerCompAb <- select(Join_PerCompAbilSc, everything()) %>% 
  select(-starts_with("Group"))  
WOG_Join_CompUnd <- select(Join_CompUndSc, everything()) %>% 
  select(-starts_with("Group"))  
WOG_Join_CodeAbil1 <- select(Join_CodeAbilSc1, everything()) %>% 
  select(-starts_with("Group"))  
WOG_Join_CodeAbil2 <- select(Join_CodeAbilSc2, everything()) %>% 
  select(-starts_with("Group"))  
WOG_Join_ComfComp <- select(Join_ComfCompTask, everything()) %>% 
  select(-starts_with("Group"))  


#Setup Likert Plots by group with renaming  
PerCompTitle <- "2016 Edamame Perceived Computational Ability Scale"
PerCompAbilScLik <- likert(WOG_Join_PerCompAb, grouping = Join_PerCompAbilSc$Group)

CompUndTitle <- "2016 Edamame Computational Understanding Scale"
CompUndLik <- likert(WOG_Join_CompUnd, grouping = Join_CompUndSc$Group)

CodeAbilTitle1 <- "2016 Edamame Coding Ability Scale, Chart 1"
CodeAbilLik1 <- likert(WOG_Join_CodeAbil1, grouping = Join_CodeAbilSc1$Group)

CodeAbilTitle2 <- "2016 Edamame Coding Ability Scale, Chart 2"
CodeAbilLik2 <- likert(WOG_Join_CodeAbil2, grouping = Join_CodeAbilSc2$Group)

ComfCompTitle <- "2016 Edamame Comfort with Computational Tasks Scale"
ComfCompLik <- likert(WOG_Join_ComfComp, grouping = Join_ComfCompTask$Group)

#Colors! 
PurpleGreenFour <- c('#7b3294', '#c2a5cf', '#a6dba0', '#008837')
PurpleGreenFive <- c('#7b3294', '#c2a5cf', '#ffffbf', '#a6dba0', '#008837') 
PurpleGreenSix <- c('#762a83', '#af8dc3', '#e7d4e8', '#ffffbf', '#7fbf7b', '#1b7837')
PurpleGreenSeven <- c('#762a83', '#af8dc3', '#e7d4e8', '#ffffbf', '#d9f0d3', '#7fbf7b', '#1b7837')

# plotting ----------------------------------------------------------------


#Plotting 
pdf("PerCompAbilScLikert.pdf", width = 6, height = 9 )
plot(PerCompAbilScLik, colors=PurpleGreenFour) + ggtitle(PerCompTitle)
dev.off()

pdf("CompUndLikert.pdf", width = 6, height = 9 )
plot(CompUndLik, colors=PurpleGreenFour) + ggtitle(CompUndTitle)
dev.off()

pdf("CodeAbilLikert1.pdf", width = 6, height = 9 )
plot(CodeAbilLik1, colors=PurpleGreenFour) + ggtitle(CodeAbilTitle1)
dev.off()

pdf("CodeAbilLikert2.pdf", width = 6, height = 9 )
plot(CodeAbilLik2, colors=PurpleGreenFour) + ggtitle(CodeAbilTitle2)
dev.off()

pdf("ComfComLikert.pdf", width = 6, height = 10)
plot(ComfCompLik, 
     center = 3.5,
     plot.percent.neutral = FALSE,
     colors = PurpleGreenFive) +
  guides(keywidth = 30) +
  ggtitle(ComfCompTitle)
dev.off()