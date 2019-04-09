#Five Year Groupings - Set up 2017
# This omits anything variable was not in all five years. 
## Post and Pre Groupings for All Five Years 

##Group 1 - Perceptual Computational Ability  and Post (Ability Scale)

FY_Pre17_PCAS <- select(Pre17, 
                        Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta, RunBLAST) %>% 
  gather()

FY_Pre17_PCAS <- FY_Pre17_PCAS %>%
  mutate(Year = rep("2017", nrow(FY_Pre17_PCAS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre17_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Pre17_PCAS))) %>% 
  select(-key)

FY_Post17_PCAS <- select(Post17,
                         Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta, RunBLAST) %>% 
  gather()

FY_Post17_PCAS <- FY_Post17_PCAS %>%
  mutate(Year = rep("2017", nrow(FY_Post17_PCAS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post17_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Post17_PCAS))) %>% 
  select(-key)

FY17_PCAS <- full_join(FY_Post17_PCAS, FY_Pre17_PCAS)

#Group 2 - Computational Understanding Scale and Post (Agree Scale)
FY_Pre17_CUS  <- select(Pre17, 
                        UnderstandCD, IlluminaData, SumSequence, RunR, TwoMicrobial, CDpkg,StructureOTU, KnowKMER, KnowContig, KnowEC2, KnowMetadata) %>% 
  gather()

FY_Pre17_CUS <- FY_Pre17_CUS %>%
  mutate(Year = rep("2017", nrow(FY_Pre17_CUS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre17_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Pre17_CUS))) %>% 
  select(-key)

FY_Post17_CUS  <- select(Post17, 
                         UnderstandCD, IlluminaData, SumSequence, RunR, TwoMicrobial, CDpkg,StructureOTU, KnowKMER, KnowContig, KnowEC2, KnowMetadata) %>% 
  gather()

FY_Post17_CUS <- FY_Post17_CUS %>%
  mutate(Year = rep("2017", nrow(FY_Post17_CUS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post17_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Post17_CUS))) %>% 
  select(-key)

FY17_CUS <- full_join(FY_Post17_CUS, FY_Pre17_CUS)

#Group 3 - Coding Ability Scale  and post in two chunks (Agree Scale)
FY_Pre17_CABS <- select(Pre17, 
                        ExecuteAmplicon, InformedAmpliconMothur, LimitationsMetagenomic, UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, SearchPublicDatasets, CannotShotgunWOHelp, KnowShotgun, ExecuteShotgun, CannotAmpliconWOHelp, CanCompleteLotofTime, CanCompleteMentor, CanOvercomeifStuck, CannotWOHelp, MinimizeLimitationsSequencing, UnderstandTechLimitations) %>% 
  gather()

FY_Pre17_CABS <- FY_Pre17_CABS %>%
  mutate(Year = rep("2017", nrow(FY_Pre17_CABS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre17_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Pre17_CABS))) %>% 
  select(-key)

FY_Post17_CABS <- select(Post17,                            
                         ExecuteAmplicon, InformedAmpliconMothur, LimitationsMetagenomic, UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, SearchPublicDatasets, CannotShotgunWOHelp, KnowShotgun, ExecuteShotgun, CannotAmpliconWOHelp, CanCompleteLotofTime, CanCompleteMentor, CanOvercomeifStuck, CannotWOHelp, MinimizeLimitationsSequencing, UnderstandTechLimitations) %>% 
  gather()

FY_Post17_CABS <- FY_Post17_CABS %>%
  mutate(Year = rep("2017", nrow(FY_Post17_CABS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post17_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Post17_CABS))) %>% 
  select(-key)

FY17_CABS <- full_join(FY_Post17_CABS, FY_Pre17_CABS)


# Group 4 - Comfort Computational Tasks -  and post (Comfort Scale)
FY_Pre17_CCT <- select(Pre17, 
                       NavUnix, MakeE2Key, SumInfoSequenceFiles, CalcOTU, TrimSeqErrors, AssembleMetagenome, DiffDataModels,
                       TestHypotheses, IDPublicSequenceData) %>% 
  gather()

FY_Pre17_CCT <- FY_Pre17_CCT %>%
  mutate(Year = rep("2017", nrow(FY_Pre17_CCT))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre17_CCT))) %>% 
  mutate(Sc = rep("CCT", nrow(FY_Pre17_CCT))) %>% 
  select(-key)

FY_Post17_CCT <- select(Post17, 
                        NavUnix, MakeE2Key, SumInfoSequenceFiles, CalcOTU, TrimSeqErrors, AssembleMetagenome, DiffDataModels, TestHypotheses, IDPublicSequenceData) %>% 
  gather()

FY_Post17_CCT <- FY_Post17_CCT %>%
  mutate(Year = rep("2017", nrow(FY_Post17_CCT))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post17_CCT))) %>% 
  mutate(Sc = rep("CCT", nrow(FY_Post17_CCT))) %>% 
  select(-key)

FY17_CCT <- full_join(FY_Post17_CCT, FY_Pre17_CCT)

# Group 5 - Overall Rating Scale - Post (Good Scale)

FY_Post17_Rate <- select(Post17, 
                         OverallWorkshop, OverallSpeaker, MeetNeeds) %>% 
  gather()

FY_Post17_Rate <- FY_Post17_Rate %>%
  mutate(Year = rep("2017", nrow(FY_Post17_Rate))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post17_Rate))) %>% 
  mutate(Sc = rep("OvRating", nrow(FY_Post17_Rate))) %>% 
  select(-key)

