## Important: The file household_power_consumption.txt has to exist in the
##            current working directory to be able to use the following code
##
## This R script shows a plot with the global active power (in kW) used in households
## over time, measured on February 1, 2007 and February 2, 2007

## read data, convert date/time values, subset data
data <- read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings = "?")
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Time <- strptime(data$Time,"%H:%M:%S")
data <- subset(data, Date=="2007-02-01" | Date=="2007-02-02")
data$timestamp <- as.POSIXct(paste(data$Date,format(data$Time,'%H:%M:%S')))

##second plot
png(file = "plot2.png")
par(mfrow=c(1,1))
plot(data$timestamp,data$Global_active_power,type='l',xlab='',ylab='Global Active Power (kilowatts)')
dev.off()
