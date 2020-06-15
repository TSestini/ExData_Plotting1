#### Plot 2

data <- read.table("household_power_consumption.txt", sep = ";",
                   nrows = 85000, header = TRUE)

# subset and format the date and time variables
data_subset <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]
x <- paste(data_subset$Date, data_subset$Time)
x2 <- strptime(x, format = "%d/%m/%Y %H:%M:%S")
# subset and format the Global active power variable 
num <- as.numeric(levels(data_subset$Global_active_power)
                  )[data_subset$Global_active_power]

# create png plot
getwd()
png("plot2.png", width = 480, height = 480)
plot(x2, num, type = "l", xlab = NA, ylab = "Global Active Power (kilowatts)")
dev.off()
