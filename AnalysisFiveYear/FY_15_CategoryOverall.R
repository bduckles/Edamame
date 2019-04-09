#Five Year Groupings - Set up 2015
# Additional variables omitted which were in 2016-2018 but are not in 2015 or 2014 
## Post and Pre Groupings for All Five Years 

##Group 1 - Perceptual Computational Ability  and Post (Ability Scale)

FY_Pre15_PCAS <- select(Pre15, 
                        Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta) %>%
  na.omit() %>% 
  gather()  

FY_Pre15_PCAS <- FY_Pre15_PCAS %>%
  mutate(Year = rep("2015", nrow(FY_Pre15_PCAS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre15_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Pre15_PCAS))) %>% 
  select(-key)

FY_Post15_PCAS <- select(Post15, 
                         Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta) %>% 
  na.omit %>% 
  gather()

FY_Post15_PCAS <- FY_Post15_PCAS %>%
  mutate(Year = rep("2015", nrow(FY_Post15_PCAS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post15_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Post15_PCAS))) %>% 
  select(-key)

FY15_PCAS <- full_join(FY_Post15_PCAS, FY_Pre15_PCAS)

#Group 2 - Computational Understanding Scale and Post (Agree Scale)
FY_Pre15_CUS  <- select(Pre15, 
                        UnderstandCD, IlluminaData, RunR, TwoMicrobial, StructureOTU, KnowKMER, KnowEC2) %>% 
  gather()

FY_Pre15_CUS <- FY_Pre15_CUS %>%
  mutate(Year = rep("2015", nrow(FY_Pre15_CUS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre15_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Pre15_CUS))) %>% 
  select(-key)

FY_Post15_CUS  <- select(Post15, 
                         UnderstandCD, IlluminaData, RunR, TwoMicrobial, StructureOTU, KnowKMER, KnowEC2) %>% 
  gather()

FY_Post15_CUS <- FY_Post15_CUS %>%
  mutate(Year = rep("2015", nrow(FY_Post15_CUS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post15_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Post15_CUS))) %>% 
  select(-key)

FY15_CUS <- full_join(FY_Post15_CUS, FY_Pre15_CUS)

#Group 3 - Coding Ability Scale  and post in two chunks (Agree Scale)
FY_Pre15_CABS <- select(Pre15, 
                        ExecuteAmplicon, InformedAmpliconMothur, UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, SearchPublicDatasets, CannotShotgunWOHelp, ExecuteShotgun, CannotAmpliconWOHelp, CanCompleteLotofTime, CanCompleteMentor, CanOvercomeifStuck, CannotWOHelp, UnderstandTechLimitations) %>% 
  gather()

FY_Pre15_CABS <- FY_Pre15_CABS %>%
  mutate(Year = rep("2015", nrow(FY_Pre15_CABS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre15_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Pre15_CABS))) %>% 
  select(-key)

FY_Post15_CABS <- select(Post15,                            
                         ExecuteAmplicon, InformedAmpliconMothur, UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, SearchPublicDatasets, CannotShotgunWOHelp, ExecuteShotgun, CannotAmpliconWOHelp, CanCompleteLotofTime, CanCompleteMentor, CanOvercomeifStuck, CannotWOHelp, UnderstandTechLimitations) %>% 
  gather()

FY_Post15_CABS <- FY_Post15_CABS %>%
  mutate(Year = rep("2015", nrow(FY_Post15_CABS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post15_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Post15_CABS))) %>% 
  select(-key)

FY15_CABS <- full_join(FY_Post15_CABS, FY_Pre15_CABS)


# Group 4 - Comfort Computational Tasks -  and post (Comfort Scale)
FY_Pre15_CCT <- select(Pre15, 
                       NavUnix, MakeE2Key, SumInfoSequenceFiles, CalcOTU, TrimSeqErrors, DiffDataModels, TestHypotheses, IDPublicSequenceData) %>% 
  gather()

FY_Pre15_CCT <- FY_Pre15_CCT %>%
  mutate(Year = rep("2015", nrow(FY_Pre15_CCT))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre15_CCT))) %>% 
  mutate(Sc = rep("CCT", nrow(FY_Pre15_CCT))) %>% 
  select(-key)

FY_Post15_CCT <- select(Post15, 
                        NavUnix, MakeE2Key, SumInfoSequenceFiles, CalcOTU, TrimSeqErrors, DiffDataModels, TestHypotheses, IDPublicSequenceData) %>% 
  gather()

FY_Post15_CCT <- FY_Post15_CCT %>%
  mutate(Year = rep("2015", nrow(FY_Post15_CCT))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post15_CCT))) %>% 
  mutate(Sc = rep("CCT", nrow(FY_Post15_CCT))) %>% 
  select(-key)

FY15_CCT <- full_join(FY_Post15_CCT, FY_Pre15_CCT)

# Group 5 - Overall Rating Scale - Post (Good Scale)

FY_Post15_Rate <- select(Post15, 
                         OverallWorkshop, OverallSpeaker, MeetNeeds) %>% 
  gather()

FY_Post15_Rate <- FY_Post15_Rate %>%
  mutate(Year = rep("2015", nrow(FY_Post15_Rate))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post15_Rate))) %>% 
  mutate(Sc = rep("OvRating", nrow(FY_Post15_Rate))) %>% 
  select(-key)

