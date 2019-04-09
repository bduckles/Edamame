#Create an excel file for text 2018 


# DataIn -------------------------------------------------------------
source("Analysis2017_18/DataReadin_18.R")

PreText18 <- Pre18 %>% 
  select(SupposeStory1, SupposeStory2, Expectations) %>% 
  write_excel_csv("Analysis2017_18/PreText18.csv")

PostText18 <- Post18 %>% 
  select(SupposeStory1, SupposeStory2, Suggestions) %>% 
  write_excel_csv("Analysis2017_18/PostText18.csv")



