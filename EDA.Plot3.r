
# Read data 
power_data<- read.table("household_power_consumption.txt",sep=";")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


## subset data from 2007-02-01 and 2007-02-02

subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")
subpower_data$Date <- as.Date(subpower_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpower_data$Date), subpower_data$Time)
subpower_data$Datetime <- as.POSIXct(datetime)

# calling the basic plot function:

plot(subpower_data$Time,subpower_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# annotating graph:
title(main="Energy sub-metering")
