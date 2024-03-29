setwd("./rwd/expdata/cp1")
# creating dataframe epc that contains 2075259 obs. of 9 variables
epc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,colClasses = c("character", "character", rep("numeric", 7)), na.strings = "?")
# converting date & time variables to Date/Time class
epc$Time <- strptime(paste(epc$Date, epc$Time), "%d/%m/%Y %H:%M:%S")
epc$Date <- as.Date(epc$Date, "%d/%m/%Y")
#taking subset of epc for dates  2007-02-01 and 2007-02-02
epc <- subset(epc, epc$Date >= "2007-2-1" & epc$Date <= "2007-2-2")

plot(epc$Time, epc$Global_active_power,
     type = "l",
     ylab = "Global Active Power (Kilowatts)",
     xlab = "")
     

dev.copy(png, file = "plot2.png", width = 480, height = 480)
dev.off()
