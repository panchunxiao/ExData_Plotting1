rm(list = ls())
setwd("R_Tutorial/Data_Science_Foundations_using_R_Specialization/ExploratoryDataAnalysis")
data <- read.csv2("household_power_consumption.txt", sep = ";",)
household2Days <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007" )
datetime <- strptime(paste(household2Days$Date, household2Days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

household2Days[,3] <- as.numeric(household2Days[,3])
household2Days[,5] <- as.numeric(household2Days[,5])
household2Days[,7] <- as.numeric(household2Days[,7])
household2Days[,8] <- as.numeric(household2Days[,8])
household2Days[,9] <- as.numeric(household2Days[,9])

plot(datetime, household2Days[,4],type = "l", ylab="Global_Active_Power")

png("plot4.png", width = 480,height = 480)
par(mfrow=c(2,2))
plot(datetime,household2Days[,3],type="l",xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime,household2Days[,5],type = "l",ylab = "Voltage")

with(household2Days,
     plot(datetime,household2Days[,7],type="l", xlab="", ylab="Energy sub metering")
)
lines(datetime,household2Days[,8],type="l",col="red")
lines(datetime,household2Days[,9],type="l",col="blue")
legend("topright", c("sub_metering_1","sub_metering_2","sub_metering_3"), lty=1,lwd=2,col=c("black","red","blue"))

plot(datetime, household2Days[,4],type = "l", ylab="Global_Active_Power")

dev.off()
 