#reading data
ds <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?", header = TRUE,colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
ds2 <- ds[as.Date(ds$Date,"%d/%m/%Y")>="2007-02-01" & as.Date(ds$Date,"%d/%m/%Y")<="2007-02-02",]
#convert date
ds2$dateTime <- strptime(paste(ds2$Date, ds2$Time), "%d/%m/%Y %H:%M:%S")

#create png file
png("plot2.png", width=480, height=480)

#plotting
plot(ds2$dateTime, ds2$Global_active_power,type="l", xlab="",  ylab="Global Active Power (kilowatts)")

#closing png
dev.off()