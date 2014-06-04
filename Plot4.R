#read data:
hpc<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings= "?")

# Subset of data related to 2 specific days
plotdata<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007"))

# Format date:
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time, sep=" ")
plotdata$Date <- as.Date(plotdata$Date, format="%d/%m/%Y")
plotdata$DateTime <- strptime(plotdata$DateTime, format="%d/%m/%Y %H:%M:%S")


# Create plot4:
png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

plot(plotdata$DateTime, plotdata$Global_active_power, type="l", ylab= "Global Active Power", xlab="")

plot(plotdata$DateTime, plotdata$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(plotdata$DateTime, plotdata$Sub_metering_2, type="l", col="red")
lines(plotdata$DateTime, plotdata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(plotdata$DateTime,plotdata$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(plotdata$DateTime,plotdata$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")

dev.off()
