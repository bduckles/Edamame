# Five Year Demographic Plotting 
# Combination Plots - Not single Plots 
library(ggpubr)
theme_set(theme_pubr())

source("/Users/Anaya/git/Edamame/AnalysisFiveYear/DataReadin_FY.R")

# AcadStatusPlot ----------------------------------------------------------
m <- ggplot(data=subset(FYDat,!is.na(AcadStatus)),
            aes(x = AcadStatus))

FYAcStat <- m + geom_dotplot(binwidth = .09, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Academic Status", y = element_blank()) +
  ggtitle("Attendee Academic Status") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  facet_grid(. ~ Year)
#ggsave("Charts/FiveYear/DemAcStatFY.pdf", width = 8, height = 4)  

# EthnDotplot -------------------------------------------------------------

n <- ggplot(data = subset(FYDat, !is.na(Ethnicity)), 
            aes(x = Ethnicity))

FYEth <- n + geom_dotplot(binwidth = .09, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Ethnicity", y = element_blank()) +
  ggtitle("Attendee Ethnicity") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  facet_grid(. ~ Year)

#ggsave("Charts/FiveYear/DemEthnFY.pdf", width = 8, height = 4)

# AgeDotplot ----------------------------------------------------------------
q <- ggplot(data = subset(FYDat, !is.na(Age)), 
            aes(x = Age)) 

FYAge <- q + geom_dotplot(binwidth = 2.5, show.legend = NA, na.rm = TRUE) + 
  scale_y_continuous(NULL, breaks = NULL) +
  coord_fixed(ratio = 4) +
  ggtitle("Attendee Age") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_grid(Year ~ .)

#ggsave("Charts/FiveYear/DemAgeFY.pdf", width = 5, height = 6)

# GenderPlot --------------------------------------------------------------
r <- ggplot(data = subset(FYDat, !is.na(Gender)), 
            aes(x = Gender))

FYGend <- r + geom_dotplot(binwidth = .2, show.legend = NA) + 
  coord_fixed(ratio = 15) +
  coord_flip() + 
  labs(x = element_blank(), y = element_blank()) +
  ggtitle("Attendee Gender") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  facet_grid (Year ~ .)

#ggsave("Charts/FiveYear/DemGenderPlotFY.pdf", width = 5, height = 6)

# Combine Plots-----------------------------------------------------------------
ggarrange(FYGend, FYAge, 
          ncol = 2, 
          align = c("h"), 
          widths = 5, heights = 6)
ggsave("Charts/FiveYear/ComboAgeGendFY.pdf", width = 5, height = 6)

ggarrange(FYEth, FYAcStat, 
          nrow = 2, 
          align = c("v"), 
          widths = 8, heights = 5)

ggsave("Charts/FiveYear/ComboEthAcStatFY.pdf", width = 8, height = 6)

