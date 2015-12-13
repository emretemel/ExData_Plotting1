#reading data
ds <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?", header = TRUE,colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
ds2 <- ds[as.Date(ds$Date,"%d/%m/%Y")>="2007-02-01" & as.Date(ds$Date,"%d/%m/%Y")<="2007-02-02",]
#convert date
ds2$dateTime <- strptime(paste(ds2$Date, ds2$Time), "%d/%m/%Y %H:%M:%S")

#create png file
png("plot3.png", width=480, height=480)

#plotting
plot(ds2$dateTime, ds2$Sub_metering_1, type="l", col="black",xlab="", ylab="Energy sub metering")
lines(ds2$dateTime, ds2$Sub_metering_2, col="red")
lines(ds2$dateTime, ds2$Sub_metering_3, col="blue")

#adding legend
legend("topright", col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1)

#closing png
dev.off()