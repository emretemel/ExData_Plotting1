#reading data
ds <- read.csv("household_power_consumption.txt",sep = ";", na.strings = "?", header = TRUE,colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
ds2 <- ds[as.Date(ds$Date,"%d/%m/%Y")>="2007-02-01" & as.Date(ds$Date,"%d/%m/%Y")<="2007-02-02",]

#create png file
png("plot1.png", width=480, height=480)

#histogram
hist(ds2$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red")

#closing png
dev.off()