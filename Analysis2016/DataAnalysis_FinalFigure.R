#Data Analysis to stack into one final figure. 

library(tidyverse)
library(forcats)
library(likert)

setwd("/Users/Anaya/Dropbox/**EDAMAME")

# Data and Rename --------------------------------------------------------------------

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
source("AnalyzeData/Pre16ShortName.R") 
source("AnalyzeData/Post16ShortName.R") 
colnames(Post16) <- c(Post16shortname)
colnames(Pre16) <- c(Pre16shortname)


# Factor Levels----------------------------------------------------------------

##Factor levels for each question type 
abilitylevel <- c("No Ability", "Low Ability", "Intermediate Ability","High Ability")
agreelevel <- c("Strongly Disagree", "Disagree", "Agree","Strongly Agree")
comflevel <- c("I do not know what this is.", "Very Uncomfortable", "Uncomfortable", "Comfortable","Very Comfortable")

# Groups_Stacking -----------------------------------------------------------
#Load question data groupings

source("AnalyzeData/DataGroupings.R")


# DatastackFcn ------------------------------------------------------------

#Datastack function
bmd.datastack <- function(olddf, factlevel, valuecol = "Prevar", key = "Question") {
  quo_valuecol <- enquo(valuecol)
  olddf <- olddf %>% 
    gather(key = "Question", value = !!quo_valuecol ) %>%
    mutate("factorcol" = factor(!!quo_valuecol, 
                                level = factlevel, 
                                ordered = TRUE, 
                                exclude = NA)) %>% 
    select(factorcol)
  return(olddf)
}

#Pre_CAS1_Stk <- bmd.datastack(AllPre_CodeAbilSc1, agreelevel, PreCAS1) 
#Post_CAS1_Stk <- bmd.datastack(AllPost_CodeAbilSc1, agreelevel, PostCAS1)
#Pre_CAS2_Stk <- bmd.datastack(AllPre_CodeAbilSc2, agreelevel, PreCAS2) 
#Post_CAS2_Stk <- bmd.datastack(AllPost_CodeAbilSc2, agreelevel, PostCAS2)

Pre_CAS_Stk <- bmd.datastack(AllPre_CodeAbilSc_TOT, agreelevel, PreCAS) 
Post_CAS_Stk <- bmd.datastack(AllPost_CodeAbilSc_TOT, agreelevel, PostCAS)

Pre_CCT_Stk <- bmd.datastack(AllPre_ComfCompTask, comflevel, PreCCT) 
Post_CCT_Stk <- bmd.datastack(AllPost_ComfCompTask, comflevel, PostCCT)

Pre_CUS_Stk <- bmd.datastack(AllPre_CompUndSc, agreelevel, PreCCT) 
Post_CUS_Stk <- bmd.datastack(AllPost_CompUndSc, agreelevel, PostCCT)

Pre_PCAS_Stk <- bmd.datastack(AllPre_PerCompAbilSc, abilitylevel, PreCCT) 
Post_PCAS_Stk <- bmd.datastack(AllPost_PerCompAbilSc, abilitylevel, PostCCT)


# DataLabeling ------------------------------------------------------------

#Add NA's to the bottom of e so that the columns are equal. 
Post_CAS_Stk[nrow(Post_CAS_Stk)+208,] <- NA
Post_CCT_Stk[nrow(Post_CCT_Stk)+104,] <- NA
Post_CUS_Stk[nrow(Post_CUS_Stk)+112,] <- NA
Post_PCAS_Stk[nrow(Post_PCAS_Stk)+104,] <- NA

#Add ID columns, join, rename columns and get rid of id var. 
Pre_CAS_Stk$ID <- 1:nrow(Pre_CAS_Stk)
Post_CAS_Stk$ID <- 1:nrow(Post_CAS_Stk)
Tot_CAS <- full_join(Pre_CAS_Stk, Post_CAS_Stk, by = "ID")
colnames(Tot_CAS) <- c("Pre Workshop", "ID", "Post Workshop")
Tot_CAS <- Tot_CAS %>%
  select(-ID)

