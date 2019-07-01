library(sp)
library(maps)
library(maptools)


latlong2county <- function(pointsDF) {

  counties <- map('county', fill=TRUE, col="transparent", plot=FALSE)
  IDs <- sapply(strsplit(counties$names, ":"), function(x) x[1])
  counties_sp <- map2SpatialPolygons(counties, IDs=IDs,
                                     proj4string=CRS("+proj=longlat +datum=WGS84"))


  pointsSP <- SpatialPoints(pointsDF,
                            proj4string=CRS("+proj=longlat +datum=WGS84"))


  indices <- over(pointsSP, counties_sp)


  countyNames <- sapply(counties_sp@polygons, function(x) x@ID)
  countyNames[indices]
}
dat2 <- read.csv("C:/Users/Damini/PycharmProjects/GoogleStreetView/saved3.csv", header = TRUE, stringsAsFactors = FALSE)
colnames(dat2) <- c("city", "State", "lat", "lng", "months", "County")
for (row in 1:nrow(dat))
{
  long = dat[row, "lng"]
  lat = dat[row, "lat"]
  testPoints <- data.frame(x = long, y = lat)
  vec_satae_county = latlong2county(testPoints)
  county = strsplit(vec_satae_county, ",")
  print(county[[1]][2])
  dat[row, "County"] = county[[1]][2]
}

fun1 <- function(lst, n){
  sapply(lst, `[`, n)
}


testPoints <- data.frame(x = dat2$lng, y = dat2$lat)
vec_satae_county = latlong2county(testPoints)
print(vec_satae_county)
county_l = strsplit(vec_satae_county, ",")
county = fun1(county_l, 2)
dat2$County = county

