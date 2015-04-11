# read data subset
subsetdata <- read.table("./subsetdata.txt", sep = " ",header = TRUE)    
xtime <- strptime( paste(subsetdata$Date, subsetdata$Time) , format = "%d/%m/%Y %H:%M:%S")

##################################
#
# plot2
#
##################################

png(filename = "plot2.png", width = 480, height = 480)

plot(xtime,subsetdata$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

# dev.copy(png, width = 480, height = 480, file = "plot2.png")
dev.off()




