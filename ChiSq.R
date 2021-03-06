#### chi-sq tests for significance of painted bunting specimen record densities ####

setwd("~/Desktop/PABU")

#read in data
molting <- read.csv("PABU_molting.csv")
wintering <- read.csv("PABU_wintering_2.csv")
othermolt <- read.csv("other_molting.csv")
otherwinter <- read.csv("wintering_other_2.csv")
migration <- read.csv("pabu_spring.csv")
migration_2 <- read.csv("pabu_april.csv") #testing varied seasonal assignments for spring migration
migration_3 <- read.csv("pabu_aprilmay.csv")
migration_4 <- read.csv("pabu_marchapril.csv")
othermigration <- read.csv("other_spring.csv")
othermigration_2 <- read.csv("other_april.csv")
othermigration_3 <- read.csv("other_aprilmay.csv")
othermigration_4 <- read.csv("other_marchapril.csv")
alt <- read.csv("pabumolt.alt.csv")
otheralt <- read.csv("otherspec.alt.csv")

#attach column names
colnames(otheralt) <- c("mo","lat","long","alt")
colnames(molting) <- c("mo","lat","long")
colnames(wintering) <- c("mo","lat","long")
colnames(othermolt) <- c("mo","lat","long")
colnames(otherwinter) <- c("mo","lat","long")
colnames(migration) <- c("mo","lat","long")
colnames(migration_2) <- c("mo","lat","long")
colnames(migration_3) <- c("mo","lat","long")
colnames(migration_4) <- c("mo","lat","long")
colnames(othermigration) <-c("mo","lat","long")
colnames(othermigration_2) <-c("mo","lat","long")
colnames(othermigration_3) <-c("mo","lat","long")
colnames(othermigration_4) <-c("mo","lat","long")

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
S_winter_PABU_noyucatan <-subset(wintering, lat <= 21 & long <= -94)
S_winter_other_noyucatan <-subset(otherwinter, lat <= 21 & long <= -94)
NW_migrate_PABU <- subset(migration, lat >= 21 & long <= -103)
NE_migrate_PABU <- subset(migration, lat >= 21 & long >= -103)
NW_migrate_PABU_2 <- subset(migration_2, lat >= 21 & long <= -103)
NE_migrate_PABU_2 <- subset(migration_2, lat >= 21 & long >= -103)
NW_migrate_PABU_3 <- subset(migration_3, lat >= 21 & long <= -103)
NE_migrate_PABU_3 <- subset(migration_3, lat >= 21 & long >= -103)
NW_migrate_PABU_4 <- subset(migration_4, lat >= 21 & long <= -103)
NE_migrate_PABU_4 <- subset(migration_4, lat >= 21 & long >= -103)
NW_migrate_other <- subset(othermigration, lat >= 21 & long <= -103)
NE_migrate_other <- subset(othermigration, lat >= 21 & long >= -103)
NW_migrate_other_2 <- subset(othermigration_2, lat >= 21 & long <= -103)
NE_migrate_other_2 <- subset(othermigration_2, lat >= 21 & long >= -103)
NW_migrate_other_3 <- subset(othermigration_3, lat >= 21 & long <= -103)
NE_migrate_other_3 <- subset(othermigration_3, lat >= 21 & long >= -103)
NW_migrate_other_4 <- subset(othermigration_4, lat >= 21 & long <= -103)
NE_migrate_other_4 <- subset(othermigration_4, lat >= 21 & long >= -103)
buntings_high <-subset(alt, alt >= 200)
buntings_low <-subset(alt, alt <= 200)
other_high <- subset(otheralt, alt >= 200)
other_low <- subset(otheralt, alt <= 200)

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

#are these conclusions affected if birds from the Yucatan (putative SE USA migrants) are excluded?

c2 <-nrow(S_winter_PABU_noyucatan)
d2 <-nrow(NW_winter_PABU)
e2 <-nrow(S_winter_other_noyucatan)
f2 <-nrow(NW_winter_other)
buntings_winter_noyucatan <- c(c2,d2)
other_winter_noyucatan <- c(e2,f2)
wintering3 = as.data.frame(rbind(buntings_winter_noyucatan,other_winter_noyucatan))
chisq.test(wintering3)


#do buntings migrate up the east or west coast?
#original seasonal assingment
i <- nrow(NW_migrate_PABU)
j <- nrow(NE_migrate_PABU)
k <- nrow(NW_migrate_other)
l <- nrow(NE_migrate_other)
buntings_migrate <- c(i,j)
other_migrate <- c(k,l)
migrate = as.data.frame(rbind(buntings_migrate,other_migrate))
chisq.test(migrate)

#testing april alone
q <- nrow(NW_migrate_PABU_2)
r <- nrow(NE_migrate_PABU_2)
s <- nrow(NW_migrate_other_2)
t <- nrow(NE_migrate_other_2)
buntings_migrate_2 <- c(q,r)
other_migrate_2 <- c(s,t)
migrate_2 = as.data.frame(rbind(buntings_migrate_2,other_migrate_2))
chisq.test(migrate_2)

#testing april + may
u <- nrow(NW_migrate_PABU_3)
v <- nrow(NE_migrate_PABU_3)
w <- nrow(NW_migrate_other_3)
x <- nrow(NE_migrate_other_3)
buntings_migrate_3 <- c(u,v)
other_migrate_3 <- c(w,x)
migrate_3 = as.data.frame(rbind(buntings_migrate_3,other_migrate_3))
chisq.test(migrate_3)

#testing march + april
y <- nrow(NW_migrate_PABU_4)
z <- nrow(NE_migrate_PABU_4)
a2 <- nrow(NW_migrate_other_4)
b2 <- nrow(NE_migrate_other_4)
buntings_migrate_4 <- c(y,z)
other_migrate_4 <- c(a2,b2)
migrate_4 = as.data.frame(rbind(buntings_migrate_4,other_migrate_4))
chisq.test(migrate_4)

#do buntings stick to the lowlands (<200m) more than other species?
m <- nrow(buntings_high)
n <- nrow(buntings_low)
o <- nrow(other_high)
p <- nrow(other_low)
buntings_elev <- c(m,n)
other_elev <- c(o,p)
elevation = as.data.frame(rbind(buntings_elev,other_elev))
chisq.test(elevation)





