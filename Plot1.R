#read data:
hpc<- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings= "?")

# Subset of data related to 2 specific days
plotdata1<- subset(hpc, (hpc$Date == "1/2/2007" | hpc$Date== "2/2/2007"))

# Fromat date:
plotdata1$Date <- as.Date(plotdata1$Date, format = "%d/%m/%Y")

# build plot:
png("plot1.png", width = 480, height = 480, bg = "transparent")
hist(plotdata1$Global_active_power, main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()
