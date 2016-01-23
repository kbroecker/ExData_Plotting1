#Unzip the data and read txt file
unzip('exdata-data-household_power_consumption.zip')
dataset <- read.table('household_power_consumption.txt', sep = ";", header = TRUE,
                      colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric",
                                     "numeric","numeric", "numeric"), na.strings = "?")

#subset data to only February 1 and 2 of 2007

febdata <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"), ]


#Create Plot1 histogram and save as PNG and close PNG device

png("plot1.png", width=480, height=480)
hist(febdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     col="red")
dev.off()

