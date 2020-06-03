## load required packages

library(dplyr)

## read the data 

data <- read.table("C:/Users/mouhanned/Documents/household_power_consumption.txt",sep = ";" , na.strings = "?",header = TRUE ,dec = ".")
 
## add the column with POSIXct date/time

data$DateTime <- as.POSIXct(strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S"))

## filter only data containing relevant days using Date column
 
sub_data <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")

## create plot 4 and save it to png

png (filename = "Plot 4.png", width = 480 , height = 480)

par(mfrow = c(2,2))

## topleft plot

plot(sub_data$DateTime, sub_data$Global_active_power, type="l", xlab = NA, ylab = "Global Active Power")

## topright plot

plot(sub_data$DateTime, sub_data$Voltage, type="l", xlab = "datetime", ylab = "voltage")

## bottom left plot

plot(sub_data$DateTime , sub_data$Sub_metering_1 ,type = "l" , xlab = NA , ylab = "Energy sub metering")

lines(sub_data$DateTime , sub_data$Sub_metering_2,type = "l",col = "red")

lines(sub_data$DateTime , sub_data$Sub_metering_3,type = "l",col = "blue")

legend("topright", legend = c(names(sub_data)[7:9]), col = c("black", "red", "blue"), lty=1, cex=0.8)

## bottom right plot

plot(sub_data$DateTime, sub_data$Global_reactive_power, type="l", xlab = "datetime", ylab = "Global Reactive Power")

dev.off()




