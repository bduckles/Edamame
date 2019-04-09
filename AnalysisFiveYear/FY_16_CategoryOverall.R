#Five Year Groupings - Set up 2016
# This omits anything variable was not in all five years. 
## Post and Pre Groupings for All Five Years 

##Group 1 - Perceptual Computational Ability  and Post (Ability Scale)

FY_Pre16_PCAS <- select(Pre16, 
                        Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta, RunBLAST) %>%
  na.omit() %>% 
  gather()  

FY_Pre16_PCAS <- FY_Pre16_PCAS %>%
  mutate(Year = rep("2016", nrow(FY_Pre16_PCAS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre16_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Pre16_PCAS))) %>% 
  select(-key)

FY_Post16_PCAS <- select(Post16,
                         Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta, RunBLAST) %>% 
  na.omit %>% 
  gather()

FY_Post16_PCAS <- FY_Post16_PCAS %>%
  mutate(Year = rep("2016", nrow(FY_Post16_PCAS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post16_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Post16_PCAS))) %>% 
  select(-key)

FY16_PCAS <- full_join(FY_Post16_PCAS, FY_Pre16_PCAS)

#Group 2 - Computational Understanding Scale and Post (Agree Scale)
FY_Pre16_CUS  <- select(Pre16, 
                        UnderstandCD, IlluminaData, SumSequence, RunR, TwoMicrobial, CDpkg,StructureOTU, KnowKMER, KnowContig, KnowEC2, KnowMetadata) %>% 
  gather()

FY_Pre16_CUS <- FY_Pre16_CUS %>%
  mutate(Year = rep("2016", nrow(FY_Pre16_CUS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre16_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Pre16_CUS))) %>% 
  select(-key)

FY_Post16_CUS  <- select(Post16, 
                         UnderstandCD, IlluminaData, SumSequence, RunR, TwoMicrobial, CDpkg,StructureOTU, KnowKMER, KnowContig, KnowEC2, KnowMetadata) %>% 
  gather()

FY_Post16_CUS <- FY_Post16_CUS %>%
  mutate(Year = rep("2016", nrow(FY_Post16_CUS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post16_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Post16_CUS))) %>% 
  select(-key)

FY16_CUS <- full_join(FY_Post16_CUS, FY_Pre16_CUS)

#Group 3 - Coding Ability Scale  and post in two chunks (Agree Scale)
FY_Pre16_CABS <- select(Pre16, 
                        ExecuteAmplicon, InformedAmpliconMothur, LimitationsMetagenomic, UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, SearchPublicDatasets, CannotShotgunWOHelp, KnowShotgun, ExecuteShotgun, CannotAmpliconWOHelp, CanCompleteLotofTime, CanCompleteMentor, CanOvercomeifStuck, CannotWOHelp, MinimizeLimitationsSequencing, UnderstandTechLimitations) %>% 
  gather()

FY_Pre16_CABS <- FY_Pre16_CABS %>%
  mutate(Year = rep("2016", nrow(FY_Pre16_CABS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre16_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Pre16_CABS))) %>% 
  select(-key)

FY_Post16_CABS <- select(Post16,                            
                         ExecuteAmplicon, InformedAmpliconMothur, LimitationsMetagenomic, UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, SearchPublicDatasets, CannotShotgunWOHelp, KnowShotgun, ExecuteShotgun, CannotAmpliconWOHelp, CanCompleteLotofTime, CanCompleteMentor, CanOvercomeifStuck, CannotWOHelp, MinimizeLimitationsSequencing, UnderstandTechLimitations) %>% 
  gather()

FY_Post16_CABS <- FY_Post16_CABS %>%
  mutate(Year = rep("2016", nrow(FY_Post16_CABS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post16_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Post16_CABS))) %>% 
  select(-key)

FY16_CABS <- full_join(FY_Post16_CABS, FY_Pre16_CABS)


# Group 4 - Comfort Computational Tasks -  and post (Comfort Scale)
FY_Pre16_CCT <- select(Pre16, 
                       NavUnix, MakeE2Key, SumInfoSequenceFiles, CalcOTU, TrimSeqErrors, AssembleMetagenome, DiffDataModels,
                       TestHypotheses, IDPublicSequenceData) %>% 
  gather()

FY_Pre16_CCT <- FY_Pre16_CCT %>%
  mutate(Year = rep("2016", nrow(FY_Pre16_CCT))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre16_CCT))) %>% 
  mutate(Sc = rep("CCT", nrow(FY_Pre16_CCT))) %>% 
  select(-key)

FY_Post16_CCT <- select(Post16, 
                        NavUnix, MakeE2Key, SumInfoSequenceFiles, CalcOTU, TrimSeqErrors, AssembleMetagenome, DiffDataModels, TestHypotheses, IDPublicSequenceData) %>% 
  gather()

FY_Post16_CCT <- FY_Post16_CCT %>%
  mutate(Year = rep("2016", nrow(FY_Post16_CCT))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post16_CCT))) %>% 
  mutate(Sc = rep("CCT", nrow(FY_Post16_CCT))) %>% 
  select(-key)

FY16_CCT <- full_join(FY_Post16_CCT, FY_Pre16_CCT)

# Group 5 - Overall Rating Scale - Post (Good Scale)

FY_Post16_Rate <- select(Post16, 
                         OverallWorkshop, OverallSpeaker, MeetNeeds) %>% 
  gather()

FY_Post16_Rate <- FY_Post16_Rate %>%
  mutate(Year = rep("2016", nrow(FY_Post16_Rate))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post16_Rate))) %>% 
  mutate(Sc = rep("OvRating", nrow(FY_Post16_Rate))) %>% 
  select(-key)

