# for loading our data
library(jsonlite)
library(rgdal)
library(sf)
# for plotting
library(extrafont)
library(ggplot2)
library(ggspatial)
library(patchwork)
library(scico)
# for data wrangling
library(dplyr)

setwd("~/Honey")

# load honey shapefile
honey_sf <- read_sf("honey.shp")
# get the data for 2008
honey2008 <- honey_sf[honey_sf$year == 2008, ]
# create a MULTILINESTRING object
honey2008_multiline <- st_cast(honey2008, "MULTILINESTRING")

usa_1 <- ggplot(data = honey2008) +
  geom_sf()
usa_1

## add data to map

usa_2 <- ggplot(data = honey2008) +
  geom_sf(aes(fill = prcprlb)) +
  ggtitle(label = "The Honey crisis of 2008", subtitle = "Price per lb")
usa_2

usa_1 / usa_2

# load honey shapefile
honey_sf <- read_sf("honey.shp")
# get the data for 2010
honey2010 <- honey_sf[honey_sf$year == 2010, ]
# create a MULTILINESTRING object
honey2010_multiline <- st_cast(honey2010, "MULTILINESTRING")

usa_3 <- ggplot(data = honey2010) +
  geom_sf(aes(fill = prcprlb)) +
  ggtitle(label = "The Honey crisis of 2010", subtitle = "Price per lb")
usa_3

usa_2 / usa_3


##### zoom in

usa_1 / usa_1 + coord_sf(xlim = c(-126, -115), ylim = c(45,50))

usa_4 <- ggplot(data = honey2010) +
  geom_sf(aes(fill = yldprcl))
usa_4 / usa_4 + coord_sf(xlim = c(-126, -115), ylim = c(45,50))


## exercise: check the year 2010, then plot 2008 and 2010 in the same window

## exercise: change from price per lb to total product

## exercise: Zoom in to another state and plot a different measurement

