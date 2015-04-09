# read data subset
subsetdata <- read.table("./subsetdata.txt", sep = " ",header = TRUE)    

##################################
#
# plot2
#
##################################

plot(xtime,subsetdata$Global_active_power,
     xlab = "",
     ylab = "Global Active Power (kilowatts)",
     type = "l")

dev.copy(png, width = 480, height = 480, file = "plot2.png")
dev.off()




