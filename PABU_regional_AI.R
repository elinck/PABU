#### generating abundance indices for painted buntings and reference specimens by region and month

setwd("~/Desktop/PABU")

#read in data
pabu <- read.csv("pabu.csv")
other <- read.table("other_specimens.txt", sep="\t")

#attach column names
colnames(pabu) <- c("mo","lat","long")
colnames(other) <- c("mo","lat","long")

#calculate AI values per month for NW mexico 
indices <- c() #create an empty vector 
for (i in 1:12){
a <- nrow(subset(pabu, lat >= 21 & long <= -103 & mo==i)) #determine number of bunting specimens for each month
b <- nrow(subset(other, lat >= 21 & long <= -103 & mo==i)) #determine number of reference specimens for each month
c <- (a/b)*100 #calculate AIs
indices <- append(indices,c)
}
indices <- data.frame(indices,c(1:12))
colnames(indices) <- c("AI","month")

#calculate AI values per month for NE mexico  
indices2 <- c() 
for (i in 1:12){  
d <- nrow(subset(pabu, lat >= 21 & long >= -103 & mo==i))
e <- nrow(subset(other, lat >= 21 & long >= -103 & mo==i)) 
f <- (d/e)*100
indices2 <- append(indices2,f) 
}
indices2 <- data.frame(indices2,c(1:12))
colnames(indices2) <- c("AI","month")

#calculate AI values per month for NE mexico  
indices3 <- c()
for (i in 1:12){
g <- nrow(subset(pabu, lat <= 21 & mo==i))
h <- nrow(subset(other, lat <= 21 & mo==i)) 
j <- (g/h)*100
indices3 <- append(indices3,j) 
}
indices3 <- data.frame(indices3,c(1:12))
colnames(indices3) <- c("AI","month")

### thanks to cj battey for the help! 










