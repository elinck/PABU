setwd("~/Desktop/PABU")
library(raster)
#extact altitude for buntings
pabu<-read.csv("PABU_molting.csv")
colnames(pabu) <- c("mo","lat","long")
latlong<-data.frame(pabu$long, pabu$lat)
alt<-raster("~/Downloads/alt_30s_bil/alt.bil")
pabu.alt<-extract(alt,latlong)
pabu$alt <-pabu.alt
write.csv(pabu, file="pabumolt.alt.csv")

#extract altitude for other specimens
other<-read.csv("other_molting.csv")
colnames(other) <- c("mo","lat","long")
latlong_other<-data.frame(other$long, other$lat)
alt_other<-raster("~/Downloads/alt_30s_bil/alt.bil")
other.alt<-extract(alt_other,latlong_other, NA.rm=TRUE)
other$other.alt <-other.alt
write.csv(other, file="othermolt.alt.csv")
