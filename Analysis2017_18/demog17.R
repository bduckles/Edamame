#Demographics for 17 

# Data --------------------------------------------------------------------
Pre17 <- read_csv("Data/EDAMAME_2017_PRE_SURVEY.csv", 
                  na = c("", " ", "NA", "I did not participate in 
                         the QIIME tutorial", "I did not participate in the mothur tutorial"))

source("Analysis2017_18/Pre17ShortName.R") 
colnames(Pre17) <- c(Pre17shortname)

demog17 <- Pre17 %>% 
  select(Age, AcadStatus, Gender, Ethnicity) %>%  
  filter(!is.na(AcadStatus)) 

#skim(Pre17)
#rm(Pre17)

# Function and Categories --------------------------------------------------------------
demog17 <- demog17 %>% 
  mutate(AcadStatus = fct_recode(AcadStatus, 
  "Ph.D.-holding Professional" = "Ph.D.-holding Professional",            
  "Graduate Student" = "Graduate Student",
  "Professional" = "Professional (I'm an environmental engineer working as an assistan investigator)" ))

demog17$AcadStatus <- factor(demog17$AcadStatus, 
                             ordered=TRUE, 
                             exclude=NA)

demog17 <- demog17 %>% 
  mutate(Ethnicity = fct_recode(Ethnicity, 
  "Caucasian/White" = "Caucasian/White", 
  "Asian/Asian American" = "Asian/Asian American", 
  "Biracial/Multiracial" = "Caucasian/White;Latino(a)",
  "Biracial/Multiracial" = "Asian/Asian American;Caucasian/White",
  "Latino(a)" = "Latino(a)", 
  "African/African American/Black" = "African/African American/Black", 
  NULL = "Do not want to answer"))

demog17$Ethnicity <- factor(demog17$Ethnicity, 
                            ordered = TRUE, 
                            exclude = NA)

demog17$Gender <- factor(demog17$Gender, 
                         ordered = TRUE, 
                         exclude = NA)

