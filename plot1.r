# read raw data

xcol <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
xraw <- read.csv("./household_power_consumption.txt", header = TRUE , sep = ";",  na.strings = "?", colClasses = xcol)  

xtime <- strptime( paste(xraw$Date, xraw$Time) , format = "%d/%m/%Y %H:%M:%S")

# only keep data where: 01/02/2007 <= t <= 02/02/2007

t1 <- strptime("01/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")
t2 <- strptime("03/02/2007 00:00:00", format = "%d/%m/%Y %H:%M:%S")

index <- which((t1 <= xtime) & (xtime < t2))

subsetdata <- xraw[index,]
xtime <- xtime[index]

rm(xraw,index)

write.table(subsetdata,"subsetdata.txt",row.names = FALSE)

##################################
#
# plot1
#
##################################

hist(subsetdata$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")

dev.copy(png, width = 480, height = 480, file = "plot1.png")
dev.off()

