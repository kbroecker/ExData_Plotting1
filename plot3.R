#Unzip the data and read txt file
unzip('exdata-data-household_power_consumption.zip')
dataset <- read.table('household_power_consumption.txt', sep = ";", header = TRUE,
                      colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric",
                                     "numeric","numeric", "numeric"), na.strings = "?")

#subset data to only February 1 and 2 of 2007

febdata <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"), ]

# create plot3 save as PNG then close PNG device
png("plot3.png", width=480, height=480)

febdata$time <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(febdata$time, febdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(febdata$time, febdata$Sub_metering_2, type="l", col = "red" )
lines(febdata$time, febdata$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
