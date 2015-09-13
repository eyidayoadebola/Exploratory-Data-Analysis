library(sqldf)
#Data<-read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')

datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(Data$Global_active_power)
png("plot2.png")
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()