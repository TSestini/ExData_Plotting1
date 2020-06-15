#### Plot 2

data <- read.table("household_power_consumption.txt", sep = ";",
                   nrows = 85000, header = TRUE)

# subset and format the date and time variables
data_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
x <- paste(data_subset$Date, data_subset$Time)
x2 <- strptime(x, format = "%d/%m/%Y %H:%M:%S")

# convert submetering columns to numeric
num1 <- as.numeric(levels(data_subset$Sub_metering_1)
                   )[data_subset$Sub_metering_1]
num2 <- as.numeric(levels(data_subset$Sub_metering_2)
                   )[data_subset$Sub_metering_2]

# create png plot
getwd()
png("plot3.png", width = 480, height = 480)
plot(x2, num1, type = "n", xlab = NA,
     ylab = "Energy sub metering")
lines(x2, num1, type = "l")
lines(x2, num2, type = "l", col = "red")
lines(x2, data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",
            "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))
dev.off()
