file <- read.csv("household_power_consumption.txt", sep=";", na.strings='?', header=TRUE, colClasses = c("character", "factor", rep("numeric",7)))
selection <- subset(file, Date == "1/2/2007" | Date == "2/2/2007")

date <- selection$Date
time <- selection$Time

plot(strptime(paste(date,time),"%d/%m/%Y %H:%M:%S"), selection$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(strptime(paste(date,time),"%d/%m/%Y %H:%M:%S"), selection$Sub_metering_2,col="red")
lines(strptime(paste(date,time),"%d/%m/%Y %H:%M:%S"), selection$Sub_metering_3,col="blue")
legend(cex=0.7,"topright", lty=c(rep(1,3)), col = c("black","red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file = "plot3.png")
dev.off()