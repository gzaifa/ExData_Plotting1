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
png("plot4.png", width = 480, height = 480)

# set up 2 columns and 2 rows
par(mfrow = c(2,2),mar = c(4,4,2,1))

# Construct
with(power_sub,
     {
       plot(DateTime, Global_active_power, 
            type = "l", 
            xlab = "" , 
            ylab = "Global Active Power")
       
       plot(DateTime, Voltage , type = "l", xlab = "datetime" , ylab = "Voltage")
       
       plot(DateTime, Sub_metering_1, 
            type = "l", 
            xlab = "" ,
            ylab = "Energy sub metering")
       
       lines(DateTime, Sub_metering_2,
             type="l", col="red")
       
       lines(DateTime, Sub_metering_3,
             type="l", col="blue")

       legend("topright", 
              bty="n",
              lwd="2",
              col=c("black", "red", "blue"), 
              legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
      
       plot(DateTime, Global_reactive_power, 
            type = "l", 
            xlab = "datetime" , 
            ylab = "Global_reactive_power") 
     }
     
     )

# Close output device
dev.off()

