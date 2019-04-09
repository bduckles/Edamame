#Demographic Plotting 2018 

#First read in demog data setup:

source("Analysis2017_18/demog18.R") 


# AcStatusDotplot ---------------------------------------------------------

j <- ggplot(data=subset(demog18,!is.na(AcadStatus)),
            aes(x = AcadStatus))

j + geom_dotplot(binwidth = .25, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Academic Status", y = element_blank()) +
  ggtitle("Academic Status of EDAMAME Attendees 2018") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  annotate("text", x = 1, y = 19, label = " 4%") + 
  annotate("text", x = 2, y = 19, label = "62%") + 
  annotate("text", x = 3, y = 19, label = " 8%") +
  annotate("text", x = 4, y = 19, label = "19%") + 
  annotate("text", x = 5, y = 19, label = " 4%") + 
  annotate("text", x = 6, y = 19, label = " 4%") 

ggsave("Charts/DemAcStat18.pdf", width = 6, height = 4)  

# EthnDotplot -------------------------------------------------------------

k <- ggplot(data = subset(demog18, !is.na(Ethnicity)), 
            aes(x = Ethnicity))

k + geom_dotplot(binwidth = .18, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Ethnicity", y = element_blank()) +
  ggtitle("Ethnicity of EDAMAME Attendees 2018") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  annotate("text", x = 1, y = 14, label = " 8%") + 
  annotate("text", x = 2, y = 14, label = "12%") + 
  annotate("text", x = 3, y = 14, label = "12%") +
  annotate("text", x = 4, y = 14, label = "58%") +
  annotate("text", x = 5, y = 14, label = " 4%") +
  annotate("text", x = 6, y = 14, label = " 8%")

ggsave("Charts/DemEthn18.pdf", width = 6, height = 4)

# AgeDotplot ----------------------------------------------------------------

p <- ggplot(data = subset(demog18, !is.na(Age)), 
            aes(x = Age)) 

p + geom_dotplot(show.legend = NA, na.rm = TRUE) + 
  scale_y_continuous(NULL, breaks = NULL) +
  coord_fixed(ratio = 10) +
  ggtitle("Distribution of EDAMAME Attendee Age 2018") + 
  theme(plot.title = element_text(hjust = 0.5)) 

ggsave("Charts/DemAge18.pdf", width = 6, height = 3)

# GenderPlot --------------------------------------------------------------

g <- ggplot(data = subset(demog18, !is.na(Gender)), 
            aes(x = Gender))

g + geom_dotplot(binwidth = .09, show.legend = NA) + 
  coord_fixed(ratio = 15) +
  coord_flip() + 
  labs(x = "Gender", y = element_blank()) +
  ggtitle("Gender of EDAMAME Attendees 2018") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  annotate("text", x = 1, y = 14, label = "81%") + 
  annotate("text", x = 2, y = 14, label = "19%")

ggsave("Charts/DemGenderPlot18.pdf", width = 6, height = 3)
