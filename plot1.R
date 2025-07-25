
unzip("/Users/nidhi/ExData_Plotting1/exdata_data_household_power_consumption.zip", 
      exdir = "/Users/nidhi/ExData_Plotting1/")

# working directory
setwd("/Users/nidhi/ExData_Plotting1/")

load_data <- function() {
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?", stringsAsFactors = FALSE)
  
     data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
  
data$Datetime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
  
  return(data)
}

load_data <- function() {
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",
                     na.strings = "?", stringsAsFactors = FALSE)
  data <- data[data$Date %in% c("1/2/2007", "2/2/2007"), ]
  data$Datetime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
  return(data)
}

data <- load_data()

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.off()

