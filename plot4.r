# read data subset
subsetdata <- read.table("./subsetdata.txt", sep = " ",header = TRUE)    
xtime <- strptime( paste(subsetdata$Date, subsetdata$Time) , format = "%d/%m/%Y %H:%M:%S")

##################################
#
# plot4
#
##################################

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

par(lwd = 2)
plot(xtime,subsetdata$Global_active_power,
     xlab = "datetime",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

par(lwd = 1)
plot(xtime,subsetdata$Voltage,
     xlab = "datetime",
     ylab = "Voltage (volts)",
     type = "l")

par(lwd = 2)
plot(xtime,subsetdata$Sub_metering_1,
     xlab = "datetime",
     ylab = "Energy sub metering (kilowatts)",
     type = "n",
)
points(xtime,subsetdata$Sub_metering_1,type = "l", col = "black")
points(xtime,subsetdata$Sub_metering_2,type = "l", col = "red")
points(xtime,subsetdata$Sub_metering_3,type = "l", col = "blue")

legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = c(1,1,1), bty = "n", cex = 0.75)

par(lwd = 1)
plot(xtime,subsetdata$Global_reactive_power,
     xlab = "datetime",
     ylab = "Global Reactive Power (kilowatts)",
     type = "l")

#dev.copy(png, width = 480, height = 480, file = "plot4.png")
dev.off()





