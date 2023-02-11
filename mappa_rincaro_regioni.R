library(tidyverse)
library(dplyr)
library(ggplot2)
library(maps)
library(readr)
install.packages("terra")
library(terra)
install.packages("sf")
library(sf)

df <- data.frame(Region = c("Valle d’Aosta", "Liguria", "Trentino Alto Adige", "Friuli-Venezia Giulia", "Veneto", "Umbria", "Emilia-Romagna", "Lombardia", "Lazio", "Piemonte", "Toscana", "Sicilia", "Abruzzo", "Calabria", "Basilicata", "Marche", "Puglia", "Sardegna", "Campania", "Molise"),
                 Rincaro.annuo.per.la.famiglia.media = c(1068, 1009, 1084, 1027, 1021, 916, 1028, 923, 939, 870, 951, 869, 864, 868, 798, 849, 818, 868, 782, 698))

shapefile_path <- "reg/reg.shp"
spatial_data <- terra::read_osm(shapefile_path)

spatial_polygon_df <- merge(shapefile_data, df, by.x = "DEN_REG", by.y = "Region")
spatial_polygon_df = st_as_sf(spatial_polygon_df, wkt = "Shape_Area")

colnames(spatial_polygon_df)[colnames(spatial_polygon_df) == "Rincaro"] <- "Rincaro_Annuo"

ggplot(spatial_polygon_df) + 
  geom_sf(aes(fill = Rincaro_Annuo)) + 
  scale_fill_gradient(low = "green", high = "red") + 
  labs(fill = "Rincaro_Annuo")










