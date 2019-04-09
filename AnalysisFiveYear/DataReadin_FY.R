#DataLoadIn for Five Year Demographic Charts  
#wd should be git/Edamame

# Library -----------------------------------------------------------------
library(likert)
library(tidyverse)
library(likert)
library(reshape2)
library(knitr)
# Datasets ----------------------------------------------------------------

#Read in datasets 
# For this to work you may need to turn off data groupings in each of these files. Data groupings work for each individual year and are the same variable for each year. 

source("/Users/Anaya/git/Edamame/AnalysisFiveYear/DataReadin_14.R")
source("/Users/Anaya/git/Edamame/AnalysisFiveYear/DataReadin_15.R")
source("/Users/Anaya/git/Edamame/Analysis2016/demog16.R")
source("/Users/Anaya/git/Edamame/Analysis2017_18/demog17.R") 
source("/Users/Anaya/git/Edamame/Analysis2017_18/demog18.R") 

#Add Year column 
d16 <- demog16 %>% 
  mutate(Year = rep("2016", nrow(demog16)))
d17 <- demog17 %>% 
  mutate(Year = rep("2017", nrow(demog17)))
d18 <- demog18 %>% 
  mutate(Year = rep("2018", nrow(demog18)))
d14 <- demog14 %>% 
  mutate(Year = rep("2014", nrow(demog14)))
d15 <- demog15 %>% 
  mutate(Year = rep("2015", nrow(demog15)))

FYDatNO <- full_join(d16, d17)
FYDatNO <- full_join(FYDatNO, d14)
FYDatNO <- full_join(FYDatNO, d15)
FYDat <- full_join(FYDatNO, d18)
rm(FYDatNO)

FYDat$Ethnicity <- factor(FYDat$Ethnicity, 
                          levels = c(
                            "African/African American/Black", 
                            "Biracial/Multiracial", 
                            "Asian/Asian American", 
                            "Latino(a)", 
                            "Caucasian/White"), 
                           ordered = TRUE, 
                           exclude = NA)

FYDat$AcadStatus <- factor(FYDat$AcadStatus,
                           levels = c(
                             "Bench Scientist",
                             "Professional",
                             "Undergraduate Student", 
                             "Postdoc", 
                             "B.A.-holding Professional",
                             "M.S.-holding Professional", 
                             "Ph.D.-holding Professional", 
                              "Graduate Student"),
                            ordered = TRUE, 
                            exclude = NA)


