library(tidyverse)
library(lubridate)

covid <- read_csv(
 "https://opendata.ecdc.europa.eu/covid19/nationalcasedeath/csv"
)

covid2 <-
  covid %>%
  as_tibble() %>%
  select(-source) %>%
  filter(!str_detect(country, "total"),
         !(country %in% c("Bonaire, Saint Eustatius and Saba")))

covid3 <-
  covid2 %>%
  separate(year_week, c("year", "week")) %>%
  rename(region = country) %>%
  mutate(
    year = as.integer(year),
    week = as.integer(week) - 1L,
    date = as.Date(paste(year, week, 1, sep = "/"), "%Y/%W/%u"),
    month = as.integer(month(date))
  ) %>%
  select(
    region,
    region_code,
    continent,
    population,
    date,
    year,
    month,
    week,
    date,
    indicator,
    weekly_count,
    rate_14_day,
    cumulative_count
  )

tmp <-
  covid3 %>%
  summarize(last_month = month(max(date)),
            last_year = year(max(date)))

# remove the last (incomplete) month
covid4 <-
  filter(covid3, !(year == tmp$last_year & month == tmp$last_month))

write_csv(covid4, "data/covid.csv")
