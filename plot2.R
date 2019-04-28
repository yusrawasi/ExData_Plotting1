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
#dataset <- transform(dataset, V1 = as.Date(V1,format = "%d/%m/%Y"))




dataset <- transform(dataset, V3 = as.numeric(as.character(V3)))



date_time <- strptime(paste(dataset$V1, dataset$V2, sep=" "), "%d/%m/%Y %H:%M:%S") 

date_time

png("plot2.png")


plot(datetime, dataset$V3, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
