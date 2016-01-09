# Read in the data file on the working directory
power <- read.table(file = "household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")

# Cast the Date to Date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Subset the required data 2007-02-01 and 2007-02-02
power_sub <- subset(power, subset=(Date >= "2007-02-01" & Date<="2007-02-02"))

# Check that the subset data is correct.
# table(power_sub$Date)

# Define output device
png("plot1.png", width = 480, height = 480)

# Construct histogram
hist(power_sub$Global_active_power, 
     col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

# Close output device
dev.off()

