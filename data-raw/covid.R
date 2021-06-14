library(tidyverse)
library(lubridate)
# library(rworldmap)

covid <- read_csv(
 "https://opendata.ecdc.europa.eu/covid19/nationalcasedeath/csv"
)

# world <- map_data(getMap("coarse"))

# for some reason matching fails on antigua and barbuda
covid$country[grepl("^Antigua", covid$country)] <- "Antigua and Barbuda"

covid2 <-
  covid %>%
  as_tibble() %>%
  select(-source, -country_code) %>%
  filter(!str_detect(country, "total"),
         !(country %in% c("Bonaire, Saint Eustatius and Saba"))) %>%
  mutate(
    country = recode(
      country,
      "Antigua and Barbuda" = "Antigua and Barb.",
      "Bosnia and Herzegovina" = "Bosnia and Herz.",
      "British Virgin Islands" = "British Virgin Is.",
      "Bosnia and Herz." = "Bosnia and Herzegovina",
      "Brunei Darussalam" = "Brunei",
      "Cabo Verde" = "Cape Verde",
      "Cayman Islands" = "Cayman Is.",
      "Central African Republic" = "Central African Rep.",
      "Czechia" = "Czech Rep.",
      "Congo" = "Congo (Brazzaville)",
      "Côte d’Ivoire" = "Ivory Coast",
      "Congo (Brazzaville)" = "Congo",
      "Curaçao" = "Curacao",
      "Democratic Republic of the Congo" = "Congo (Kinshasa)",
      "Dominican Republic" = "Dominican Rep.",
      "Eswatini" = "Swaziland",
      "Faroes" = "Faroe Is.",
      "Timor-Leste" = "East Timor" ,
      "Equatorial Guinea" = "Eq. Guinea",
      "Falkland Islands" = "Falkland Is.",
      "French Polynesia" = "Fr. Polynesia",
      "Guinea-Bissau" = "Guinea Bissau",
      "Ivory Coast" = "Côte d’Ivoire",
      "Marshall Islands" = "Marshall Is.",
      "Myanmar/Burma" = "Myanmar",
      "North Macedonia" = "Macedonia",
      "Northern Mariana Islands" = "N. Mariana Is.",
      "North Macedonia" = "N. Macedonia",
      "Palestine" = "Gaza",
      #"Palestine" = "West Bank",
      "South Korea" = "S. Korea",
      "South Sudan" = "S. Sudan",
      "United Republic of Tanzania" = "Tanzania",
      "US Virgin Islands" = "U.S. Virgin Is.",
      "United States of America" = "United States",
      "Western Sahara" = "W. Sahara",
      "Saint Kitts and Nevis" = "St. Kitts and Nevis",
      "Saint Vincent and the Grenadines" = "St. Vin. and Gren.",
      "São Tomé and Príncipe" = "Sao Tome and Principe",
      "Solomon Islands" = "Solomon Is.",
      "Turks and Caicos Islands" = "Turks and Caicos Is.",
      "The Gambia" = "Gambia",
      "the Holy See/ Vatican City State" = "Vatican"
    )
  )

# # making sure that the names are matched up
# a <- sort(unique(covid2$country))
# b <- sort(unique(world$region))
#
# a[is.na(match(a, b))]
#
# inner_join(world, covid2, by = c("region" = "country"))

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
