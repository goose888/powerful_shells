library(leaflet)
library(sp)
library(RColorBrewer)
library(maps)
library(htmltools)

# Set options
#leafletOptions(minZoom = NULL, maxZoom = NULL, crs = leafletCRS(),
#  worldCopyJump = NULL, preferCanvas = NULL, ...)
#leaflet(options = leafletOptions(minZoom = 0, maxZoom = 18))

# Set central coordinate and zoom level
m <- leaflet() %>% addTiles() %>% setView(-71.0382679, 42.3489054, zoom = 18)

# Display the first view
m %>% fitBounds(-72, 40, -70, 43)  # Set view boundary

# Display the second view
m %>% clearBounds()  # Clean the bounds, leaflet() shows the global map by default

# Random data
set.seed(123)
df <- data.frame(Lat = 1:10, Long = rnorm(10))
leaflet(df) %>% addCircles()

# Plot SP object
Sr1 <- Polygon(cbind(c(2, 4, 4, 1, 2), c(2, 3, 5, 4, 2)))  # links end point to the start point
Sr2 <- Polygon(cbind(c(5, 4, 2, 5), c(2, 3, 2, 2)))  # Triangle
Sr3 <- Polygon(cbind(c(4, 4, 5, 10, 4), c(5, 3, 2, 5, 5)))  # Quadrilateral
Sr4 <- Polygon(cbind(c(5, 6, 6, 5, 5), c(4, 4, 3, 3, 4)), hole = TRUE)  # hole = TRUE, hollow

Srs1 <- Polygons(list(Sr1), "s1")  # 's1' is the ID parameter
Srs2 <- Polygons(list(Sr2), "s2")
Srs3 <- Polygons(list(Sr4, Sr3), "s3/4") 

# Pass multiple polygon objects
SpP <- SpatialPolygons(list(Srs1, Srs2, Srs3), 1:3)

leaflet(height = "300px") %>% addPolygons(data = SpP, fillColor = brewer.pal(3, 
    name = "Set1"))

# Map CONUS states
mapStates <- map("state", fill = TRUE, plot = FALSE)
leaflet(data = mapStates) %>% addTiles() %>% addPolygons(fillColor = brewer.pal(10, 
    name = "Paired"), stroke = FALSE)

# Fabricate some data
m <- leaflet() %>% addTiles()
df <- data.frame(lat = rnorm(100), lng = rnorm(100), size = runif(100, 5, 20), 
    color = sample(colors(), 100))
m <- leaflet(df) %>% addTiles()
# no change for the radius of circle when zooming
m %>% addCircleMarkers(radius = ~size, color = ~color, fill = FALSE)
# no change for the radius of circle when zooming
m %>% addCircleMarkers(radius = runif(100, 4, 10), color = c("red"))

# leaflet supports Tilemap 
# leaflet supports tiles from the other 3rd part providers (e.g., Stamen, Esri, OpenWeatherMap, etc.)
m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 12)
m %>% addTiles() # Shows street map by default when add Tiles

m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 12)
m %>% addProviderTiles(providers$Stamen.Toner)

leaflet() %>% addTiles() %>% setView(-93.65, 42.0285, zoom = 4) %>%   # Add a WMS (web map service) tile layer
addWMSTiles("http://mesonet.agron.iastate.edu/cgi-bin/wms/nexrad/n0r.cgi", layers = "nexrad-n0r-900913", 
    options = WMSTileOptions(format = "image/png", transparent = TRUE), attribution = "Weather data <U+00A9> 2012 IEM Nexrad")

# Overlap new layers
m <- leaflet() %>% setView(lng = -71.0589, lat = 42.3601, zoom = 12)

m %>% addProviderTiles(providers$MtbMap) %>% # bottom layer
  addProviderTiles(providers$Stamen.TonerLines,  # Add roads and streets
    options = providerTileOptions(opacity = 0.35)) %>% # set opacity
  addProviderTiles(providers$Stamen.TonerLabels) # Add road names, street names and markers

