load_data <- function() {
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?", stringsAsFactors = FALSE)
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
  data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  return(data)
}

data <- load_data()

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Top-left
plot(data$Datetime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

# Top-right
plot(data$Datetime, data$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage")

# Bottom-left
plot(data$Datetime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", bty = "n", lty = 1, 
       col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Bottom-right
plot(data$Datetime, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global Reactive Power")

dev.off()

