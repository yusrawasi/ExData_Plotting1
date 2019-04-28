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

dataset <- transform(dataset, V3 = as.numeric(as.character(V3))  ,
                     V4= as.numeric(as.character(V4)) ,V5 = as.character(V5))


#plotting

png("plot4.png")

par(mfrow=c(2,2))

#Global active power
plot(datetime, dataset$V3, type="l", xlab="", ylab="Global Active Power")


#voltage
plot(datetime, dataset$V5, type="l", xlab="datetime", ylab="Voltage")


#Energy Sub_metering

plot(datetime, dataset$V7, type="l", xlab="", ylab="Energy sub metering")

points(datetime, dataset$V8, type="l", col = "red")

points(datetime, dataset$V9, type="l", col = "blue")

legend("topright", col = c("black","red", "blue") , 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3" ) , lty = 1, bty = "n")


#Global Reactive Power

plot(datetime, dataset$V4, type="l", xlab="", ylab="Global_reactive_power")


dev.off()
