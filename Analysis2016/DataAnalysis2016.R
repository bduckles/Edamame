#Factor Levels for a group of variables within a dataset and then plot to likert with factor 
#levels set to the same number. 

source("Analysis2016/DataReadin_16.R")

# Factor Levels -----------------------------------------------------------

##Factor levels for each question type 
abilitylevel <- c("No Ability", "Low Ability", "Intermediate Ability","High Ability")
agreelevel <- c("Strongly Disagree", "Disagree", "Agree","Strongly Agree")
comflevel <- c("I do not know what this is.", "Very Uncomfortable", "Uncomfortable", "Comfortable","Very Comfortable")

# Function to factor columns and make them all the same size.
factfunc <- function(mydata, factlevel){
  factor(mydata, 
         levels=factlevel, 
         ordered=TRUE, 
         exclude = NA)
  fct_unify(mydata,
            levels=factlevel)
}


# Data Groupings ----------------------------------------------------------
#Load question data groupings
source("AnalyzeData/DataGroupings.R")

#Factor Functions and make them all the same size (use factfunc)
AllPost_PerCompAbilSc <- factfunc(AllPost_PerCompAbilSc, abilitylevel) %>% as.data.frame()
AllPre_PerCompAbilSc <- factfunc(AllPre_PerCompAbilSc, abilitylevel) %>% as.data.frame()

AllPost_CompUndSc <- factfunc(AllPost_CompUndSc, agreelevel) %>% as.data.frame()
AllPre_CompUndSc <- factfunc(AllPre_CompUndSc, agreelevel) %>% as.data.frame()

AllPost_CodeAbilSc1 <- factfunc(AllPost_CodeAbilSc1, agreelevel) %>% as.data.frame()
AllPre_CodeAbilSc1 <- factfunc(AllPre_CodeAbilSc1, agreelevel) %>% as.data.frame()

AllPost_CodeAbilSc2 <- factfunc(AllPost_CodeAbilSc2, agreelevel) %>% as.data.frame()
AllPre_CodeAbilSc2 <- factfunc(AllPre_CodeAbilSc2, agreelevel) %>% as.data.frame()

AllPost_ComfCompTask <- factfunc(AllPost_ComfCompTask, comflevel) %>% as.data.frame()
AllPre_ComfCompTask <- factfunc(AllPre_ComfCompTask, comflevel) %>% as.data.frame()

#Add a group variable so that when joined can sort between Pre and post as well as an ID variable
AllPost_PerCompAbilSc <- mutate(AllPost_PerCompAbilSc, 
              Group = rep("Post", nrow(AllPost_PerCompAbilSc)),
              ID = rownames(AllPost_PerCompAbilSc))
AllPre_PerCompAbilSc <- mutate(AllPre_PerCompAbilSc, 
              Group = rep("Pre", nrow(AllPre_PerCompAbilSc)),
              ID = rownames(AllPre_PerCompAbilSc))

AllPost_CompUndSc <- mutate(AllPost_CompUndSc, 
              Group = rep("Post", nrow(AllPost_CompUndSc)),
            ID = rownames(AllPost_CompUndSc))
AllPre_CompUndSc <- mutate(AllPre_CompUndSc, 
              Group = rep("Pre", nrow(AllPre_CompUndSc)), 
              ID = rownames(AllPre_CompUndSc))

AllPost_CodeAbilSc1 <- mutate(AllPost_CodeAbilSc1, 
              Group = rep("Post", nrow(AllPost_CodeAbilSc1)), 
              ID = rownames(AllPost_CodeAbilSc1))
AllPre_CodeAbilSc1 <- mutate(AllPre_CodeAbilSc1, 
              Group = rep("Pre", nrow(AllPre_CodeAbilSc1)), 
              ID = rownames(AllPre_CodeAbilSc1))

