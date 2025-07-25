load_data <- function() {
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?", stringsAsFactors = FALSE)
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
  data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  return(data)
}

data <- load_data()

png("plot3.png", width = 480, height = 480)
plot(data$Datetime, data$Sub_metering_1, type = "l", col = "black", 
     xlab = "", ylab = "Energy sub metering")
lines(data$Datetime, data$Sub_metering_2, col = "red")
lines(data$Datetime, data$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1)
dev.off()