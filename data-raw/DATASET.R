## code to prepare `DATASET` dataset goes here
library(tigris)
library(sf)
library(raster)

WA <- counties("Washington", cb = TRUE)
WASnoCo <- subset(WA, COUNTYFP == "061")

# reproject into UTM zone 10...generatePolygonSamplePoints() won't work with data in LAT-LON
# doing this and saving the polygon in UTM causes non-ASCII characters in the CRS. This, in turn,
# causes warnings when checking the package. Easy solution is to skip the projection step and
# reporjoect in the vignette that uses the polygon.
#WASnoCo <- st_transform(WASnoCo, crs = 26910)

# compute area in hectares and acres
WASnoCo$HECTARES <- (WASnoCo$ALAND + WASnoCo$AWATER) / 10000
WASnoCo$ACRES <- (WASnoCo$ALAND + WASnoCo$AWATER) * 0.000247105

# drop some fields...values too large for shapefile format
WASnoCo <- WASnoCo[c(1:2, 6, 11, 12)]

usethis::use_data(WASnoCo, overwrite = TRUE)