AllPost_CodeAbilSc2 <- mutate(AllPost_CodeAbilSc2, 
                             Group = rep("Post", nrow(AllPost_CodeAbilSc2)), 
                             ID = rownames(AllPost_CodeAbilSc2))
AllPre_CodeAbilSc2 <- mutate(AllPre_CodeAbilSc2, 
                            Group = rep("Pre", nrow(AllPre_CodeAbilSc2)), 
                            ID = rownames(AllPre_CodeAbilSc2))

AllPost_ComfCompTask <- mutate(AllPost_ComfCompTask, 
              Group = rep("Post", nrow(AllPost_ComfCompTask)), 
              ID = rownames(AllPost_ComfCompTask))
AllPre_ComfCompTask <- mutate(AllPre_ComfCompTask, 
              Group = rep("Pre", nrow(AllPre_ComfCompTask)), 
              ID = rownames(AllPre_ComfCompTask))

#Do the Joins between pre and post! 
Join_PerCompAbilSc <- full_join(AllPost_PerCompAbilSc, AllPre_PerCompAbilSc)
Join_CompUndSc <- full_join(AllPost_CompUndSc, AllPre_CompUndSc)
Join_CodeAbilSc1 <- full_join(AllPost_CodeAbilSc1, AllPre_CodeAbilSc1)
Join_CodeAbilSc2 <- full_join(AllPost_CodeAbilSc2, AllPre_CodeAbilSc2)
Join_ComfCompTask <- full_join(AllPost_ComfCompTask, AllPre_ComfCompTask)

#Melt the datasets
Mlt_PerCompAbSc <- melt(Join_PerCompAbilSc, id =c("Group", "ID"))
Mlt_CompUndSc <- melt(Join_CompUndSc, id =c("Group", "ID"))
Mlt_CodeAbilSc1 <- melt(Join_CodeAbilSc1, id =c("Group", "ID"))
Mlt_CodeAbilSc2 <- melt(Join_CodeAbilSc2, id =c("Group", "ID"))
Mlt_ComfCompTask <- melt(Join_ComfCompTask, id =c("Group", "ID"))

#REdo the factoring (maybe don't do earlier factoring? not sure)
GrpLevel <- c("Post", "Pre")

Mlt_PerCompAbSc <- factfunc(Mlt_PerCompAbilSc$Group, abilitylevel) %>% as.data.frame()


#Add Scalar variable to each then combine 
Mlt_PerCompAbSc <- mutate(Mlt_PerCompAbSc, 
                              Scalar = rep("PerCompAbilSc", nrow(Mlt_PerCompAbSc)))
Mlt_CompUndSc <- mutate(Mlt_CompUndSc, 
                             Scalar = rep("CompUndSc", nrow(Mlt_CompUndSc)))
Mlt_CodeAbilSc1 <- mutate(Mlt_CodeAbilSc1, 
                             Scalar = rep("CodeAbilSc1", nrow(Mlt_CodeAbilSc1)))
Mlt_CodeAbilSc2 <- mutate(Mlt_CodeAbilSc2, 
                             Scalar = rep("CodeAbilSc2", nrow(Mlt_CodeAbilSc2)))
Mlt_ComfCompTask <- mutate(Mlt_ComfCompTask, 
                             Scalar = rep("ComfCompTask", nrow(Mlt_ComfCompTask)))



# Plotting ----------------------------------------------------------------



PerComp <- likert(Mlt_PerCompAbSc, grouping = Mlt_PerCompAbSc$Group)
plot(PerComp)

AllData <- rbind(Mlt_PerCompAbSc, Mlt_CompUndSc, Mlt_CodeAbilSc1, Mlt_CodeAbilSc2, Mlt_ComfCompTask)
library(reshape2)
AllCastData <- dcast(AllData, Scalar + Group ~ value)

## Overall Likert Visual
OverallLik <- likert(AllCastData)
plot(OverallLik)

#Rename variables back to question names 
source("AnalyzeData/rename.R")

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