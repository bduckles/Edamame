#DataLoadIn for Five Year Overall Charts   
#wd should be git/Edamame

# DataReadins -----------------------------------------------------------------
source("/Users/Anaya/git/Edamame/AnalysisFiveYear/DataReadin_14.R")
source("/Users/Anaya/git/Edamame/AnalysisFiveYear/DataReadin_15.R")
source("/Users/Anaya/git/Edamame/Analysis2016/DataReadin_16.R")
source("/Users/Anaya/git/Edamame/Analysis2017_18/DataReadin_17.R") 
source("/Users/Anaya/git/Edamame/Analysis2017_18/DataReadin_18.R") 

# Category Overall for each year ------------------------------------------

# Pull out what I need in each file 

source("/Users/Anaya/git/Edamame/AnalysisFiveYear/FY_18_CategoryOverall.R") 
source("/Users/Anaya/git/Edamame/AnalysisFiveYear/FY_17_CategoryOverall.R") 
source("/Users/Anaya/git/Edamame/AnalysisFiveYear/FY_16_CategoryOverall.R") 
source("/Users/Anaya/git/Edamame/AnalysisFiveYear/FY_15_CategoryOverall.R") 
source("/Users/Anaya/git/Edamame/AnalysisFiveYear/FY_14_CategoryOverall.R") 

rm(demog14, demog15)

# Multi Year Scales -------------------------------------------------------
# Four years - 2015-2018
#PercievedComputationalAbilities Scale 
FYDatNO1 <- full_join(FY14_PCAS, FY15_PCAS)
FYDatNO1 <- full_join(FYDatNO1, FY16_PCAS)
FYDatNO1 <- full_join(FYDatNO1, FY17_PCAS)
FYDat_PCAS <- full_join(FYDatNO1, FY18_PCAS)
rm(FYDatNO1)

#Coding Ability Scale Data 
FYDatNO2 <- full_join(FY14_CABS, FY15_CABS)
FYDatNO2 <- full_join(FYDatNO2, FY16_CABS)
FYDatNO2 <- full_join(FYDatNO2, FY17_CABS)
FYDat_CABS <- full_join(FYDatNO2, FY18_CABS)
rm(FYDatNO2)

#Comfort with Computational T Scale Data DOES NOT INCLUDE 2014 
FYDatNO3 <- full_join(FY15_CCT, FY16_CCT)
FYDatNO3 <- full_join(FYDatNO3, FY17_CCT)
FYDat_CCT <- full_join(FYDatNO3, FY18_CCT) 
rm(FYDatNO3)

#trouble with NAs? 
FYDat_CCT <- drop_na(FYDat_CCT)

#Compuatational Understanding Scale  
FYDatNO4 <- full_join(FY14_CUS, FY15_CUS)
FYDatNO4 <- full_join(FYDatNO4, FY16_CUS)
FYDatNO4 <- full_join(FYDatNO4, FY17_CUS)
FYDat_CUS <- full_join(FYDatNO4, FY18_CUS)
rm(FYDatNO4)

#Post Rating 
FYDatNO5 <- full_join(FY_Post14_Rate, FY_Post15_Rate)
FYDatNO5 <- full_join(FYDatNO5, FY_Post16_Rate)
FYDatNO5 <- full_join(FYDatNO5, FY_Post17_Rate)
FYDat_Rate <- full_join(FYDatNO5, FY_Post18_Rate)
rm(FYDatNO5)


# Likert Setup ------------------------------------------------------------
#Put in the functions I use in the past. 
source("Analysis2017_18/edamfunc.R") 
GrpLevel <- c("Post", "Pre")


# CodAbilityScale - CABS --------------------------------------------------
#Coding Ability Scale 
CABS <- FYDat_CABS %>% 
  select(value, Year, PrePost)
CABS$Year <- as.integer(CABS$Year)
CABS$value <- factor(CABS$value, 
                     levels=agreelevel, 
                     ordered = TRUE)
CABS$PrePost <- factor(CABS$PrePost, 
                       levels=GrpLevel,
                       ordered = TRUE)

CABS_WO <- CABS %>% 
  select(starts_with("value"))

CABSPlot <- likert(CABS_WO, 
                   grouping = CABS$PrePost)
