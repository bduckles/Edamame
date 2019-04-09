#EdamameScript 

setwd("/Users/Anaya/Dropbox/**EDAMAME")
library(tidyr)
library(likert)
library(ggplot2)
library(dplyr)
library(tidyverse)
library(likert)

Post16 <- read.csv("Data/EDAMAME_2016_POST_SURVEY_ColName.csv", 
                   stringsAsFactors = TRUE)

##Pre16 <- read.csv("Data/EDAMAME_2016_PRE_SURVEY.csv", 
##                  stringsAsFactors = TRUE)


##Set the factor levels for ability questions 
abilitylevel <- c("No Ability", "Low Ability", "Intermediate Ability","High Ability")

#For each variable with these answers, change the factor ordering to abilitylevel
Post16$Navterm <- factor(Post16$Navterm, levels = abilitylevel, ordered=TRUE)
Post16$PythonScript <- factor(Post16$PythonScript, levels = abilitylevel, ordered=TRUE)
Post16$AmazonE2 <- factor(Post16$AmazonE2, levels = abilitylevel, ordered=TRUE)
Post16$InstallMothur <- factor(Post16$InstallMothur, levels = abilitylevel, ordered=TRUE)
Post16$RunQIIME <- factor(Post16$RunQIIME, levels = abilitylevel, ordered=TRUE)
Post16$ExecRScript <- factor(Post16$ExecRScript, levels = abilitylevel, ordered=TRUE)
Post16$ChooseEcoStat <- factor(Post16$ChooseEcoStat, levels = abilitylevel, ordered=TRUE)
Post16$InstallAmazonE2<- factor(Post16$InstallAmazonE2, levels = abilitylevel, ordered=TRUE)
Post16$AssembleMeta <- factor(Post16$AssembleMeta, levels = abilitylevel, ordered=TRUE)
Post16$UseGithub <- factor(Post16$UseGithub, levels = abilitylevel, ordered=TRUE)
Post16$DevWorkflow <- factor(Post16$DevWorkflow, levels = abilitylevel, ordered=TRUE)
Post16$RunBLAST <- factor(Post16$RunBLAST, levels = abilitylevel, ordered=TRUE)
Post16$UseMGRAST <- factor(Post16$UseMGRAST, levels = abilitylevel, ordered=TRUE)
Post16$UseAPI <- factor(Post16$UseAPI, levels = abilitylevel, ordered=TRUE)

#Create data frame with only ability questions 
ability_Qs <- select(Post16, 
                     Navterm, PythonScript, AmazonE2, InstallMothur, RunQIIME, 
                     ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta, 
                     UseGithub, DevWorkflow, RunBLAST, UseMGRAST, UseAPI) %>%
            as.data.frame()


#lik + scale_fill_manual(values = c("red", "pink", "grey", "light green" , "seagreen3"))

#Plot Agree questions with Likert
lik <- likert(ability_Qs)
plot(lik)
plot(lik, wrap=30, ordered=TRUE)

##Set the factor levels for agree questions 
agreelevel <- c("Strongly Disagree", "Disagree", "Agree","Strongly Agree")

