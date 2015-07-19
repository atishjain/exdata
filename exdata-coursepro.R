setwd("C:/exdata-data-household_power_consumption")
#head -n 1 ./household_power_consumption.txt > ./data/feb2007data.txt
#cat household_power_consumption.txt  | grep '^0\{0,1\}[12]/0\{0,1\}2/2007' >> ./data/feb2007data.txt

datafile <- "feb2007data.txt"
data <- read.table(datafile, sep = ";", header = T, na.strings = "?")
data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")

hist(data$Global_active_power, main = "Global Active Power", ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)", col = "red", breaks = 13, ylim = c(0, 
                                                                                  1200), xlim = c(0, 6), xaxp = c(0, 6, 3))

plot(data$Datetime, data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")


plot(data$Datetime, data$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Energy sub metering", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"))


par(mfrow = c(2, 2))

# plot 1 (NW)
plot(data$Datetime, data$Global_active_power, type = "l", ylab = "Global Active Power", 
     xlab = "")

# plot 2 (NE)
plot(data$Datetime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

# plot 3 (SW)
plot(data$Datetime, data$Sub_metering_1, type = "l", ylab = "Energy sub metering", 
     xlab = "", col = "black")
points(data$Datetime, data$Sub_metering_2, type = "l", xlab = "", ylab = "Sub_metering_2", 
       col = "red")
points(data$Datetime, data$Sub_metering_3, type = "l", xlab = "", ylab = "Sub_metering_3", 
       col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", 
                                                                        "Sub_metering_2", "Sub_metering_3"), bty = "n", )

# plot 4 (SE)
plot(data$Datetime, data$Global_reactive_power, type = "l", xlab = "datetime", 
     ylab = "Global_reactive_power", ylim = c(0, 0.5))