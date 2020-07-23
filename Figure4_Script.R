full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_1 <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_1$Date), data_1$Time)
data_1$datetime <- as.POSIXct(datetime)

par(mfrow= c(2,2), mar=c(4,4,2,1), oma = c(0,0,2,0))
with(data_1, {
  plot(Global_active_power~datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(Voltage~datetime, type = "l", ylab = "Voltage (volt)", xlab = "")
  plot(Sub_metering_1~datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2~datetime, col = "red")
  lines(Sub_metering_3~datetime, col = "blue")
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd = 2, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~datetime, type = "l", ylab = "Global Reactive Power (kilowatt)", xlab = "")
})

dev.copy(png, file="plot4.png", height=480, width = 480)
dev.off()
