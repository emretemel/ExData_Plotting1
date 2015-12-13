#reading data
ds <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?", header = TRUE,colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
ds2 <- ds[as.Date(ds$Date,"%d/%m/%Y")>="2007-02-01" & as.Date(ds$Date,"%d/%m/%Y")<="2007-02-02",]
#convert date
ds2$dateTime <- strptime(paste(ds2$Date, ds2$Time), "%d/%m/%Y %H:%M:%S")

#create png file
png("plot4.png", width=480, height=480)

#2x2 plot area
par(mfrow=c(2,2))

# plot1
plot(ds2$dateTime, ds2$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# plot2
plot(ds2$dateTime, ds2$Voltage, type="l",xlab="datetime", ylab="Voltage")

# plot3
plot(ds2$dateTime, ds2$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(ds2$dateTime, ds2$Sub_metering_2, col="red")
lines(ds2$dateTime, ds2$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), bty="n")

# plot4
plot(ds2$dateTime, ds2$Global_reactive_power, type="l",xlab="datetime", ylab="Global_reactive_power")

#closing png
dev.off()