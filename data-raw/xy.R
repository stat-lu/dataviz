library(datasauRus)
library(tidyverse)

xy <-
  datasaurus_dozen %>%
  filter(dataset == "dino") %>%
  select(x, y)

write_csv(xy, "data/xy.csv")

