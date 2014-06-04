#read data:
hpc<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings= "?")

# Subset of data related to 2 specific days
plotdata<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007"))

# Format date:
plotdata$DateTime <- paste(plotdata$Date, plotdata$Time, sep=" ")
plotdata$Date <- as.Date(plotdata$Date, format="%d/%m/%Y")
plotdata$DateTime <- strptime(plotdata$DateTime, format="%d/%m/%Y %H:%M:%S")

#plotdata$Global_active_power <- as.numeric(as.character(plotdata$Global_active_power))


png(filename ="plot2.png", width = 480, height = 480, bg = "transparent")

plot(plotdata$DateTime, plotdata$Global_active_power, type = "l", ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()
