data <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, sep = ';', header = TRUE, dec = '.')
reqdata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
datetime <- strptime(paste(reqdata$Date, reqdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
gap <- as.numeric(reqdata$Global_active_power)
png("plot2.png",width = 480, height = 480)
plot(datetime, gap, type =  'l', xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()