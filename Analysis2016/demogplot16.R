
#Demographic Plotting 2016 

#First read in demog data setup:

source("Analysis2016/demog16.R") 

# AcStatusDotplot ---------------------------------------------------------

j <- ggplot(data=subset(demog16,!is.na(AcadStatus)),
            aes(x = AcadStatus))

j + geom_dotplot(binwidth = .25, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Academic Status", y = element_blank()) +
  ggtitle("Academic Status of EDAMAME Attendees 2016") + 
  theme(plot.title = element_text(hjust = 0.5), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  annotate("text", x = 1, y = 19, label = " 3%") + 
  annotate("text", x = 2, y = 19, label = "54%") + 
  annotate("text", x = 3, y = 19, label = "32%") +
  annotate("text", x = 4, y = 19, label = " 3%") + 
  annotate("text", x = 5, y = 19, label = " 3%") + 
  annotate("text", x = 6, y = 19, label = " 3%") 

ggsave("Charts/DemAcStat16.pdf", width = 6, height = 4)  

# EthnDotplot -------------------------------------------------------------

k <- ggplot(data = subset(demog16, !is.na(Ethnicity)), 
            aes(x = Ethnicity))

k + geom_dotplot(binwidth = .18, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Ethnicity", y = element_blank()) +
  ggtitle("Ethnicity of EDAMAME Attendees 2016") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  annotate("text", x = 1, y = 14, label = "15%") + 
  annotate("text", x = 2, y = 14, label = "54%") + 
  annotate("text", x = 3, y = 14, label = " 6%") +
  annotate("text", x = 4, y = 14, label = "15%")

ggsave("Charts/DemEthn16.pdf", width = 6, height = 4)

# AgeDotplot ----------------------------------------------------------------

p <- ggplot(data = subset(demog16, !is.na(Age)), 
            aes(x = Age)) 

p + geom_dotplot(show.legend = NA, na.rm = TRUE) + 
  scale_y_continuous(NULL, breaks = NULL) +
  coord_fixed(ratio = 10) +
  ggtitle("Distribution of EDAMAME Attendee Age 2016") + 
  theme(plot.title = element_text(hjust = 0.5)) 

ggsave("Charts/DemAge16.pdf", width = 6, height = 3)

# GenderPlot --------------------------------------------------------------

g <- ggplot(data = subset(demog16, !is.na(Gender)), 
            aes(x = Gender))

g + geom_dotplot(binwidth = .09, show.legend = NA) + 
  coord_fixed(ratio = 15) +
  coord_flip() + 
  labs(x = "Gender", y = element_blank()) +
  ggtitle("Gender of EDAMAME Attendees 2016") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  annotate("text", x = 1, y = 14, label = "61%") + 
  annotate("text", x = 2, y = 14, label = "35%")

ggsave("Charts/DemGenderPlot16.pdf", width = 6, height = 3)
