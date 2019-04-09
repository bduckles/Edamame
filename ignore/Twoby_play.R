
Twoby <- d16 %>% 
  count(Gender, AcadStatus) %>% 
  spread(Gender, n, fill = 0) %>% 
  mutate(
    pctFem = Female / sum(Female) * 100,
    pctMal = Male / sum(Male) * 100) 

huxtable::as_hux(Twoby)


Twobytab <- function(x, y){
    
}

