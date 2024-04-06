rm(list = ls())
setwd("R_Tutorial/Data_Science_Foundations_using_R_Specialization/ExploratoryDataAnalysis")
data <- read.csv2("household_power_consumption.txt", sep = ";",)

household2Days <- subset(data, data$Date=="1/2/2007"|data$Date=="2/2/2007" )
datetime <- strptime(paste(household2Days$Date, household2Days$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
household2Days[,3] <- as.numeric(household2Days[,3])

png("plot2.png",width = 480,height = 480)
plot(datetime,household2Days[,3],type="l",xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
