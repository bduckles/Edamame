#Demographics 2016 

# Data --------------------------------------------------------------------
Pre16 <- read_csv("Data/EDAMAME_2016_PRE_SURVEY.csv", 
          na = c("", " ", "NA", "I did not participate in 
          the QIIME tutorial", "I did not participate in the mothur tutorial"))

source("Analysis2016/Pre16ShortName.R") 
colnames(Pre16) <- c(Pre16shortname)

demog16 <- Pre16 %>% 
  select(Age, AcadStatus, Gender, Ethnicity) %>%  
  filter(!is.na(AcadStatus)) 

#skim(demog16)
#rm(Pre16)

# Function and Categories --------------------------------------------------------------
demog16 <- demog16 %>% 
  mutate(AcadStatus = fct_recode(AcadStatus, 
          "Graduate Student" = "PhD student"))

demog16$AcadStatus <- factor(demog16$AcadStatus, 
                    ordered=TRUE, 
                    exclude=NA)

demog16 <- demog16 %>% 
  mutate(Ethnicity = fct_recode(Ethnicity, 
      "Caucasian/White" = "Caucasian/White", 
      "Asian/Asian American" = "Asian/Asian American", 
      "Biracial/Multiracial" = "Caucasian/White;Latino(a)",
      "Latino(a)" = "Latino(a)"
      ))

demog16$Ethnicity <- factor(demog16$Ethnicity, 
                            ordered = TRUE, 
                            exclude = NA)

demog16$Gender <- factor(demog16$Gender, 
                         ordered = TRUE, 
                         exclude = NA)


