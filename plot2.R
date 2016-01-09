    # Read in the data file on the working directory
power <- read.table(file = "household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")

# Cast the Date to Date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Subset the required data 2007-02-01 and 2007-02-02
power_sub <- subset(power, subset=(Date >= "2007-02-01" & Date<="2007-02-02"))

# Check that the subset data is correct.
# table(power_sub$Date)

# Combine Date and Time
x <- paste(power_sub$Date, power_sub$Time)

# Cast to Time
power_sub$DateTime <- as.POSIXct(x)

# Define output device
png("plot2.png", width = 480, height = 480)

# Construct histogram
plot(power_sub$DateTime, power_sub$Global_active_power,
     type="l", 
     ylab="Global Active Power (kilowatts)",
     xlab="")

# Close output device
dev.off()

