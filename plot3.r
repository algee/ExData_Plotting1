# read data subset
subsetdata <- read.table("./subsetdata.txt", sep = " ",header = TRUE)    
xtime <- strptime( paste(subsetdata$Date, subsetdata$Time) , format = "%d/%m/%Y %H:%M:%S")

##################################
#
# plot3
#
##################################

png(filename = "plot3.png", width = 480, height = 480)

par(lwd = 2)

plot(xtime,subsetdata$Sub_metering_1,
     xlab = "",
     ylab = "Energy sub metering",
     type = "n",
     )
points(xtime,subsetdata$Sub_metering_1,type = "l", col = "black")
points(xtime,subsetdata$Sub_metering_2,type = "l", col = "red")
points(xtime,subsetdata$Sub_metering_3,type = "l", col = "blue")
legend("topright", 
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col = c("black","red","blue"), lty = c(1,1,1))

# dev.copy(png, width = 480, height = 480, file = "plot3.png")
dev.off()




