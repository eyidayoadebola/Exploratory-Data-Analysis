library(sqldf)

Data<-read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')
datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(Data$Global_active_power)
globalReactivePower <- as.numeric(Data$Global_reactive_power)
Voltage <- as.numeric(Data$Voltage)
Submetering1 <- as.numeric(Data$Sub_metering_1)
Submetering2 <- as.numeric(Data$Sub_metering_2)
Submetering3 <- as.numeric(Data$Sub_metering_3)


png("plot4.png")
par(mfrow = c(2, 2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, Submetering1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, Submetering2, type="l", col="red")
lines(datetime, Submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()