#Change Factor Ordering for each agree variable 
Post16$UnderstandCD <- factor(Post16$UnderstandCD, levels = agreelevel, ordered=TRUE)
Post16$UnderstandPY <- factor(Post16$UnderstandPY, levels = agreelevel, ordered=TRUE)
Post16$IlluminaData <- factor(Post16$IlluminaData, levels = agreelevel, ordered=TRUE)
Post16$SumSequence <- factor(Post16$SumSequence, levels = agreelevel, ordered=TRUE)
Post16$RunR <- factor(Post16$RunR, levels = agreelevel, ordered=TRUE)
Post16$QIIMEvsMothur <- factor(Post16$QIIMEvsMothur, levels = agreelevel, ordered=TRUE)
Post16$TwoMicrobial <- factor(Post16$TwoMicrobial, levels = agreelevel, ordered=TRUE)
Post16$CDpkg <- factor(Post16$CDpkg, levels = agreelevel, ordered=TRUE)
Post16$StructureOTU <- factor(Post16$StructureOTU, levels = agreelevel, ordered=TRUE)
Post16$KnowKMER <- factor(Post16$KnowKMER, levels = agreelevel, ordered=TRUE)
Post16$KnowContig <- factor(Post16$KnowContig, levels = agreelevel, ordered=TRUE)
Post16$KnowEC2 <- factor(Post16$KnowEC2, levels = agreelevel, ordered=TRUE)
Post16$KnowWithinsample <- factor(Post16$KnowWithinsample, levels = agreelevel, ordered=TRUE)
Post16$KnowMetadata <- factor(Post16$KnowMetadata, levels = agreelevel, ordered=TRUE)
Post16$KnowMetagenomeBin <- factor(Post16$KnowMetagenomeBin, levels = agreelevel, ordered=TRUE)
Post16$KnowShotgun <- factor(Post16$KnowShotgun, levels = agreelevel, ordered=TRUE)
Post16$KnowHPCC <- factor(Post16$KnowHPCC, levels = agreelevel, ordered=TRUE)
Post16$KnowMetavsAssem <- factor(Post16$KnowMetavsAssem, levels = agreelevel, ordered=TRUE)
Post16$ExecuteShotgun <- factor(Post16$ExecuteShotgun, levels = agreelevel, ordered=TRUE)
Post16$ExecuteAmplicon <- factor(Post16$ExecuteAmplicon, levels = agreelevel, ordered=TRUE)
Post16$InformedAmpliconQiime <- factor(Post16$InformedAmpliconQiime, levels = agreelevel, ordered=TRUE)
Post16$InformedAmpliconMothur <- factor(Post16$InformedAmpliconMothur, levels = agreelevel, ordered=TRUE)
Post16$DiffAssembledMetagenomic<- factor(Post16$DiffAssembledMetagenomic, levels = agreelevel, ordered=TRUE)
Post16$LimitationsMetagenomic <- factor(Post16$LimitationsMetagenomic, levels = agreelevel, ordered=TRUE)
Post16$AdvantageDisadvMetagemonic <- factor(Post16$AdvantageDisadvMetagemonic, levels = agreelevel, ordered=TRUE)
Post16$UnderstandKmer <- factor(Post16$UnderstandKmer, levels = agreelevel, ordered=TRUE)
Post16$QualShotgun <- factor(Post16$QualShotgun, levels = agreelevel, ordered=TRUE)
Post16$RpgkAnalyzeData <- factor(Post16$RpgkAnalyzeData, levels = agreelevel, ordered=TRUE)
Post16$MoveDataIntoR <- factor(Post16$MoveDataIntoR, levels = agreelevel, ordered=TRUE)
Post16$MoveFilesTerminal <- factor(Post16$MoveFilesTerminal, levels = agreelevel, ordered=TRUE)
Post16$EvalRawSequence <- factor(Post16$EvalRawSequence, levels = agreelevel, ordered=TRUE)
Post16$SearchPublicDatasets <- factor(Post16$SearchPublicDatasets, levels = agreelevel, ordered=TRUE)

Post16$CannotShotgunWOHelp <- factor(Post16$CannotShotgunWOHelp, levels = agreelevel, ordered=TRUE)
Post16$CannotAmpliconWOHelp <- factor(Post16$CannotAmpliconWOHelp, levels = agreelevel, ordered=TRUE)
Post16$CanCompleteLotofTime <- factor(Post16$CanCompleteLotofTime, levels = agreelevel, ordered=TRUE)
Post16$CanOvercomeifStuck <- factor(Post16$CanOvercomeifStuck, levels = agreelevel, ordered=TRUE)
Post16$CannotWOHelp <- factor(Post16$CannotWOHelp, levels = agreelevel, ordered=TRUE)

Post16$MinimizeLimitationsSequencing <- factor(Post16$MinimizeLimitationsSequencing, levels = agreelevel, ordered=TRUE)
Post16$UnderstandTechLimitations<- factor(Post16$UnderstandTechLimitations, levels = agreelevel, ordered=TRUE)
Post16$UnderstandMGRAST <- factor(Post16$UnderstandMGRAST, levels = agreelevel, ordered=TRUE)
Post16$UseGit <- factor(Post16$UseGit, levels = agreelevel, ordered=TRUE)

