# Set the local to system to english
Sys.setlocale("LC_TIME", "English")

#Read the file 
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

#Set the Date format 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

#Subsetting the data 
data <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

#Converting the date format
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

#Plotting
par(mfrow=c(2,2))

with(data, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l",  ylab="Voltage (volt)", xlab="datetime")
  plot(Sub_metering_1~Datetime, type="l",  ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"),cex=0.4, lty=1,bty="n",legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab="Global Rective Power (kilowatts)",xlab="datetime")
})

#save the file to plot3.png
dev.copy(png,'plot4.png', width=480,height=480)
dev.off()