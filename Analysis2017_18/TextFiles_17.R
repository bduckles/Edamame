#Create an excel file for text 2017 


# DataIn -------------------------------------------------------------
source("Analysis2017_18/DataReadin_17.R")

PreText17 <- Pre17 %>% 
  select(SupposeStory1, SupposeStory2, Expectations) %>% 
  write_excel_csv("Analysis2017_18/PreText17.csv")

PostText17 <- Post17 %>% 
  select(SupposeStory1, SupposeStory2, Suggestions) %>% 
  write_excel_csv("Analysis2017_18/PostText17.csv")