#Create data frame with agree questions 
agree_Qs1 <- select(Post16, 
                    UnderstandCD, UnderstandPY, IlluminaData, SumSequence, RunR, QIIMEvsMothur, 
                    TwoMicrobial, CDpkg, StructureOTU, KnowKMER, KnowContig, KnowEC2, KnowWithinsample, 
                    KnowMetadata, KnowShotgun, KnowMetagenomeBin, KnowHPCC, KnowMetavsAssem,  
                    ExecuteShotgun, ExecuteAmplicon, InformedAmpliconQiime, InformedAmpliconQiime, 
                    DiffAssembledMetagenomic, LimitationsMetagenomic, AdvantageDisadvMetagemonic, 
                    UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, 
                    EvalRawSequence, SearchPublicDatasets, MinimizeLimitationsSequencing, 
                    UnderstandTechLimitations, UnderstandMGRAST, UseGit
                    ) %>%
      as.data.frame()

agree_Qs2 <- select(Post16,
                    CannotShotgunWOHelp, CannotAmpliconWOHelp, CanCompleteLotofTime, CanOvercomeifStuck, 
                    CannotWOHelp
                    ) %>%
      as.data.frame()

#Rename the variables to give the full questions on the chart. 
names(agree_Qs2) <- c(
  CannotShotgunWOHelp="I cannot use Shotgun without help.",
  CannotAmpliconWOHelp="I cannot use Amplicon without help.",
  CanCompleteLotofTime="I can complete a task with lots of time.",
  CanOvercomeifStuck="I can overcome challenges if stuck.", 
  CannotWOHelp="I cannot overcome challenges without help. ")

lik1 <- likert(agree_Qs1)
plot(lik1, wrap=30, centered=FALSE, ordered=TRUE)

lik2 <- likert(agree_Qs2)
plot(lik2, wrap=30, ordered=TRUE)


##Set the factor levels for comfort questions 
comflevel <- c("Uncomfortable", "Comfortable","Very Comfortable")

#Change Factor Ordering for each agree variable 
Post16$NavUnix <- factor(Post16$NavUnix, levels = comflevel, ordered=TRUE)
Post16$MakeE2Key <- factor(Post16$MakeE2Key, levels = comflevel, ordered=TRUE)
Post16$InstallAuxSoftware <- factor(Post16$InstallAuxSoftware, levels = comflevel, ordered=TRUE)
Post16$UseFastQC <- factor(Post16$UseFastQC, levels = comflevel, ordered=TRUE)
Post16$SumInfoSequenceFiles <- factor(Post16$SumInfoSequenceFiles, levels = comflevel, ordered=TRUE)
Post16$CalcOTU <- factor(Post16$CalcOTU, levels = comflevel, ordered=TRUE)
#TrimSeqError has a fourth factor level "I don't know what this is." 
#Post16$TrimSeqErrors <- factor(Post16$TrimSeqErrors, levels = comflevel, ordered=TRUE)
Post16$AssembleMetagenome <- factor(Post16$AssembleMetagenome, levels = comflevel, ordered=TRUE)
Post16$BinMetagenome <- factor(Post16$BinMetagenome, levels = comflevel, ordered=TRUE)
Post16$DiffDataModels <- factor(Post16$DiffDataModels, levels = comflevel, ordered=TRUE)
Post16$TestHypotheses <- factor(Post16$TestHypotheses, levels = comflevel, ordered=TRUE)
Post16$IDPublicSequenceData <- factor(Post16$IDPublicSequenceData, levels = comflevel, ordered=TRUE)

comf_Qs <- select(Post16, 
                  NavUnix, MakeE2Key, InstallAuxSoftware, UseFastQC, SumInfoSequenceFiles, 
                  CalcOTU, AssembleMetagenome, BinMetagenome, DiffDataModels,
                  TestHypotheses, IDPublicSequenceData) %>% 
        as.data.frame()

lik4 <- likert(comf_Qs)
plot(lik4, wrap=30, centered=FALSE, ordered=TRUE)

#Five Factor Comfort Q 
comflevelfive <- c("I do not know what this is.", "Very Uncomfortable", "Uncomfortable", 
                   "Comfortable", "Very Comfortable")
Post16$ObtainSeqfromMGRAST <- factor(Post16$ObtainSeqfromMGRAST, levels = comflevelfive, ordered=TRUE)

comfQ <- select(Post16, 
                ObtainSeqfromMGRAST) %>%
          as.data.frame()

lik5 <- likert(comfQ)
plot(lik5)
