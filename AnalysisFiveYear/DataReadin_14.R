#DataLoadIn 2014
## DATA GROUPINGS TURNED OFF JUST UNDO THE # BELOW TO TURN BACK ON AGAIN

# Data --------------------------------------------------------------------
Post14 <- read_csv("Data/EDAMAME_2014_POST_SURVEY.csv")
Pre14 <- read_csv("Data/EDAMAME_2014_PRE_SURVEY.csv")

#Put Long Variable Names into a list.  
Post14LongName <- names(Post14)
Pre14LongName <- names(Pre14)

#Replace colnames with shorter names 
source("AnalysisFiveYear/Pre14ShortName.R") 
source("AnalysisFiveYear/Post14ShortName.R") 
colnames(Post14) <- c(Post14shortname)
colnames(Pre14) <- c(Pre14shortname)

# Num to Likert ---------------------------------------------------------------
# Post14 is numeric instead of likert  
# Change the tibble numbers from integers to characters. 
Post14 <- Post14 %>% 
  as_tibble() %>% 
  mutate_if(is.integer, as.character)

#list of the variables to change for Post 
abilvar <- c("Navterm", "PythonScript", "AmazonE2", "InstallMothur", 
            "AmazonE2", "RunQIIME", "ExecRScript", "ChooseEcoStat", 
            "XX_VizMicrob", "AssembleMeta")

# add an id variable and gather the variables that needs to be changed 
Post14 %>% 
 select(one_of(abilvar)) %>% 
  mutate(id = row_number()) %>% 
  gather(abilvar, key = "Questions", value = "Responses") %>% 
  as.data.frame() -> G_Post14

# Recode variables and return to the way it was before spread. 
G_Post14 %>% 
  mutate(Responses, Responses = recode_factor(Responses, 
  "1" = "No Ability", 
  "2" = "Low Ability", 
  "3" = "Intermediate Ability", 
  "4" = "High Ability")) %>% 
  spread(key = "Questions", value = "Responses") -> Post14_Abil

rm(G_Post14)

###For Agree Vars 
agreevar <- c("UnderstandCD", "UnderstandPY", "IlluminaData",  
              "RunR", "QIIMEvsMothur", "TwoMicrobial", 
              "CDpkg", "StructureOTU", "KnowKMER", "ExecuteShotgun", 
              "ExecuteAmplicon", "InformedAmpliconQiime", 
              "InformedAmpliconMothur", "DiffAssembledMetagenomic", 
              "QualShotgun", "MoveDataIntoR","MoveFilesTerminal",
              "EvalRawSequence", "SearchPublicDatasets", 
              "CannotShotgunWOHelp", 
              "CannotAmpliconWOHelp", "CanCompleteLotofTime", 
              "CanCompleteMentor", "CanOvercomeifStuck", "CannotWOHelp")

Post14 %>% 
  select(one_of(agreevar)) %>% 
  mutate(id = row_number()) %>% 
  gather(agreevar, key = "Questions", value = "Responses") %>% 
  as.data.frame() -> H_Post14

# Recode variables and return to the way it was before spread. 
H_Post14 %>% 
  mutate(Responses, Responses = recode_factor(Responses, 
  "1" = "Strongly Disagree", 
  "2" = "Disagree", 
  "3" = "Agree", 
  "4" = "Strongly Agree"))%>% 
  spread(key = "Questions", value = "Responses") -> Post14_Agree

#rm(H_Post14)


# Demog -------------------------------------------------------------------

demog14 <- Pre14 %>% 
  select(Age, AcadStatus, Gender, Ethnicity) %>%  
  filter(!is.na(AcadStatus)) 

demog14 <- demog14 %>% 
  mutate(AcadStatus = fct_recode(AcadStatus, 
      "Ph.D.-holding Professional" = "Ph.D.-holding Professional",            
      "Graduate Student" = "Graduate Student"))

demog14$AcadStatus <- factor(demog14$AcadStatus, 
                             ordered=TRUE, 
                             exclude=NA)

demog14 <- demog14 %>% 
  mutate(Ethnicity = fct_recode(Ethnicity, 
      "Caucasian/White" = "Caucasian/White", 
      "Asian/Asian American" = "Asian/Asian American", 
      "Biracial/Multiracial" = "Caucasian/White;Latino(a)",
      "Biracial/Multiracial" = "Caucasian/White, Native American",
      "Biracial/Multiracial" = "Asian/Asian American;Caucasian/White",
      "Latino(a)" = "Latino(a)", 
      "African/African American/Black" = "African/African American/Black", 
      NULL = "Do not want to answer"))

demog14$Ethnicity <- factor(demog14$Ethnicity, 
                            ordered = TRUE, 
                            exclude = NA)

demog14$Gender <- factor(demog14$Gender, 
                         ordered = TRUE, 
                         exclude = NA)


#Call in the 14 Data Groupings 
#source("AnalysisFiveYear/DataGroupings14.R") 

