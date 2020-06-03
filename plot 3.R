## load required packages

library(dplyr)

## read the data

data <- read.table("C:/Users/mouhanned/Documents/household_power_consumption.txt", header = TRUE , sep = ";" ,na.strings="?", dec = ".")

##add column with POSIXct date/time
 
data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S"))

## filter only data containing relevant days using Date column

sub_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

## create plot 3 and save it to png

png (filename = "Plot 3.png", width = 480 , height = 480)

plot(sub_data$DateTime , sub_data$Sub_metering_1 ,type = "l" , xlab = NA , ylab = "Energy sub metering")

## adding sub_metering 2

lines(sub_data$DateTime , sub_data$Sub_metering_2,type = "l",col = "red")

## adding sub_metering 3

lines(sub_data$DateTime , sub_data$Sub_metering_3,type = "l",col = "blue")

## adding legend

legend("topright", legend = c(names(sub_data)[7:9]), col = c("black", "red", "blue"), lty=1, cex=0.8)

dev.off()