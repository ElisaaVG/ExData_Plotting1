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
plot(data$Global_active_power~data$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#Save the file 
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()