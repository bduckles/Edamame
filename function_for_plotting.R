# This code reads in data of pre- and post-workshop surveys that assess a student's abilities, formats the data, 
# passes the data to likert() and produces a plot of the data. For the plot to be formatted properly, 
# all columns must have the same levels of factors.
# In this dummy example, not all questions had the same scale: some assessed ability, some comfort, and some agreeableness. 
# These scales are defined as global variables prior to the function, and need to be specified in the function. 

# The function process_and_plot_survey() takes advantage of fct_unify(). There is one caveat that should be noted with fct_unify():
# All levels of the factor must be present somewhere in the dataset for the function to behave properly. For example,
# if you were to pass a dataframe of pre- and post-survey data where all questions were scored on ability, 
# if at no point in the pre- or post-survey the level "Strongly Agree" appeared, the fct_unify would throw and error
# and not be able to plot the data. This is highly likely to occur with dummy data, and not likely to occurr with real survey data. 

#This code sources: 
#source("Pre16ShortName.R") 
#source("Post16ShortName.R") 
#source("DataGroupings.R")
#source("rename.R")


# Load required libraries. If libraries cannot be found, run install.packages("likert"), etc. for each package
library(likert)
library(tidyverse)
library(forcats)
library(reshape2)

# Read in data

# Note if reading in the dummy data throws an error, add these two arguments to the read.csv() function:  skip = 1, header = FALSE.
# This will skip reading in the headers, and the "long" header information will be lost, 
# but the read.csv() function will no longer throw an error

Post16 <- read.csv("data/EDAMAME_2016_POST_SURVEY_Fake.csv",
                   na.strings = c( "", " ", "NA", "I did not participate in the QIIME tutorial", 
                                   "I did not participate in the mothur tutorial"),
                   stringsAsFactors = TRUE)

Pre16 <- read.csv("data/EDAMAME_2016_PRE_SURVEY_Fake.csv", 
                  na.strings = c("", " ", "NA", "I did not participate in the QIIME tutorial", 
                                 "I did not participate in the mothur tutorial"),
                  stringsAsFactors = TRUE)

# Remove extra lines in Pre16
Pre16 <- Pre16[1:3, ]

# Put Long Variable Names into a list.  
Post16LongName <- names(Post16)
Pre16LongName <- names(Pre16)

# Replace colnames with shorter names 
source("Pre16ShortName.R") 
source("Post16ShortName.R") 
colnames(Post16) <- c(Post16shortname)
colnames(Pre16) <- c(Pre16shortname)

# Define factor levels for each question type
abilitylevel <- c("No Ability", "Low Ability", "Intermediate Ability", "High Ability")
agreelevel <- c("Strongly Disagree", "Disagree", "Agree","Strongly Agree")
comflevel <- c("I do not know what this is.", "Very Uncomfortable", "Uncomfortable", "Comfortable","Very Comfortable")

# Read in data groupings
source("DataGroupings.R")

# Define factor levels for each question type
abilitylevel <- c("No Ability", "Low Ability", "Intermediate Ability", "High Ability")
agreelevel <- c("Strongly Disagree", "Disagree", "Agree", "Strongly Agree")
comflevel <- c("I do not know what this is.", "Very Uncomfortable", "Uncomfortable", "Comfortable", "Very Comfortable")

# Palettes to choose from for plotting
PurpleGreenFour <- c('#7b3294', '#c2a5cf', '#a6dba0', '#008837')
PurpleGreenFive <- c('#7b3294', '#c2a5cf', '#ffffbf', '#a6dba0', '#008837') 
PurpleGreenSix <- c('#762a83', '#af8dc3', '#e7d4e8', '#ffffbf', '#7fbf7b', '#1b7837')
PurpleGreenSeven <- c('#762a83', '#af8dc3', '#e7d4e8', '#ffffbf', '#d9f0d3', '#7fbf7b', '#1b7837')

# Read in data groupings
source("scripts/DataGroupings.R")

# Define function to process and plot the data
process_and_plot_survey <- function(data_pre, data_post, title, question_levels, color_palette) {
  # data_pre: a data.frame of pre-survey data (Pre16 in this example)
  # data_post: a data.frame of post-survey data (Post16 in this example)
  
  # add a column identifier for "Post" and "Pre"; add ID identifier to distinguish participant
  data_post <- mutate(data_post, 
                      Group = rep("Post", nrow(data_post)))
  data_pre <- mutate(data_pre, 
                     Group = rep("Pre", nrow(data_pre)))
  
  # Join pre- and post-survey data into one dataframe. This prints a verbose output about joins, 
  # and will generate many warnings about coercing factors to character vectors bc of different levels
  joined_data <- full_join(data_post, data_pre)

  # Format levels for each column in the dataframe
  require(plyr)
  joined_data[, ] <- plyr::colwise(as.factor)(joined_data[, ])
  # define column to remove (Group has two levels that are different from question_levels)
  drops <- c("Group")
  # Unify factor level while removing Group column
  # note "ng" stands for "no group"
  joined_data_ng <- fct_unify(joined_data[ , !(names(joined_data) %in% drops)], levels = question_levels) %>% as.data.frame()
  # re-bind the group variable
  joined_data_bound <- cbind(joined_data_ng, joined_data$Group)
  # rename the group column to "Group" for simpler referencing
  joined_data_bound = rename(joined_data_bound, replace = c("joined_data$Group" = "Group"))
  
  # Define group level
  GrpLevel <- c("Post", "Pre")
  
  # Factor the group column with levels as GrpLevel
  joined_data_bound$Group <- factor(joined_data_bound$Group, levels=GrpLevel, ordered = TRUE)
  
  # perform likert using the ng dataframe with releveled factors and the refactored Group vector
  likert_ng_joined <- likert(joined_data_ng, grouping = joined_data_bound$Group)
  
  likert_plot <- plot(likert_ng_joined, colors = color_palette) + ggtitle(title) 
  return(likert_plot)
  }


process_and_plot_survey(AllPost_PerCompAbilSc, AllPre_PerCompAbilSc, "Title", abilitylevel, PurpleGreenFour)
