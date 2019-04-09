#Demographic Plotting 2017 

#First read in demog data setup:

source("")

# EthnDotplot -------------------------------------------------------------

k <- ggplot(data = subset(demog17, !is.na(Ethnicity)), 
            aes(x = Ethnicity))

k + geom_dotplot(binwidth = .25, show.legend = NA) + 
  coord_flip() + 
  labs(x = "Ethnicity", y = element_blank()) +
  ggtitle("Ethnicity of EDAMAME Attendees 2017") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  annotate("text", x = 1, y = 14, label = " 4%") + 
  annotate("text", x = 2, y = 14, label = "12%") + 
  annotate("text", x = 3, y = 14, label = "12%") +
  annotate("text", x = 4, y = 14, label = "50%") +
  annotate("text", x = 5, y = 14, label = "19%")

ggsave("Charts/DemEthn17.pdf", width = 6, height = 4)

# AgeDotplot ----------------------------------------------------------------

p <- ggplot(data = subset(demog17, !is.na(Age)), 
            aes(x = Age)) 

p + geom_dotplot(show.legend = NA, na.rm = TRUE) + 
  scale_y_continuous(NULL, breaks = NULL) +
  coord_fixed(ratio = 9) +
  ggtitle("Distribution of EDAMAME Attendee Age 2017") + 
  theme(plot.title = element_text(hjust = 0.5)) 

ggsave("Charts/DemAge17.pdf", width = 6, height = 3)

# GenderPlot --------------------------------------------------------------

g <- ggplot(data = subset(demog17, !is.na(Gender)), 
            aes(x = Gender))

g + geom_dotplot(binwidth = .09, show.legend = NA) + 
  coord_fixed(ratio = 12) +
  coord_flip() + 
  labs(x = "Gender", y = element_blank()) +
  ggtitle("Gender of EDAMAME Attendees 2017") + 
  theme(plot.title = element_text(hjust = 0.4), 
        axis.text.x=element_blank(), 
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank()) +
  annotate("text", x = 1, y = 14, label = "69%") + 
  annotate("text", x = 2, y = 14, label = "31%")

ggsave("Charts/DemGenderPlot17.pdf", width = 6, height = 3)
