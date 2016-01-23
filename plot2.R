#Unzip the data and read txt file
unzip('exdata-data-household_power_consumption.zip')
dataset <- read.table('household_power_consumption.txt', sep = ";", header = TRUE,
                      colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric",
                                     "numeric","numeric", "numeric"), na.strings = "?")

#subset data to only February 1 and 2 of 2007

febdata <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"), ]

#create Plot2 and save as PNG then close PNG device

febdata$time <- strptime(paste(febdata$Date, febdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(febdata$time, febdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts")
dev.off()
