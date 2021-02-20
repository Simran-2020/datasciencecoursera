
# Again, let's read in, name and subsett the power consumption dataset:
# Read data 
power_data<- read.table("household_power_consumption.txt",sep=";")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


## subset data from 2007-02-01 and 2007-02-02

subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt alike:
subpower_data$Date <- as.Date(subpower_data$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(subpower_data$Date), subpower_data$Time)
subpower_data$Datetime <- as.POSIXct(datetime)


# calling the basic plot functions:

par(mfrow=c(2,2))

with(subpower_data,{
  plot(subpower_data$Time,as.numeric(as.character(subpower_data$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpower_data$Time,as.numeric(as.character(subpower_data$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpower_data$Time,subpower_data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(subpower_data,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpower_data$Time,as.numeric(as.character(subpower_data$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
