#plot1

library(dplyr)
library(readr)

dataset = read.csv("household_power_consumption.txt", header = FALSE, sep = ";")

head(dataset)


dim(dataset)

str(dataset)


dataset <- transform(dataset,V1 = as.character(V1))


dataset <- filter(dataset, V1 == "1/2/2007" | V1 == "2/2/2007")
head(dataset)
dim(dataset)

#as.Date(dataset$V1,format = "%d/%m/%Y")
dataset <- transform(dataset, V1 = as.Date(V1,format = "%d/%m/%Y"))


#strptime(dataset$V2,format = "%H:%M:%S")
#dataset <- transform(dataset, V2 = strptime(V2,format = "%H:%M:%S"))


dataset <- transform(dataset, V3 = as.numeric(as.character(V3)))

#plotting
png("plot1.png")

hist(dataset$V3 , col = "red" , xlab = "Global Active Power (killowatts)", main = "Global Active Power")

dev.off()