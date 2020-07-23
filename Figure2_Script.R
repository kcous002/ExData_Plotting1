full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", nrows = 2075259, check.names = FALSE, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
data_1 <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
data_1$Date <- as.Date(data_1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_1$Date), data_1$Time)
data_1$datetime <- as.POSIXct(datetime)

with(data_1, plot(Global_active_power~datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = ""))

dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()