# change icon
data(quakes)
# show only the first 20 records
leaflet(data = quakes[1:20, ]) %>% addTiles() %>% 
# Add icon layer and show the filed "mag" from the "quakes" dataset
addMarkers(~long, ~lat, popup = ~as.character(mag), label = ~as.character(mag))

# design your own icon
# Free icon download: https://icons8.com/icons
greenLeafIcon <- makeIcon(
  iconUrl = "E:/R_input_output/images_input/leaf-green.png", # use pciture
  iconWidth = 38, iconHeight = 95, # width, height
  iconAnchorX = 22, iconAnchorY = 94, # location
  shadowUrl = "E:/R_input_output/images_input/leaf-shadow.png", # shadow icon
  shadowWidth = 50, shadowHeight = 64,
  shadowAnchorX = 4, shadowAnchorY = 62
)

leaflet(data = quakes[1:4,]) %>% addTiles() %>%
  addMarkers(~long, ~lat, icon = greenLeafIcon) # add icon layer

# Different icons
quakes1 <- quakes[1:10,] # select first 10 records

leafIcons <- icons(
  iconUrl = ifelse(quakes1$mag < 4.6, # Condition
    "E:/R_input_output/images_input/leaf-green.png", # test = TRUE
    "E:/R_input_output/images_input/leaf-red.png" # test = FALSE
  ),
  iconWidth = 38, iconHeight = 95, # length = 1, fill by cycle
  iconAnchorX = 22, iconAnchorY = 94, # length = 1, fill by cycle
  shadowUrl = "E:/R_input_output/images_input/leaf-shadow.png", # length = 1, fill by cycle
  shadowWidth = 50, shadowHeight = 64, # length = 1 
  shadowAnchorX = 4, shadowAnchorY = 62 # length = 1
)

leaflet(data = quakes1) %>% addTiles() %>%
  addMarkers(~long, ~lat, icon = leafIcons) # pass the icon information

# iconList()
oceanIcons <- iconList(
  ship = makeIcon(iconUrl = "E:/R_input_output/images_input/cargo-ship.png", 
    iconWidth = 30, iconHeight = 20), 
  pirate = makeIcon(iconUrl = "E:/R_input_output/images_input/pirates-caribbean.png", 
    iconWidth = 30, iconHeight = 30) 
)

df <- sp::SpatialPointsDataFrame(
  cbind( # 20x4 array
    (runif(20) - .5) * 10 - 90.620130,  # Lon
    (runif(20) - .5) * 3.8 + 25.638077  # Lat
  ),
  data.frame(type = factor(
    ifelse(runif(20) > 0.75, "pirate", "ship"), # test > 7.5, then type="pirate"
    c("ship", "pirate") # length = 2 < 20, fill by cycle
  ))
)

leaflet(df) %>% addTiles() %>%
  addMarkers(icon = ~oceanIcons[type]) # use the elements in type to match the items in the iconlist

# Awesom icons
df.20 <- quakes[1:20,]

# Create color vector, mag<=4 for green, mag=6 for orange, mag>5 for red
getColor <- function(quakes) {
  sapply(quakes$mag, function(mag) {
  if(mag <= 4) {
    "green"
  } else if(mag <= 5) {
    "orange"
  } else {
    "red"
  } })
}
icons <- awesomeIcons(
  icon = 'flash', # icon name flash
  iconColor = 'black', 
  library = 'ion', # use icon from the library ionicons
  markerColor = getColor(df.20) # marker color
)
leaflet(df.20) %>% addTiles() %>%
  addAwesomeMarkers(~long, ~lat, icon=icons, label=~as.character(mag))

# Cluster Options
# cache = TRUE
leaflet(quakes) %>% addTiles() %>% addAwesomeMarkers(~long, ~lat, icon = icons, 
    label = ~as.character(mag), clusterOptions = markerClusterOptions() )

