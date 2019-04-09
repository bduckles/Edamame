#Functions 
# factfunc function 
# nameID function 
# Both illustrated in ToyLikertPlay.R 

##Factor levels for each question type 
abilitylevel <- c("I'm not sure what this is", "No Ability", "Low Ability", "Intermediate Ability","High Ability")
agreelevel <- c("Strongly Disagree", "Disagree", "Agree","Strongly Agree")
comflevel <- c("I do not know what this is.", "Very Uncomfortable", "Uncomfortable", "Comfortable","Very Comfortable")
goodlevel <- c("Very poor",  "Poor", "Adequate", "Good", "Very good")

# Create a function that sets the factor level each variable in the dataset
# Then unifies the factors so that they're all the same number of factors.

factfunc <- function(mydata, factlevel){
  factor(mydata, 
         levels=factlevel, 
         ordered = TRUE)
  fct_unify(mydata, 
            levels=factlevel)
}

# nameID function adds in a column with an ID number and a group name that is 
# called at the start of the function. 
nameID <- function(mydata, gname = "gname"){
  quo_gname <- enquo(gname)
  mutate(mydata, 
         Group = rep(!!quo_gname, nrow(mydata))) 
}


#Plotting Colors! 
PurpleGreenFour <- c('#7b3294', '#c2a5cf', '#a6dba0', '#008837')
PurpleGreenFive <- c('#7b3294', '#c2a5cf', '#ffffbf', '#a6dba0', '#008837') 
PurpleGreenSix <- c('#762a83', '#af8dc3', '#e7d4e8', '#ffffbf', '#7fbf7b', '#1b7837')
PurpleGreenSeven <- c('#762a83', '#af8dc3', '#e7d4e8', '#ffffbf', '#d9f0d3', '#7fbf7b', '#1b7837')