Pre_CCT_Stk$ID <- 1:nrow(Pre_CCT_Stk)
Post_CCT_Stk$ID <- 1:nrow(Post_CCT_Stk)
Tot_CCT <- full_join(Pre_CCT_Stk, Post_CCT_Stk, by = "ID")
colnames(Tot_CCT) <- c("Pre Workshop", "ID", "Post Workshop")
Tot_CCT <- Tot_CCT %>%
  select(-ID)

Pre_CUS_Stk$ID <- 1:nrow(Pre_CUS_Stk)
Post_CUS_Stk$ID <- 1:nrow(Post_CUS_Stk)
Tot_CUS <- full_join(Pre_CUS_Stk, Post_CUS_Stk, by = "ID")
colnames(Tot_CUS) <- c("Pre Workshop", "ID", "Post Workshop")
Tot_CUS <- Tot_CUS %>%
  select(-ID)

Pre_PCAS_Stk$ID <- 1:nrow(Pre_PCAS_Stk)
Post_PCAS_Stk$ID <- 1:nrow(Post_PCAS_Stk)
Tot_PCAS <- full_join(Pre_PCAS_Stk, Post_PCAS_Stk, by = "ID")
colnames(Tot_PCAS) <- c("Pre Workshop", "ID", "Post Workshop")
Tot_PCAS <- Tot_PCAS %>%
  select(-ID)

# ColorsPlotting ----------------------------------------------------------

##Colors! 
PurpleGreenFour <- c('#7b3294', '#c2a5cf', '#a6dba0', '#008837')
PurpleGreenFive <- c('#7b3294', '#c2a5cf', '#ffffbf', '#a6dba0', '#008837') 
PurpleGreenSix <- c('#762a83', '#af8dc3', '#e7d4e8', '#ffffbf', '#7fbf7b', '#1b7837')
PurpleGreenSeven <- c('#762a83', '#af8dc3', '#e7d4e8', '#ffffbf', '#d9f0d3', '#7fbf7b', '#1b7837')


#Plot 
ordering <- c("Pre Workshop", "Post Workshop")

CAS_Title <- "2016 Edamame Overall Coding Ability Scale"
CAS_Plot <- likert(Tot_CAS)
pdf(file = "OverallCompAbilSc.pdf", width = 7, height = 2)
plot(CAS_Plot, 
     group.order = ordering,
     colors=PurpleGreenFour) + ggtitle(CAS_Title)
dev.off()

CCT_Title <- "2016 Edamame Overall Comfort with Completing Task Scale"
CCT_Plot <- likert(Tot_CCT)
pdf("OverallComfCompletTaskSc.pdf", width = 7, height = 2)
plot(CCT_Plot,
     group.order = ordering,
     center = 3.5,
     plot.percent.neutral = FALSE,
     colors = PurpleGreenFive) +
      guides(keywidth = 35) + ggtitle(CCT_Title)
dev.off()

CUS_Title <- "2016 Edamame Overall Computational Understanding Scale"
CUS_Plot <- likert(Tot_CUS)
pdf("OverallCompUnderstSc.pdf", width = 7, height = 2)
plot(CUS_Plot, 
     group.order = ordering,
     colors=PurpleGreenFour) + ggtitle(CUS_Title)
dev.off()

PCAS_Title <- "2016 Edamame Overall Perceived Computational Ability Scale"
PCAS_Plot <- likert(Tot_PCAS)
pdf("OverallPercComAbilSc.pdf", width = 7, height = 2)
plot(PCAS_Plot, 
     group.order = ordering,
     colors=PurpleGreenFour) + ggtitle(PCAS_Title)
dev.off()





# Function to factor columns and make them all the same size.
#factfunc <- function(mydata, factlevel){
#  factor(mydata, 
#         levels=factlevel, 
#         ordered=TRUE, 
#         exclude = NA)
#  fct_unify(mydata,
#            levels=factlevel)
#}



# rbind with unequal column numbers ---------------------------------------

#rbind.match.row <- function(input1, input2) {
#  n.input1 <- nrow(input1)
#  n.input2 <- nrow(input2)
#    if (n.input2 < n.input1) {
#    n.diff1 <- nrow(n.input1) - nrow(n.input2)
#    n.input2 <- rep(NA, length(n.diff1))
#  } else {
#    n.diff2 <- nrow(n.input2) - nrow(n.input1)
#    n.input1 <- rep(NA, length(n.diff2))
#  }
#}
#f <- rbind.match.row(d, e)