CABTit <- "Coding Ability Pre and Post EDAMAME Workshop 2014 - 2018"
pdf("Charts/FiveYear/FY_CodingAbilSc14_18.pdf", width = 9, height = 4 )
plot(CABSPlot, 
     plot.percent.neutral = FALSE,
     colors=PurpleGreenFour) +
  ggtitle(CABTit)
dev.off()


# PerceptCompAbil - PCAS --------------------------------------------------


#Perception of Computational Ability 

PCAS <- FYDat_PCAS %>% 
  select(value, Year, PrePost)
PCAS$Year <- as.integer(PCAS$Year)
PCAS$value <- factor(PCAS$value, 
                     levels=abilitylevel, 
                     ordered = TRUE)
PCAS$PrePost <- factor(PCAS$PrePost, 
                       levels=GrpLevel,
                       ordered = TRUE)

PCAS_WO <- PCAS %>% 
  select(starts_with("value"))

PCASPlot <- likert(PCAS_WO, 
                   grouping = PCAS$PrePost)
PCASTit <- "Perception of Computational Ability Pre and Post EDAMAME Workshop 2014 - 2018"
pdf("Charts/FiveYear/FY_PerceptCompAbilSc14_18.pdf", width = 9, height = 4)
plot(PCASPlot, 
     center = 2.5,
     plot.percent.neutral = FALSE,
     colors=PurpleGreenFive) +
  ggtitle(PCASTit)
dev.off()


# Comp Understanding -CUS -------------------------------------------------


# Computational Understanding Scale 
CUS <- FYDat_CUS %>% 
  select(value, Year, PrePost)
CUS$Year <- as.integer(CUS$Year)
CUS$value <- factor(CUS$value, 
                     levels=agreelevel, 
                     ordered = TRUE)
CUS$PrePost <- factor(CUS$PrePost, 
                       levels=GrpLevel,
                       ordered = TRUE)
CUS_WO <- CUS %>% 
  select(starts_with("value"))

CUSPlot <- likert(CUS_WO, 
                   grouping = CUS$PrePost)
CUSTit <- "Computational Understanding Pre and Post EDAMAME Workshop 2014 - 2018"
pdf("Charts/FiveYear/FY_CompUnderstSc14_18_B.pdf", width = 9, height = 4)
plot(CUSPlot, 
     plot.percent.neutral = FALSE,
     colors=PurpleGreenFour) +
  ggtitle(CUSTit)
dev.off()

# ComfCompTasks - CCT -----------------------------------------------------

# Comfort with Computational Tasks 
CCT <- FYDat_CCT %>% 
  select(value, Year, PrePost) 

CCT$Year <- as.integer(CCT$Year)

CCT$value <- factor(CCT$value, 
                    levels=comflevel, 
                    ordered = TRUE) 

CCT$PrePost <- factor(CCT$PrePost, 
                      levels=GrpLevel,
                      ordered = TRUE)

#write_csv(CCT, "Charts/FiveYear/CCT_WTF.csv")
#write_csv(CCT_WO, "Charts/FiveYear/CCT_WO_WTF.csv")
CCT_WO <- CCT %>% 
  select(starts_with("value")) 

#what <- list(CCT$value, CCT_WO$value)
#fct_unify(what,  
#          levels=comflevel)

CCTPlot <- likert(as.data.frame(CCT_WO), 
                  grouping = CCT$PrePost)

CCTTit <- "Comfort with Computational Tasks Pre and Post EDAMAME Workshop 2015 - 2018"
pdf("Charts/FiveYear/FY_ComfCompTasks15_18.pdf", width = 9, height = 4)
plot(CCTPlot, 
     center = 3.5,
     plot.percent.neutral = FALSE,
     colors=PurpleGreenFive) +
  ggtitle(CCTTit)
dev.off()


# Overall -Rate -----------------------------------------------------------
Rate <- FYDat_Rate %>% 
  select(value, Year)
Rate$Year <- as.integer(Rate$Year)
Rate$value <- factor(Rate$value, 
                    levels=goodlevel, 
                    ordered = TRUE)
Rate_WO <- Rate %>% 
  select(starts_with("value"))

RatePlot <- likert(as.data.frame(Rate_WO))

RateTit <- "Overall Rating Post EDAMAME Workshop, 2014 - 2018"

pdf("Charts/FiveYear/FY_OvRating14_18.pdf", width = 9, height = 2)
plot(RatePlot, 
     center = 3.5,
     plot.percent.neutral = FALSE,
     colors=PurpleGreenFive) +
  ggtitle(RateTit)
dev.off()
