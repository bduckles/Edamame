#Five Year Groupings - Set up 2018 
# This omits anything variable was not in all five years. 
## Post and Pre Groupings for All Five Years 

##Group 1 - Perceptual Computational Ability  and Post (Ability Scale)

FY_Pre18_PCAS <- select(Pre18, 
                          Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta, RunBLAST) %>% 
  gather()

FY_Pre18_PCAS <- FY_Pre18_PCAS %>%
  mutate(Year = rep("2018", nrow(FY_Pre18_PCAS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre18_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Pre18_PCAS))) %>% 
  select(-key)

FY_Post18_PCAS <- select(Post18,
            Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta, RunBLAST) %>% 
  gather()

FY_Post18_PCAS <- FY_Post18_PCAS %>%
  mutate(Year = rep("2018", nrow(FY_Post18_PCAS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post18_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Post18_PCAS))) %>% 
  select(-key)

FY18_PCAS <- full_join(FY_Post18_PCAS, FY_Pre18_PCAS)

#Group 2 - Computational Understanding Scale and Post (Agree Scale)
FY_Pre18_CUS  <- select(Pre18, 
                         UnderstandCD, IlluminaData, SumSequence, RunR, TwoMicrobial, CDpkg,StructureOTU, KnowKMER, KnowContig, KnowEC2, KnowMetadata) %>% 
  gather()

FY_Pre18_CUS <- FY_Pre18_CUS %>%
  mutate(Year = rep("2018", nrow(FY_Pre18_CUS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre18_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Pre18_CUS))) %>% 
  select(-key)

FY_Post18_CUS  <- select(Post18, 
                       UnderstandCD, IlluminaData, SumSequence, RunR, TwoMicrobial, CDpkg,StructureOTU, KnowKMER, KnowContig, KnowEC2, KnowMetadata) %>% 
  gather()

FY_Post18_CUS <- FY_Post18_CUS %>%
  mutate(Year = rep("2018", nrow(FY_Post18_CUS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post18_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Post18_CUS))) %>% 
  select(-key)

FY18_CUS <- full_join(FY_Post18_CUS, FY_Pre18_CUS)

#Group 3 - Coding Ability Scale  and post in two chunks (Agree Scale)
FY_Pre18_CABS <- select(Pre18, 
                      ExecuteAmplicon, InformedAmpliconMothur, LimitationsMetagenomic, UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, SearchPublicDatasets, CannotShotgunWOHelp, KnowShotgun, ExecuteShotgun, CannotAmpliconWOHelp, CanCompleteLotofTime, CanCompleteMentor, CanOvercomeifStuck, CannotWOHelp, MinimizeLimitationsSequencing, UnderstandTechLimitations) %>% 
  gather()

FY_Pre18_CABS <- FY_Pre18_CABS %>%
  mutate(Year = rep("2018", nrow(FY_Pre18_CABS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre18_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Pre18_CABS))) %>% 
  select(-key)

FY_Post18_CABS <- select(Post18,                            
                      ExecuteAmplicon, InformedAmpliconMothur, LimitationsMetagenomic, UnderstandKmer, QualShotgun, RpgkAnalyzeData, MoveDataIntoR, MoveFilesTerminal, EvalRawSequence, SearchPublicDatasets, CannotShotgunWOHelp, KnowShotgun, ExecuteShotgun, CannotAmpliconWOHelp, CanCompleteLotofTime, CanCompleteMentor, CanOvercomeifStuck, CannotWOHelp, MinimizeLimitationsSequencing, UnderstandTechLimitations) %>% 
  gather()

FY_Post18_CABS <- FY_Post18_CABS %>%
  mutate(Year = rep("2018", nrow(FY_Post18_CABS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post18_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Post18_CABS))) %>% 
  select(-key)

FY18_CABS <- full_join(FY_Post18_CABS, FY_Pre18_CABS)


# Group 4 - Comfort Computational Tasks -  and post (Comfort Scale)
FY_Pre18_CCT <- select(Pre18, 
                           NavUnix, MakeE2Key, SumInfoSequenceFiles, CalcOTU, TrimSeqErrors, AssembleMetagenome, DiffDataModels,
 TestHypotheses, IDPublicSequenceData) %>% 
  gather()

FY_Pre18_CCT <- FY_Pre18_CCT %>%
  mutate(Year = rep("2018", nrow(FY_Pre18_CCT))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre18_CCT))) %>% 
  mutate(Sc = rep("CCT", nrow(FY_Pre18_CCT))) %>% 
  select(-key)

FY_Post18_CCT <- select(Post18, 
                      NavUnix, MakeE2Key, SumInfoSequenceFiles, CalcOTU, TrimSeqErrors, AssembleMetagenome, DiffDataModels, TestHypotheses, IDPublicSequenceData) %>% 
  gather()

FY_Post18_CCT <- FY_Post18_CCT %>%
  mutate(Year = rep("2018", nrow(FY_Post18_CCT))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post18_CCT))) %>% 
  mutate(Sc = rep("CCT", nrow(FY_Post18_CCT))) %>% 
  select(-key)

FY18_CCT <- full_join(FY_Post18_CCT, FY_Pre18_CCT)

# Group 5 - Overall Rating Scale - Post (Good Scale)

FY_Post18_Rate <- select(Post18, 
                      OverallWorkshop, OverallSpeaker, MeetNeeds) %>% 
  gather()

FY_Post18_Rate <- FY_Post18_Rate %>%
  mutate(Year = rep("2018", nrow(FY_Post18_Rate))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post18_Rate))) %>% 
  mutate(Sc = rep("OvRating", nrow(FY_Post18_Rate))) %>% 
  select(-key)

