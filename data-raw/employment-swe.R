# devtools::install_github("reinholdsson/rkolada")
library(swemaps)
library(tidyverse)

# SCB data from 2019 report
employment_data <- tibble(
  employment = c(72.7,
                 68.4,
                 62.8,
                 67.4,
                 70.9,
                 69.3,
                 64.9,
                 68.2,
                 63.9,
                 64.8,
                 72.1,
                 70,
                 67.1,
                 66.0,
                 65.7,
                 64.7,
                 65,
                 64.6,
                 66.2,
                 64.9,
                 62.9),
  lnnamn = c("Stockholms län",
             "Uppsala län",
             "Södermanlands län",
             "Östergötlands län",
             "Jönköpings län",
             "Kronobergs län",
             "Kalmar län",
             "Gotlands län",
             "Blekinge län",
             "Skåne län",
             "Hallands län",
             "Västra Götalands län",
             "Värmlands län",
             "Örebro län",
             "Västmanlands län",
             "Dalarnas län",
             "Gävleborgs län",
             "Västernorrlands län",
             "Jämtlands län",
             "Västerbottens län",
             "Norrbottens län")
)

mapdata <- map_ln %>%
  mutate(lnnamn = as.character(lnnamn))

swe_employment <- left_join(mapdata, employment_data, by = "lnnamn") %>%
  select(lat = ggplot_lat, long = ggplot_long, employment, region = lnnamn)

saveRDS(swe_employment, "data/swe_employment.rds")

