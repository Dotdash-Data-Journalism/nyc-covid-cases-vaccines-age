library(readr)
library(tibble)
library(dplyr)
library(magrittr)
library(tidyr)

newByAge <- tibble()
newDates <- seq.Date(from = as.Date("2020-11-09"), to = as.Date("2021-05-04"),
                     by = "day") %>% 
  sort(decreasing = T)
newDatesFixed <- newDates[!(newDates %in% seq.Date(from = as.Date("2021-03-21"), to = as.Date("2021-03-23"), by = "day"))]


for (i in seq_len(174)) {
  byAge <- read_csv(paste0("./byAgeData/by_age_", i, ".csv"), 
                    col_types = "cdddiii") %>% 
    mutate(DATE = newDatesFixed[i]) %>% 
    filter(AGE_GROUP %in% c('0-4',
                            '5-12',
                            '13-17',
                            '18-24',
                            '25-34',
                            '35-44',
                            '45-54',
                            '55-64',
                            '65-74',
                            '75+'
    )) %>% 
    select(AGE_GROUP, CASE_COUNT, DATE) %>% 
    pivot_wider(names_from = AGE_GROUP, values_from = CASE_COUNT) %>% 
    mutate(`0-17` = `0-4` + `5-12` + `13-17`,
           `18-44` = `18-24` + `25-34` + `35-44`,
           `45-64` = `45-54` + `45-54` + `55-64`) %>% 
    select(DATE, `0-17`, `18-44`, `45-64`, `65-74`, `75+`) %>% 
    pivot_longer(!DATE, names_to = "AGE_GROUP", values_to = "CASE_COUNT")
  
  newByAge <- bind_rows(newByAge, byAge)
  
}

oldByAge <- tibble()

oldDates <- seq.Date(from = as.Date("2020-05-18"), to = as.Date("2020-11-08"),
                     by = "day") %>% 
  sort(decreasing = T)

oldDatesFixed <- oldDates[!(oldDates %in% c(as.Date("2020-09-06"), 
                                            as.Date("2020-09-13")))]

for (j in 175:346) {
  byAgeOG <- read_csv(paste0("./byAgeData/by_age_", j, ".csv"), 
                      col_types = "cdddiii") %>% 
    filter(AGE_GROUP != 'Citywide') %>% 
    mutate(DATE = oldDatesFixed[j - 174]) %>% 
    select(DATE, AGE_GROUP, CASE_COUNT)
  
  oldByAge <- bind_rows(oldByAge, byAgeOG)
}

allAges <- bind_rows(newByAge, oldByAge)
write_csv(allAges, "nycCovidCasesByAge.csv")



