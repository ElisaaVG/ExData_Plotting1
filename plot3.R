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
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), cex=0.8)

#save the file to plot3.png
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()