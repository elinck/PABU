#### chi-sq tests for significance of painted bunting specimen record densities

setwd("~/Desktop/PABU")

#read in data
molting <- read.csv("PABU_molting.csv")
wintering <- read.csv("PABU_wintering.csv")
othermolt <- read.csv("other_molting.csv")
otherwinter <- read.csv("wintering_other.csv")
migration <- read.csv("pabu_spring.csv")
othermigration <- read.csv("other_spring.csv")
alt <- read.csv("pabumolt.alt.csv")
otheralt <- read.csv("otherspec.alt.csv")

#attach column names
colnames(otheralt) <- c("mo","lat","long","alt")
colnames(molting) <- c("mo","lat","long")
colnames(wintering) <- c("mo","lat","long")
colnames(othermolt) <- c("mo","lat","long")
colnames(otherwinter) <- c("mo","lat","long")
colnames(migration) <- c("mo","lat","long")
colnames(othermigration) <-c("mo","lat","long")

#subset seasonal data by region, altitude for subsequent tests
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

#do buntings molt in NW or NE mexico?
a <- nrow(NW_molt_PABU)
b <- nrow(NE_molt_PABU)
c <- nrow(NW_molt_other)
d <- nrow(NE_molt_other)
nwbuntings_molt <- c(a,b)
nwother_molt <- c(c,d)
molting3 = as.data.frame(rbind(nwbuntings_molt,nwother_molt))
chisq.test(molting3)

#do buntings move to southern mexico during the winter?
e <-nrow(S_winter_PABU)
f <-nrow(NW_winter_PABU)
g <-nrow(S_winter_other)
h <-nrow(NW_winter_other)
buntings_winter <- c(e,f)
other_winter <- c(g,h)
wintering2 = as.data.frame(rbind(buntings_winter,other_winter))
chisq.test(wintering2)

#do buntings migrate up the east or west coast?
i <- nrow(NW_migrate_PABU)
j <- nrow(NE_migrate_PABU)
k <- nrow(NW_migrate_other)
l <- nrow(NE_migrate_other)
buntings_migrate <- c(i,j)
other_migrate <- c(k,l)
migrate = as.data.frame(rbind(buntings_migrate,other_migrate))
chisq.test(migrate)

#do buntings stick to the lowlands (<500m) more than other species?
m <- nrow(buntings_high)
n <- nrow(buntings_low)
o <- nrow(other_high)
p <- nrow(other_low)
buntings_elev <- c(m,n)
other_elev <- c(o,p)
elevation = as.data.frame(rbind(buntings_elev,other_elev))
chisq.test(elevation)





