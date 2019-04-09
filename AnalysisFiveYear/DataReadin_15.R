#DataLoadIn 2015
## DATA GROUPINGS TURNED OFF JUST UNDO THE # BELOW TO TURN BACK ON AGAIN


# Data --------------------------------------------------------------------
Post15 <- read_csv("Data/EDAMAME_2015_POST_SURVEY.csv")
Pre15 <- read_csv("Data/EDAMAME_2015_PRE_SURVEY.csv") 

#Put Long Variable Names into a list.  
Post15LongName <- names(Post15)
Pre15LongName <- names(Pre15)

#Replace colnames with shorter names 
source("AnalysisFiveYear/Pre15ShortName.R") 
source("AnalysisFiveYear/Post15ShortName.R") 
colnames(Post15) <- c(Post15shortname)
colnames(Pre15) <- c(Pre15shortname)

# Demog -------------------------------------------------------------------


demog15 <- Pre15 %>% 
  select(Age, AcadStatus, Gender, Ethnicity) %>%  
  filter(!is.na(AcadStatus)) 

demog15 <- demog15 %>% 
  mutate(AcadStatus = fct_recode(AcadStatus, 
    "Ph.D.-holding Professional" = "Ph.D.-holding Professional",  
    "Graduate Student" = "Graduate Student", 
    "M.S.-holding Professional" = "M.S.-holding Professional", 
    "Ph.D.-holding Professional" = "Associate Professor", 
    "Postdoc" = "Post-doc" ))

demog15$AcadStatus <- factor(demog15$AcadStatus, 
                             ordered=TRUE, 
                             exclude=NA)

demog15 <- demog15 %>% 
  mutate(Ethnicity = fct_recode(Ethnicity, 
  "Caucasian/White" = "Caucasian/White", 
  "Asian/Asian American" = "Asian/Asian American", 
  "Biracial/Multiracial" = "Caucasian/White;Latino(a)",
  "Biracial/Multiracial" = "Asian/Asian American;Caucasian/White",
  "Biracial/Multiracial" =  "Caucasian/White, Latino(a)",
  "Latino(a)" = "Latino(a)", 
  "African/African American/Black" = "African/African American/Black", 
  NULL = "Do not want to answer"))

demog15$Ethnicity <- factor(demog15$Ethnicity, 
                            ordered = TRUE, 
                            exclude = NA)

demog15$Gender <- factor(demog15$Gender, 
                         ordered = TRUE, 
                         exclude = NA)



#Call in the 15 Data Groupings 
#source("AnalysisFiveYear/DataGroupings15.R") 

