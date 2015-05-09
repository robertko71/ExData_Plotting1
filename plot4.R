## Important: The file household_power_consumption.txt has to exist in the
##            current working directory to be able to use the following code
##
## This R script shows four plots
## plot 1, top left corner, shows global active power over time
## plot 2, top right corner, shows voltage over time
## plot 3, bottom left corner, shows energy sub metering over time
## plot 4, bottom right corner, shows global reactive power over time

## read data, convert date/time values, subset data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,"%H:%M:%S")
data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
data$timestamp <- as.POSIXct(paste(data$Date,format(data$Time,'%H:%M:%S')))

png(file = "plot4.png")
par(mfrow=c(2,2))

## topleft
plot(data$timestamp,data$Global_active_power,type='l',xlab='',ylab='Global Active Power')

## topright
plot(data$timestamp,data$Voltage,type='l',xlab='datetime',ylab='Voltage')

## bottomleft
plot(data$timestamp,data$Sub_metering_1,type='l',xlab='',ylab='Energy sub metering')
points(data$timestamp,data$Sub_metering_2,type='l',col='red')
points(data$timestamp,data$Sub_metering_3,type='l',col='blue')
legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1),lwd=c(2.5,2.5,2.5),cex=0.4,bty='n')

## bottomright
plot(data$timestamp,data$Global_reactive_power,type='l',xlab='datetime',ylab='Global_reactive_power')

dev.off()