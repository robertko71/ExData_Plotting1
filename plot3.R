## Important: The file household_power_consumption.txt has to exist in the
##            current working directory to be able to use the following code
##
## This R script shows a plot with energy sub metering (in watt-hour) in householda
## over time, measured on February 1, 2007 and February 2, 2007
## Sub metering 1 corresponds to the kitchen
## Sub metering 2 corresponds to the laundry room
## Sub metering 3 corresponds to the electric water-heater and air-conditioner

## read data, convert date/time values, subset data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,"%H:%M:%S")
data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
data$timestamp <- as.POSIXct(paste(data$Date,format(data$Time,'%H:%M:%S')))

##third plot
png(file = "plot3.png")
par(mfrow=c(1,1))
plot(data$timestamp,data$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
points(data$timestamp,data$Sub_metering_2,type='l',col='red')
points(data$timestamp,data$Sub_metering_3,type='l',col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1),lwd=c(2.5,2.5,2.5))
dev.off()
