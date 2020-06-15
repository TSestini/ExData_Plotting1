#### Plot 1

data <- read.table("household_power_consumption.txt", sep = ";",
                   nrows = 100000, header = TRUE)

data$Date <- as.Date(data$Date, "%d/%m/%Y")

# subset data for 2007-02-01 and 2007-02-02
data_subset <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",]

# convert Global_active_power to numeric
num <- as.numeric(levels(data_subset$Global_active_power)
                  )[data_subset$Global_active_power]
str(num)

# export plot to png
getwd()
png("plot1.png", width = 480, height = 480)
hist(num, main = "Global Active Power", ylab = "Frequency",
     xlab = "Global Active Power (Kilowatts)", col = "red")
dev.off()




