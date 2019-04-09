#2018 Likert Charts 
#In this one I play around with how to do this with loops/fucntions 
#Take data from readin and create likert charts 

#Read in the data and the factors
source("Analysis2017_18/DataReadin_18.R") 
source("Analysis2017_18/edamfunc.R") 

#Call in the 18 Data Groupings (if not already done)
source("Analysis2017_18/DataGroupings18.R") 


# Factfunc/NameID ---------------------------------------------------------

#Use the Factor Function (factfunc) from edamfunc and make the data all the same size 

abilDF <- list(PerCompAbilSc_Post, PerCompAbilSc_Pre)
agreeDF <- list(CodeAbilSc1_Post, CodeAbilSc1_Pre, CodeAbilSc2_Post, CodeAbilSc2_Pre)
comfDF <- list(ComfCompTask_Post, ComfCompTask_Pre)

usefactfunc <- function(dflist, level) {
    dflist <- factfunc(dflist, level) %>% 
      as.data.frame()
}

lapply(abilDF, usefactfunc, abilitylevel)


PerCompAbilSc_Post <- factfunc(PerCompAbilSc_Post, abilitylevel) %>% as.data.frame()
PerCompAbilSc_Pre <- factfunc(PerCompAbilSc_Pre, abilitylevel) %>% as.data.frame()

CompUndSc_Post <- factfunc(CompUndSc_Post, agreelevel) %>% as.data.frame()
CompUndSc_Pre <- factfunc(CompUndSc_Pre, agreelevel) %>% as.data.frame()

CodeAbilSc1_Post <- factfunc(CodeAbilSc1_Post, agreelevel) %>% as.data.frame()
CodeAbilSc1_Pre <- factfunc(CodeAbilSc1_Pre, agreelevel) %>% as.data.frame()

CodeAbilSc2_Post <- factfunc(CodeAbilSc2_Post, agreelevel) %>% as.data.frame()
CodeAbilSc2_Pre <- factfunc(CodeAbilSc2_Pre, agreelevel) %>% as.data.frame()

ComfCompTask_Post <- factfunc(ComfCompTask_Post, comflevel) %>% as.data.frame()
ComfCompTask_Pre <- factfunc(ComfCompTask_Pre, comflevel) %>% as.data.frame()

#Run NameID on all of these 
PerCompAbilSc_Post <- nameID(PerCompAbilSc_Post, "Post")
PerCompAbilSc_Pre <- nameID(PerCompAbilSc_Pre, "Pre")

CompUndSc_Post <- nameID(CompUndSc_Post, "Post")
CompUndSc_Pre <- nameID(CompUndSc_Pre, "Pre")

CodeAbilSc1_Post <-  nameID(CodeAbilSc1_Post, "Post")
CodeAbilSc1_Pre <-  nameID(CodeAbilSc1_Pre, "Pre")

CodeAbilSc2_Post <- nameID(CodeAbilSc2_Post, "Post")
CodeAbilSc2_Pre <- nameID(CodeAbilSc2_Pre, "Pre")

ComfCompTask_Post <- nameID(ComfCompTask_Post, "Post")
ComfCompTask_Pre <- nameID(ComfCompTask_Pre, "Pre")


# Joins -------------------------------------------------------------------

J_PerCompAbilSc <- full_join(PerCompAbilSc_Post, PerCompAbilSc_Pre)
J_CompUndSc <- full_join(CompUndSc_Post, CompUndSc_Pre)
J_CodeAbilSc1 <- full_join(CodeAbilSc1_Post, CodeAbilSc1_Pre)
J_CodeAbilSc2 <- full_join(CodeAbilSc2_Post, CodeAbilSc2_Pre)
J_ComfCompTask <- full_join(ComfCompTask_Post, ComfCompTask_Pre)

#Rename variables back to question names 
source("Analysis2017_18/rename18.R")

# Datafor Likerts -------------------------------------------------------------
#Factor the group level. 
GrpLevel <- c("Post", "Pre")
J_PerCompAbilSc$Group <- factor(J_PerCompAbilSc$Group, levels=GrpLevel, ordered = TRUE)
J_CompUndSc$Group <- factor(J_CompUndSc$Group, levels=GrpLevel, ordered = TRUE)
J_CodeAbilSc1$Group <- factor(J_CodeAbilSc1$Group, levels=GrpLevel, ordered = TRUE)
J_CodeAbilSc2$Group <- factor(J_CodeAbilSc2$Group, levels=GrpLevel, ordered = TRUE)
J_ComfCompTask$Group <- factor(J_ComfCompTask$Group, levels=GrpLevel, ordered = TRUE)

#Create df without the group var for plotting. 
WOG_PerCompAb <- select(J_PerCompAbilSc, everything()) %>% 
  select(-starts_with("Group")) 
WOG_CompUndSc <- select(J_CompUndSc, everything()) %>% 
  select(-starts_with("Group")) 
WOG_CodeAbilSc1 <- select(J_CodeAbilSc1, everything()) %>% 
  select(-starts_with("Group")) 
WOG_CodeAbilSc2 <- select(J_CodeAbilSc2, everything()) %>% 
  select(-starts_with("Group")) 
WOG_ComfCompTask <- select(J_ComfCompTask, everything()) %>% 
  select(-starts_with("Group")) 

#Titles and Likerts
PerCompTitle <- "2018 Edamame Perceived Computational Ability Scale"
PerCompAbilScLik <- likert(WOG_PerCompAb, grouping = J_PerCompAbilSc$Group)

CompUndTitle <- "2018 Edamame Computational Understanding Scale"
CompUndLik <- likert(WOG_CompUndSc, grouping = J_CompUndSc$Group)

CodeAbilTitle1 <- "2018 Edamame Coding Ability Scale, Chart 1"
CodeAbilLik1 <- likert(WOG_CodeAbilSc1, grouping = J_CodeAbilSc1$Group)

CodeAbilTitle2 <- "2018 Edamame Coding Ability Scale, Chart 2"
CodeAbilLik2 <- likert(WOG_CodeAbilSc2, grouping = J_CodeAbilSc2$Group)

ComfCompTitle <- "2018 Edamame Comfort with Computational Tasks Scale"
ComfCompLik <- likert(WOG_ComfCompTask, grouping = J_ComfCompTask$Group)



# Plotting ----------------------------------------------------------------



pdf("Charts/PerCompAbilScLikert18.pdf", width = 6, height = 10 )
plot(PerCompAbilScLik, 
     center = 3.5,
     plot.percent.neutral = FALSE,
     colors=PurpleGreenFive) + ggtitle(PerCompTitle)
dev.off()

pdf("Charts/CompUndLikert18.pdf", width = 6, height = 12)
plot(CompUndLik, colors=PurpleGreenFour) + ggtitle(CompUndTitle)
dev.off()

pdf("Charts/CodeAbilLikert1_18.pdf", width = 6, height = 11 )
plot(CodeAbilLik1, colors=PurpleGreenFour) + ggtitle(CodeAbilTitle1)
dev.off()

pdf("Charts/CodeAbilLikert2_18.pdf", width = 6, height = 10 )
plot(CodeAbilLik2, colors=PurpleGreenFour) + ggtitle(CodeAbilTitle2)
dev.off()

pdf("Charts/ComfComLikert18.pdf", width = 6, height = 10)
plot(ComfCompLik, 
     center = 3.5,
     plot.percent.neutral = FALSE,
     colors = PurpleGreenFive) +
  guides(keywidth = 30) +
  ggtitle(ComfCompTitle) 

dev.off()