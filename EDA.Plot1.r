
# Read data 
power_data<- read.table("household_power_consumption.txt",sep=";")
names(power_data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


## subset data from 2007-02-01 and 2007-02-02

subpower_data <- subset(power_data,power_data$Date=="1/2/2007" | power_data$Date =="2/2/2007")



#plot the histogram of Global active Power using the basic plot function:
print("plot1.png", width=480, height=480)
hist(as.numeric(as.character(subpower_data$Global_active_power)),col="blue",main="Global Active Power",xlab="Global Active Power(kilowatts)")



