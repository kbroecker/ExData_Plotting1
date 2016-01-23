#Unzip the data and read txt file
unzip('exdata-data-household_power_consumption.zip')
dataset <- read.table('household_power_consumption.txt', sep = ";", header = TRUE,
                      colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric",
                                     "numeric","numeric", "numeric"), na.strings = "?")

#subset data to only February 1 and 2 of 2007 and create time variable

febdata <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"), ]
febdata$time <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")


#create plot4 save as png then close png device

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(febdata$time, febdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", cex=0.2)

plot(febdata$time, febdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(febdata$time, febdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(febdata$time, febdata$Sub_metering_2, type="l", col = "red" )
lines(febdata$time, febdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue") )

plot(febdata$time, febdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()