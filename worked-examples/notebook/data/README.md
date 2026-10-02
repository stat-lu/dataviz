# Data sources

These local copies let students run the Python examples without installing R, downloading data in each session, or obtaining a map API key. CSVs retain the source values and column names unless stated below. CSV does not retain R classes or factor levels; the notebooks explicitly reconstruct categories and dates.

| Files | Source and preparation |
| --- | --- |
| `us_cars.csv`, `xy.csv` | Exact copies from this repository's top-level `data` folder. [Course data](https://github.com/stat-lu/dataviz/tree/main/data). |
| `airquality.csv`, `CO2.csv`, `mtcars.csv`, `cars.csv` | Exported from R's `datasets` package with `write.csv(..., row.names = FALSE)`. `mtcars.csv` has an added `car` column containing the original row names. [R datasets documentation](https://stat.ethz.ch/R-manual/R-devel/library/datasets/html/00Index.html). |
| `mpg.csv`, `msleep.csv` | Exported from `ggplot2::mpg` and `ggplot2::msleep`. Missing values are empty CSV fields. This `mpg` is different from seaborn's dataset named `mpg`. [ggplot2 data documentation](https://ggplot2.tidyverse.org/reference/index.html#data). |
| `table2.csv` | Exported from `tidyr::table2`, for the Cars pivoting example. [tidyr table2 documentation](https://tidyr.tidyverse.org/reference/table1.html). |
| `meuse.csv` | Exported from `sp::meuse`. Coordinates are EPSG:28992, and metal concentrations are in mg/kg. [sp dataset documentation](https://r-spatial.github.io/sp/reference/meuse.html). |
| `Arthritis.csv` | [vcd::Arthritis via Rdatasets](https://vincentarelbundock.github.io/Rdatasets/csv/vcd/Arthritis.csv), with the CSV row-name column removed. Preserve the literal outcome `None` with `keep_default_na=False`. |
| `BudgetFood.csv` | [Ecdat::BudgetFood via Rdatasets](https://vincentarelbundock.github.io/Rdatasets/csv/Ecdat/BudgetFood.csv), with the CSV row-name column removed. Food share is a fraction. |
| `gapminder.csv` | [gapminder::gapminder via Rdatasets](https://vincentarelbundock.github.io/Rdatasets/csv/gapminder/gapminder.csv), with the CSV row-name column removed. 142 countries, 1952–2007 at five-year intervals. |
| `meuse-rivers.geojson` | A clipped subset of [Natural Earth's 1:10m rivers and lake centerlines](https://naturalearth.s3.amazonaws.com/10m_physical/ne_10m_rivers_lake_centerlines.zip), retaining name and geometry. WGS84 coordinates. Bounds are the Meuse samples plus 0.01° on each side. [Natural Earth terms](https://www.naturalearthdata.com/about/terms-of-use/): public-domain map data. |
| `meuse-basemap.tif` | A small raster cache of standard OpenStreetMap tiles for the same area, zoom 13, downloaded on 2026-10-01 using contextily. Stored in EPSG:3857. **© OpenStreetMap contributors**; retain attribution on each map. [Copyright and license](https://www.openstreetmap.org/copyright), [tile usage policy](https://operations.osmfoundation.org/policies/tiles/). This is a cache for this example, not an offline tile service. |
| `kasteel-stein.csv` | One [Nominatim](https://nominatim.openstreetmap.org/) lookup for “Kasteel Stein, Netherlands”, saved on 2026-10-01. Contains the returned display address and coordinates (latitude 50.9628888, longitude 5.7554424). Derived from OpenStreetMap data; **© OpenStreetMap contributors**, under the [ODbL](https://www.openstreetmap.org/copyright). [Nominatim usage policy](https://operations.osmfoundation.org/policies/nominatim/). |

For the R exports, the preparation used R 4.6.0 and ggplot2 4.0.3, tidyr 1.3.2 and sp 2.2.3. The copied data retain their original source terms; consult each linked source when reusing them outside the course. File checksums for this edition are in [SHA256SUMS](SHA256SUMS).
