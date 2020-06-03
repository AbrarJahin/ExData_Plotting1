## load required packages

library(dplyr)

##read the data 

data <- read.table("C:/Users/mouhanned/Documents/household_power_consumption.txt", header = TRUE , sep = ";" ,na.strings="?", dec = ".")

##add column with POSIXct date/time

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

## filter only data containing relevant days using Date column

sub_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

##create plot 2 and save it to png

png(filename = "Plot 2.png", width = 480, height = 480)

plot(sub_data$DateTime, sub_data$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power (kilowatts)")

dev.off()
