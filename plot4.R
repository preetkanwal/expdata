setwd("./rwd/expdata/cp1")
# creating dataframe epc that contains 2075259 obs. of 9 variables
epc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
# converting date & time variables to Date/Time class
epc$Time <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
#taking subset of epc for dates  2007-02-01 and 2007-02-02
epc <- subset(epc, epc$Date >= "2007-2-1" & epc$Date <= "2007-2-2")

par(mfrow=c(2,2), mar = c(10, 6, 4, 2), cex=.5)
# First Plot
plot(epc$Time, epc$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power")

# Second Plot
plot(epc$Time, epc$Voltage, type="l",
     xlab="datetime", ylab="Voltage")

# Third Plot
plot(epc$Time, epc$Sub_metering_1, type="l", col="black",
     xlab="", ylab="Energy sub metering")
lines(epc$Time, epc$Sub_metering_2, col="red")
lines(epc$Time, epc$Sub_metering_3, col="blue")
legend("topright", bty = "n", lty = c(1,1), lwd = c(1,1,1),
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex = 1.1)

# Fourth Plot
plot(epc$Time, epc$Global_reactive_power, type="n",
     xlab="datetime", ylab="Global_reactive_power")
lines(epc$Time, epc$Global_reactive_power)


dev.copy(png, file = "plot3.png", width = 480, height = 480)
dev.off()
