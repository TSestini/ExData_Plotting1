#### Plot 4

data <- read.table("household_power_consumption.txt", sep = ";",
                   nrows = 85000, header = TRUE)

# subset and format the date and time variables
data_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
x <- paste(data_subset$Date, data_subset$Time)
x2 <- strptime(x, format = "%d/%m/%Y %H:%M:%S")

# first plot variable setup
# convert Global_active_power to numeric
gap <- as.numeric(levels(data_subset$Global_active_power)
                  )[data_subset$Global_active_power]

# second plot variable set up
# convert volatage into numeric variable
volt <- as.numeric(levels(data_subset$Voltage)
                   )[data_subset$Voltage]

# third plot variable set up
submet1 <- as.numeric(levels(data_subset$Sub_metering_1)
                      )[data_subset$Sub_metering_1]
submet2 <- as.numeric(levels(data_subset$Sub_metering_2)
                      )[data_subset$Sub_metering_2]

# fourth plot variable set up
grp <- as.numeric(levels(data_subset$Global_reactive_power)
                  )[data_subset$Global_reactive_power]


### commence plotting

# export plot to png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
# first plot
plot(x2, gap, type = "l", xlab = NA, ylab = "Global Active Power")
# second plot
plot(x2, volt, type = "l", xlab = "datetime", ylab = "Voltage")
# third plot
plot(x2, submet1, type = "n", xlab = NA,
     ylab = "Energy sub metering")
lines(x2, submet1, type = "l")
lines(x2, submet2, type = "l", col = "red")
lines(x2, data_subset$Sub_metering_3, type = "l", col = "blue")
legend("topright", inset = c(0.01, 0.01), box.lwd = 0, cex = 0.75, lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2",
                  "Sub_metering_3"), col = c("black", "red", "blue"))
# fourth plot
plot(x2, grp, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
