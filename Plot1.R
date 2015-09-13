library(sqldf)

Data<-read.csv.sql("household_power_consumption.txt", sql = " select * from file where Date='1/2/2007' or Date='2/2/2007'", header=TRUE, sep=';')
png("plot1.png")
hist(Data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency",col="orangered")
dev.off()