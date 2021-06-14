library(rgdal)
library(sp)
library(tidyverse)

data(meuse)

rdh <- select(meuse, x, y)
coordinates(rdh) <- ~ x + y
proj4string(rdh) <- CRS("+init=epsg:28992")

lonlat <- spTransform(rdh, CRS("+init=epsg:4326"))

meuse2 <- as_tibble(lonlat) %>%
  bind_cols(select(meuse, -x, -y))

write_csv(meuse2, "data/meuse2.csv")
