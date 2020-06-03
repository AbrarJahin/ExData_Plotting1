##load requisite packages
library(dplyr)

##read data from file
data <- read.table("C:/Users/mouhanned/Documents/household_power_consumption.txt", sep = ";", na.strings="?", header=TRUE)

##add column with POSIXct date/time

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

##filter only data containing relevant days using Date column

sub_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")


## save the plot to png

png(filename = "Plot 1.png", width = 480, height = 480)


##create plot 1

hist(sub_data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power")
dev.off()