# Freeze at zoom
leaflet(quakes) %>% addTiles() %>% addAwesomeMarkers(~long, ~lat, icon = icons, 
    label = ~as.character(mag), clusterOptions = markerClusterOptions(freezeAtZoom = 5)  # freeze cluster at zoom level = 5)

# Add circle markers
leaflet(df) %>% addTiles() %>% addCircleMarkers()
# stroke = FALSE to remove the path shadow
leaflet(df) %>% addTiles() %>% addCircleMarkers(radius = 15, stroke = FALSE) %>% 
# fill = FALSE shows hollow circle
addCircleMarkers(radius = 15, color = "magenta", weight = 8, opacity = 0.2, 
    fill = FALSE) %>% 
# assign different colors for stroke and fill
addCircleMarkers(radius = 60, color = "lime", weight = 8, opacity = 0.8, fillColor = "cyan", 
    fillOpacity = 0.3, dashArray = "5 2")

# Different radius 
# Define a palette
pal <- colorFactor(c("blue", "magenta"), domain = c("ship", "pirate")) 
leaflet(df) %>% addTiles() %>%
  addCircleMarkers(
    radius = ~ifelse(type == "ship", 6, 10), # r_ship=6, r_pirate=10
    color = ~pal(type), # apply palette
    stroke = FALSE, fillOpacity = 0.5
  )

# add popups
# make the content
content <- paste(sep = "<br/>", # Use Html marker as separator
  "<b><a href='http://www.samurainoodle.com'>Samurai Noodle</a></b>", 
  "606 5th Ave. S",
  "Seattle, WA 98138"
)
leaflet() %>% addTiles() %>%
  addPopups(-122.327298, 47.597131, popup = content, # Pass the html content to the popup
    options = popupOptions(closeButton = FALSE) # popupOptions() to set size and style
  )

# Create a table
df <- read.csv(textConnection("Name,Lat,Long
Samurai Noodle,47.597131,-122.327298
Kukai Ramen,47.6154,-122.327157
Tsukushinbo,47.59987,-122.326726"))
df

leaflet(df) %>% addTiles() %>% addMarkers(~Long, ~Lat, popup = ~htmlEscape(Name))  # Click to show the popup

# Label options
leaflet() %>% addTiles() %>% setView(-118.456554, 34.09, 13) %>%

  addMarkers(
    lng = -118.456554, lat = 34.105,
    label = "Default Label",
    labelOptions = labelOptions(noHide = T)) %>% # No hide popup

  addMarkers(
    lng = -118.456554, lat = 34.095,
    label = "Label w/o surrounding box",
    labelOptions = labelOptions(noHide = T, textOnly = TRUE)) %>% #only show text without boarder

  addMarkers(
    lng = -118.456554, lat = 34.085,
    label = "label w/ textsize 15px",
    labelOptions = labelOptions(noHide = T, textsize = "15px")) %>% # Change the size of label box

  addMarkers(
    lng = -118.456554, lat = 34.075,
    label = "Label w/ custom CSS style",
    labelOptions = labelOptions(noHide = T, direction = "bottom", # change the relative position to bottom
      style = list( # Change the style of the text
        "color" = "red", 
        "font-family" = "serif", 
        "font-style" = "italic",
        "box-shadow" = "3px 3px yellow", # shadow size and color
        "font-size" = "12px", 
        "border-color" = "cyan" 
      ))
    )

# Change circle shape
cities <- read.csv(textConnection("
City,Lat,Long,Pop
Boston,42.3601,-71.0589,645966
Hartford,41.7627,-72.6743,125017
New York City,40.7127,-74.0059,8406000
Philadelphia,39.9500,-75.1667,1553000
Pittsburgh,40.4397,-79.9764,305841
Providence,41.8236,-71.4222,177994
"))

leaflet(cities) %>% addTiles() %>% addCircles(lng = ~Long, lat = ~Lat, weight = 1, 
    radius = ~sqrt(Pop) * 30, popup = ~City, fillColor = "magenta", fillOpacity = 0.2)

# Rectangle
leaflet() %>% addTiles() %>% addRectangles(lng1 = -118.456554, lat1 = 34.078039, 
    lng2 = -118.436383, lat2 = 34.062717, fillColor = "transparent"  # fillColor = 'transparent' does not equal to fillColor = NULL)

# Add new polygon
path <- "E:/R_input_output/data_input/cb_2013_us_state_20m/cb_2013_us_state_20m.shp"
states <- rgdal::readOGR(path,layer = "cb_2013_us_state_20m", 
    GDAL1_integer64_policy = TRUE) # read polygon from shapte file

neStates <- subset(states, states$STUSPS %in% c( 
  "CT","ME","MA","NH","RI","VT","NY","NJ","PA"
))

leaflet(neStates) %>%
  addPolygons(color = "cyan", weight = 1, smoothFactor = 0.5,
    opacity = 1.0, fillOpacity = 0.5,
    fillColor = ~colorQuantile("YlOrRd", ALAND)(ALAND),
    highlightOptions = highlightOptions(color = "white", weight = 2, #highlight the shape
      bringToFront = TRUE))

# Simplify the polygon border to save computational resources
# To install, devtools::install_github("hrbrmstr/albersusa")
#library(albersusa)
#
#fullsize <- usa_sf()  # albersusa package sample data
#object.size(fullsize)  # object.size is an intrisic function in R
#
#simplified <- rmapshaper::ms_simplify(fullsize)
#object.size(simplified)  # simplify to 1/8 of original

# Add GeoJSON objects
filepath <- "E:/R_input_output/data_input/China.geojson"

leaflet() %>% 
  setView(lng = 106.33, lat = 29.35, zoom = 3.5) %>% # Use Chongqing as the center
  addTiles() %>% 
    addGeoJSON(geojson = filepath, 
               weight = 1, color = "magenta", fill = FALSE)

# Add TopoJSON
filepath <- "E:/R_input_output/data_input/JSON/TopoJson/China.json"

leaflet() %>% 
  setView(lng = 106.33, lat = 29.35, zoom = 3.5) %>% 
  addTiles() %>% 
    addTopoJSON(topojson = filepath, weight = 1, 
                color = "magenta", fill = FALSE)

# Add SP object
library(rgdal)

filepath <- "E:/R_input_output/data_input/JSON/TopoJson/China.json"
# filepath <- "E:/R_input_output/data_input/JSON/GeoJSON/China.geojson" 
China_map <- readOGR(filepath, stringsAsFactors = FALSE)
# China_map <-  geojsonio::geojson_read(filepath,what = "sp") 

Encoding(China_map@data$name) <- "UTF-8" # Correct the code for Chinese character
leaflet(China_map) %>% 
  setView(lng = 106.33, lat = 29.35, zoom = 3.5) %>% 
  addPolygons(stroke = TRUE, color = "magenta", smoothFactor = 0.3, 
              fillOpacity = 0.5,fillColor = "lime") %>%
  addMarkers(lng = 114.3,lat = 30.6 ) 

# Change style
library(jsonlite)

filepath <- "E:/R_input_output/data_input/JSON/TopoJson/China.json"
# filepath <- "E:/R_input_output/data_input/JSON/GeoJSON/China.geojson"

# Transfer JSON to stringfield format, then convert to multi-level list
China_map_list <- readLines(filepath, warn = FALSE) %>%
  paste(collapse = "\n") %>%
  fromJSON(simplifyVector = FALSE)

# Assign value for creating new multi-level list
China_map_list$style <- list(
  weight = 1,
  stroke = "TRUE",
  color = "magenta",
  fillColor = "lime",
  opacity = 0.5,
  fillOpacity = 0.8
)
# Use the JSON data with the changed style
leaflet() %>% setView(lng = 106.33, lat = 29.35, zoom = 3.5) %>%
  addTopoJSON(China_map_list) %>%
  # addGeoJSON(China_map_list) %>% 
  addMarkers(lng = 114.3,lat = 30.6 )


