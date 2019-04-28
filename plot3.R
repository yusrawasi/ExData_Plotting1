library(dplyr)
library(readr)

dataset = read.csv("household_power_consumption.txt", header = FALSE, sep = ";")

head(dataset)


dim(dataset)

str(dataset)


dataset <- transform(dataset,V1 = as.character(V1), V7 =as.character(V7), V8 =as.character(V8),
                     V9 =as.character(V9))


dataset <- filter(dataset, V1 == "1/2/2007" | V1 == "2/2/2007")
head(dataset)
dim(dataset)



date_time <- strptime(paste(dataset$V1, dataset$V2, sep=" "), "%d/%m/%Y %H:%M:%S") 

date_time





png("plot3.png")


plot(datetime, dataset$V7, type="l", xlab="", ylab="Energy sub metering")

points(datetime, dataset$V8, type="l", col = "red")

points(datetime, dataset$V9, type="l", col = "blue")

legend("topright", col = c("black","red", "blue") , 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ) , lty = 1)

dev.off()