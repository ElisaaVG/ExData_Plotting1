
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
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

#Save the file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()