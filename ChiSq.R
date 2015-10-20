setwd("~/Desktop/PABU")
molting <- read.csv("PABU_molting.csv")
wintering <- read.csv("PABU_wintering.csv")
othermolt <- read.csv("other_molting.csv")
otherwinter <- read.csv("wintering_other.csv")

migration <- read.csv("pabu_spring.csv")
othermigration <- read.csv("other_spring.csv")
colnames(migration) <- c("mo","lat","long")
colnames(othermigration) <-c("mo","lat","long")

alt <- read.csv("pabumolt.alt.csv")
otheralt <- read.csv("otherspec.alt.csv")
colnames(otheralt) <- c("mo","lat","long","alt")

colnames(molting) <- c("mo","lat","long")
colnames(wintering) <- c("mo","lat","long")
colnames(othermolt) <- c("mo","lat","long")
colnames(otherwinter) <- c("mo","lat","long")
NW_molt_PABU <- subset(molting, lat >= 21 & long <= -103)
NE_molt_PABU <- subset(molting, lat >= 21 & long >= -103)
NW_molt_other <- subset(othermolt, lat >= 21 & long <= -103)
NE_molt_other <- subset(othermolt, lat >= 21 & long >= -103)
S_molt_PABU <- subset(molting, lat <= 21)
S_molt_other <- subset(othermolt, lat <= 21)
NW_winter_PABU <- subset(wintering, lat >= 21 & long <= -103)
NW_winter_other <- subset(otherwinter, lat >= 21 & long <= -103)
S_winter_PABU <-subset(wintering, lat <= 21)
S_winter_other <-subset(otherwinter, lat <= 21)
NW_migrate_PABU <- subset(migration, lat >= 21 & long <= -103)
NE_migrate_PABU <- subset(migration, lat >= 21 & long >= -103)
NW_migrate_other <- subset(othermigration, lat >= 21 & long <= -103)
NE_migrate_other <- subset(othermigration, lat >= 21 & long >= -103)
buntings_high <-subset(alt, alt >= 500)
buntings_low <-subset(alt, alt <= 500)
other_high <- subset(otheralt, alt >= 500)
other_low <- subset(otheralt, alt <= 500)
buntings_molt <- c(398,16)
other_molt <- c(16241,7772)

#do buntings molt in NW or NE mexico?           
nwbuntings_molt <- c(308,16)
nwother_molt <- c(16241,7748)
molting3 = as.data.frame(rbind(nwbuntings_molt,nwother_molt))
chisq.test(molting3)

#do buntings move to southern mexico during the winter?
buntings_winter <- c(693,69)
other_winter <- c(81720,30180)
wintering2 = as.data.frame(rbind(buntings_winter,other_winter))
chisq.test(wintering2)

#do buntings migrate up the east or west coast?
buntings_migrate <- c(5,35)
other_migrate <- c(16465, 6704)
migrate = as.data.frame(rbind(buntings_migrate,other_migrate))
chisq.test(migrate)

#do buntings stick to the lowlands (<500m) more than other species?
buntings_elev <- c(313,86)
other_elev <- c(20721,43553)
elevation = as.data.frame(rbind(buntings_elev,other_elev))
chisq.test(elevation)





