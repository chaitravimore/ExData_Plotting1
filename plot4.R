data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ';', header = TRUE, dec = '.')
reqdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

datetime <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(reqdata$Global_active_power)
grp <- as.numeric(reqdata$Global_reactive_power)
v <- as.numeric(reqdata$Voltage)
s1 <- as.numeric(reqdata$Sub_metering_1)
s2 <- as.numeric(reqdata$Sub_metering_2)
s3 <- as.numeric(reqdata$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

plot(datetime, gap, type =  'l', xlab = "", ylab = "Global Active Power")
plot(datetime, v, type = 'l', xlab = "datetime", ylab = "Voltage")
plot(datetime, s1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(datetime, s2, type = 'l', col = 'red')
lines(datetime, s3, type = 'l', col = 'blue')
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black","red","blue"), bty = 'n')
plot(datetime, grp, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")
dev.off()