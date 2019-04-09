library(tidyverse)
#Data 
Var1 <- c(1, 2, 1, 2, 1, 2) %>% as.integer()
Var2 <- c(2, 1, 2, 1, 2, 1) %>% as.integer()
Var3 <- c(2, 1, 1, 2, 2, 1) %>% as.integer()
df <- tibble(Var1, Var2, Var3)

#make a list of the variables
df_list <- c("Var1", "Var2")

# Add an id column for identification then (gather) stack the three variables into one data column that produces df_mut
df %>% 
  select(one_of(df_list)) %>% 
  mutate(id = row_number()) %>%
  gather(df_list, key = "variables", value = "Yesno") %>%
  as.data.frame() -> df_mut 

#Mutate Df_mut by recoding all the variables then return it to the way it was before with spread. 
df_mut %>% 
  mutate(Yesno, Yesno = recode(Yesno,
    "1" = "Yes", 
    "2" = "No")) %>% 
  spread(key = "variables", value = "Yesno") -> df2


