    # Read in the data file on the working directory
power <- read.table(file = "household_power_consumption.txt", header= TRUE, sep=";", na.strings = "?")

# Cast the Date to Date format
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

# Subset the required data 2007-02-01 and 2007-02-02
power_sub <- subset(power, subset=(Date >= "2007-02-01" & Date<="2007-02-02"))

# Check that the subset data is correct.
# table(power_sub$Date)

# Cast to Time

# Define output device
png("plot3.png", width = 480, height = 480)

# Construct
with(power_sub,
     {
       plot(DateTime, Sub_metering_1,
            type="l", 
            ylab="Energy sub metering",
            xlab="")
       
       lines(DateTime, Sub_metering_2,
             type="l", col="red")
       
       lines(DateTime, Sub_metering_3,
             type="l", col="blue")

       legend("topright", 
              lwd=2,
              col=c("black", "red", "blue"), 
              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
       
     }
     
     )

# Close output device
dev.off()

