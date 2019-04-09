#Demographic 2018 

# Data --------------------------------------------------------------------
Pre18 <- read_csv("Data/EDAMAME_2018_PRE_SURVEY.csv", 
                  na = c("", " ", "NA", "I did not participate in 
                         the QIIME tutorial", "I did not participate in the mothur tutorial"))

source("Analysis2017_18/Pre18ShortName.R") 
colnames(Pre18) <- c(Pre18shortname)

demog18 <- Pre18 %>% 
  select(Age, AcadStatus, Gender, Ethnicity) %>%  
  filter(!is.na(AcadStatus)) %>% 
  mutate(Age = as.integer(str_extract(Age, "\\d+")))

#skim(demog18)
#rm(Pre18)

# Function and Categories --------------------------------------------------------------
demog18$AcadStatus <- factor(demog18$AcadStatus, 
                             ordered=TRUE, 
                             exclude=NA)

demog18 <- demog18 %>% 
  mutate(Ethnicity = fct_recode(Ethnicity, 
   "Caucasian/White" = "Caucasian/White", 
   "Asian/Asian American" = "Asian/Asian American", 
   "Biracial/Multiracial" = "Asian/Asian American;Caucasian/White",
   "African/African American/Black" = "African/African American/Black",
   "Latino(a)" = "Latino(a)", 
   NULL = "Do not like to say"
  ))

demog18$Ethnicity <- factor(demog18$Ethnicity, 
                            ordered = TRUE, 
                            exclude = NA)

demog18$Gender <- factor(demog18$Gender, 
                         ordered = TRUE, 
                         exclude = NA)

