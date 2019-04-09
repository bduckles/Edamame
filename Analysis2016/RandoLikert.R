#Random Bits of Likert Code Play 




#write.xlsx(Reason, "/Users/Anaya/Dropbox/**HUB/PSU_SBA_Data/Grad_ReasonLeft2015.xlsx")


#Five Factor Comfort Q 
#comflevelfive <- c("I do not know what this is.", "Very Uncomfortable", "Uncomfortable", 
#                  "Comfortable", "Very Comfortable")

#Create a list of header names for each dataset
#Postcolnames <- names(Post16)
#Precolnames <- names(Pre16)




#Reverse Experiment
#Post_ability_Qs_rev <- select(Post16, 
#                          Navterm, PythonScript, AmazonE2, InstallMothur, RunQIIME, 
#                          ExecRScript, ChooseEcoStat, InstallAmazonE2, AssembleMeta, 
#                         UseGithub, DevWorkflow, RunBLAST, UseMGRAST, UseAPI) 
#factfunc(Post_ability_Qs_rev, abilitylevel_rev)
#Post_ability_Qs_rev <- fct_unify(Post_ability_Qs_rev) %>% as.data.frame()
#lik_rev <- likert(Post_ability_Qs_rev)
#plot(lik_rev)





#Post16[,1:ncol(Post16)] <- as.data.frame(apply(Post16[,1:ncol(Post16)], 2, as.factor))
# colwise((factor(), levels=ability, ordered=TRUE)), 
#      Post_ability_Qs) 

# FactorFcn <- function(data, factlevel) {
#  factor(data, levels=factlevel, ordered=TRUE)
# }






#Now how do I set the factor level for each 
#ensuring that the factors are unified even if they have different response #s?
factfunc(df, levelset)
df <- fct_unify(df, levels=levelset) %>% as.data.frame()

#Groupings (assumes they are being applied to data frames)
Group1 <- select(df, 
                 Q1, Q3)
Group2 <- select(df, 
                 Q2, Q4)

Group3 <- select(Group1, 
                 
                 
                 #Jonah
                 #mydat <- data.frame(a=c(1,2,3,4,5,5,6,7),b=c(9,5,7,4,3,2,1,3))
                 #colnames <- names(mydat)
                 #mydat[colnames[1]]
                 #factor(mydat[colnames[1]])
                 
                 
                 #####
                 
                 myfun <- function(mycolumn){
                   factor(mycolumn, 
                          levels=c(1,2,3,4,5,6,7,8,9,10), 
                          ordered=TRUE)
                 }
                 
                 foo <- mydat %>%
                   mutate_each(funs(myfun))
                 
                 
                 
                 ### Jonah's Code with me 
                 abilitylevel <- c("No Ability", "Low Ability", "Intermediate Ability","High Ability")
                 agreelevel <- c("Strongly Disagree", "Disagree", "Agree","Strongly Agree")
                 comflevel <- c("Uncomfortable", "Comfortable","Very Comfortable")
                 
                 myfun <- function(mycolumn, factorlevels=mylevels) { factor(mycolumn, 
                                                                             levels=thelevels, 
                                                                             ordered = TRUE)
                 }
                 
                 setlevelstoabilitylevel <- function(mycolumn) { myfun(mycolumn, thelevels=abilitylevel) }
                 setlevelstoagreelevel <- function(mycolumn) { myfun(mycolumn, thelevels=agreelevel) }
                 setleveltocomflevel <- function(mycolumn) { myfun(mycolumn, thelevels=comflevel)}
                 
                 foo<- mydat %>%
                   mutate_each_(funs(setlevelstoabilitylevel), contains("ability")) %>%
                   mutate_each_(funs(setlevelstoagreelevel), contains("satisfaction")) %>%
                   mutate_each_(funs(setleveltocomflevel), contains("comf"))
                 
                 ###
                 
                 fs <- list(factor ("a"), factor("b"), factor(c("a", "b")))
                 fs <- fct_unify(fs)
                 
                 
                 
                 
                 
                 
                 
                 
                 

