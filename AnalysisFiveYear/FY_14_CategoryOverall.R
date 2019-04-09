#Five Year Groupings - Set up 2014
# Additional variables omitted which were in 2016-2018 but are not in 2015 or 2014 
## Post and Pre Groupings for All Five Years 

##Group 1 - Perceptual Computational Ability  and Post (Ability Scale)

FY_Pre14_PCAS <- select(Pre14, 
                        Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat) %>%
  na.omit() %>% 
  gather()  

FY_Pre14_PCAS <- FY_Pre14_PCAS %>%
  mutate(Year = rep("2014", nrow(FY_Pre14_PCAS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre14_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Pre14_PCAS))) %>% 
  select(-key)

FY_Post14_PCAS <- select(Post14_Abil, 
                         Navterm, AmazonE2, InstallMothur, ExecRScript, ChooseEcoStat) %>%
  na.omit() %>% 
  gather()  

FY_Post14_PCAS <- FY_Post14_PCAS %>%
  mutate(Year = rep("2014", nrow(FY_Post14_PCAS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post14_PCAS))) %>% 
  mutate(Sc = rep("PCAS", nrow(FY_Post14_PCAS))) %>% 
  select(-key)

FY14_PCAS <- full_join(FY_Post14_PCAS, FY_Pre14_PCAS)

#Group 2 - Computational Understanding Scale and Post (Agree Scale)
FY_Pre14_CUS  <- select(Pre14, 
                        UnderstandCD, IlluminaData, RunR, TwoMicrobial, StructureOTU, KnowKMER) %>% 
  gather()

FY_Pre14_CUS <- FY_Pre14_CUS %>%
  mutate(Year = rep("2014", nrow(FY_Pre14_CUS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre14_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Pre14_CUS))) %>% 
  select(-key)

FY_Post14_CUS  <- select(Post14_Agree, 
                         UnderstandCD, IlluminaData, RunR, TwoMicrobial, StructureOTU, KnowKMER) %>% 
  gather()

FY_Post14_CUS <- FY_Post14_CUS %>%
  mutate(Year = rep("2014", nrow(FY_Post14_CUS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post14_CUS))) %>% 
  mutate(Sc = rep("CUS", nrow(FY_Post14_CUS))) %>% 
  select(-key)

FY14_CUS <- full_join(FY_Post14_CUS, FY_Pre14_CUS)

#Group 3 - Coding Ability Scale  and post in two chunks (Agree Scale)
FY_Pre14_CABS <- select(Pre14, 
                        ExecuteAmplicon, InformedAmpliconMothur, QualShotgun, MoveDataIntoR, MoveFilesTerminal, SearchPublicDatasets, CannotShotgunWOHelp, ExecuteShotgun, CannotAmpliconWOHelp) %>% 
  gather()

FY_Pre14_CABS <- FY_Pre14_CABS %>%
  mutate(Year = rep("2014", nrow(FY_Pre14_CABS))) %>% 
  mutate(PrePost = rep("Pre", nrow(FY_Pre14_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Pre14_CABS))) %>% 
  select(-key)

FY_Post14_CABS <- select(Post14_Agree,                            
                         ExecuteAmplicon, InformedAmpliconMothur, QualShotgun, MoveDataIntoR, MoveFilesTerminal, SearchPublicDatasets, CannotShotgunWOHelp, ExecuteShotgun, CannotAmpliconWOHelp) %>% 
  gather()

FY_Post14_CABS <- FY_Post14_CABS %>%
  mutate(Year = rep("2014", nrow(FY_Post14_CABS))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post14_CABS))) %>% 
  mutate(Sc = rep("CABS", nrow(FY_Post14_CABS))) %>% 
  select(-key)

FY14_CABS <- full_join(FY_Post14_CABS, FY_Pre14_CABS)


# Group 4 - Comfort Computational Tasks -  and post (Comfort Scale)
## None of these for 2014!!! There is no data. 


# Group 5 - Overall Rating Scale - Post (Good Scale)

FY_Post14_Rate <- select(Post14, 
                         OverallWorkshop, OverallSpeaker, MeetNeeds) %>% 
  gather()

FY_Post14_Rate <- FY_Post14_Rate %>%
  mutate(Year = rep("2014", nrow(FY_Post14_Rate))) %>% 
  mutate(PrePost = rep("Post", nrow(FY_Post14_Rate))) %>% 
  mutate(Sc = rep("OvRating", nrow(FY_Post14_Rate))) %>% 
  select(-key)

