# Five Year Demographic Plotting 

source("/Users/Anaya/git/Edamame/AnalysisFiveYear/DataReadin_FY.R")

# AcadStatusPlot ----------------------------------------------------------

m <- ggplot(data=subset(FYDat,!is.na(AcadStatus)),
            aes(x = AcadStatus))

m + geom_dotplot(binwidth = .09, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Academic Status", y = element_blank()) +
  ggtitle("Academic Status of EDAMAME Attendees 2014-2018") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  facet_grid(. ~ Year)

ggsave("Charts/FiveYear/DemAcStatFY.pdf", width = 8, height = 4)  

# EthnDotplot -------------------------------------------------------------

n <- ggplot(data = subset(FYDat, !is.na(Ethnicity)), 
            aes(x = Ethnicity))

n + geom_dotplot(binwidth = .07, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Ethnicity", y = element_blank()) +
  ggtitle("Ethnicity of EDAMAME Attendees 2014-2018") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  facet_grid(. ~ Year)

ggsave("Charts/FiveYear/DemEthnFY.pdf", width = 8, height = 4)

# AgeDotplot ----------------------------------------------------------------

q <- ggplot(data = subset(FYDat, !is.na(Age)), 
            aes(x = Age)) 

q + geom_dotplot(binwidth = 1.2, show.legend = NA, na.rm = TRUE) + 
  scale_y_continuous(NULL, breaks = NULL) +
  coord_fixed(ratio = 10) +
  ggtitle("Distribution of EDAMAME Attendee Age 2014-2018") + 
  theme(plot.title = element_text(hjust = 0.5)) +
  facet_grid(Year ~ .)

ggsave("Charts/FiveYear/DemAgeFY.pdf", width = 5, height = 6)

# GenderPlot --------------------------------------------------------------

r <- ggplot(data = subset(FYDat, !is.na(Gender)), 
            aes(x = Gender))

r + geom_dotplot(binwidth = .28, show.legend = NA) + 
  coord_fixed(ratio = 15) +
  coord_flip() + 
  labs(x = "Gender", y = element_blank()) +
  ggtitle("Gender of EDAMAME Attendees 2014-2018") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  facet_grid (Year ~ .)

ggsave("Charts/FiveYear/DemGenderPlotFY.pdf", width = 5, height = 6)




### Chunk to make a table 
#Twoby <- d16 %>% 
 # count(Gender, AcadStatus) %>% 
#  spread(Gender, n, fill = 0) %>% 
 # mutate(
#    pctFem = Female / sum(Female) * 100,
 #   pctMal = Male / sum(Male) * 100) %>% 
#  select(AcadStatus, Female, pctFem, Male, pctMal) %>% 
#  arrange(desc(Female))

# tbynames <- c("Academic Status", "Female", "% Female", "Male", "% Male")
# kable(Twoby, digits = 1, add_colnames = TRUE, col.names = tbynames) 
#```
