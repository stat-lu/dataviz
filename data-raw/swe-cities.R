## code to prepare `swe-cities` dataset goes here

library(tidyverse)
library(readxl)
library(rgdal)

tmp <- read_excel(
  "data-raw/mi0810_2018a01_tatorter2018_bef_arealer_200827.xlsx",
  skip = 10
)

tmp2 <-
  tmp %>%
  select(region_code = Länskod,
         region_name = Länsnamn,
         municipality_code = Kommunkod,
         municipality_name = Kommunnamn,
         city_code = Tätortskod,
         city_name = Tätortsbeteckning,
         population_2015 = "Folkmängd 2015-12-31",
         population_2018 = "Folkmängd 2018-12-31",
         populationdensity_2015 = "Befolknings-täthet 2015, antal invånare/km2",
         populationdensity_2018 = "Befolknings-täthet 2018, antal invånare/km2",
         x = "x-koordinat  Sweref 99TM",
         y = "y-koordinat Sweref 99TM") %>%
  pivot_longer(starts_with("population")) %>%
  separate(name, into = c("var", "year")) %>%
  pivot_wider(names_from = var, values_from = value) %>%
  rename(population_density = populationdensity) %>%
  mutate(year = as.integer(year))

write_csv(tmp2, "data/swe-cities.csv")

