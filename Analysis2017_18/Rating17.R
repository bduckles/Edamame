# DataIn -------------------------------------------------------------
source("Analysis2017_18/DataReadin_17.R")

rm(CodeAbilSc1_Post, CodeAbilSc1_Pre, CodeAbilSc2_Post, CodeAbilSc2_Pre)
rm(ComfCompTask_Post, ComfCompTask_Pre, CompUndSc_Post, CompUndSc_Pre)
rm(PerCompAbilSc_Post, PerCompAbilSc_Pre)


source("Analysis2017_18/edamfunc.R") 

Rating_Post <- factfunc(Rating_Post, goodlevel) %>% as.data.frame()

names(Rating_Post) <- c( 
  NEW_RateIntroComp = "Introduction to Computing",
  NEW_RateTmux =    "Remote sessions with tmux", 
  NEW_RateEC2 =    "EC2 Usage",
  NEW_RateDataviz =   "Data Visualization", 
  NEW_RateIntroShell =    "Introduction to the Shell", 
  NEW_RateBlast =    "Local BLAST", 
  NEW_RateEco =    "Ecological Analysis in R", 
  NEW_RateAmplicon =  "Amplicon Analysis in Mothur", 
  NEW_RateDiv =   "Diversity Conceptual Framework", 
  NEW_RateShotgun = "Shotgun Metagenomic Analysis", 
  OverallWorkshop = "Overall Workshop Rating", 
  OverallSpeaker = "Overall Speaker Rating")



RPTitle <- "Overall Ratings 2017"
RPLik <- likert(Rating_Post)

pdf("Charts/Rating17.pdf", width = 7, height = 5 )
plot(RPLik, 
     center = 3.5,
     plot.percent.neutral = FALSE,
     colors=PurpleGreenFive) + ggtitle(RPTitle)
dev.off()
