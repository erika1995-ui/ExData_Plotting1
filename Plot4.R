#read data
data<-read.table("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors = FALSE, dec=".")
summary(data)

#subset all the rows of the data set for February 2007
subset_data<-data[(data$Date %in% c("1/2/2007","2/2/2007")),]
globalActivePower<-as.numeric(subset_data$Global_active_power)
globalReactivePower<-as.numeric(subset_data$Global_reactive_power)
voltage<-as.numeric(subset_data$Voltage)
subMetering1<-as.numeric(subset_data$Sub_metering_1)
subMetering2<-as.numeric(subset_data$Sub_metering_2)
subMetering3<-as.numeric(subset_data$Sub_metering_3)

# plot 4
png("plot4.jpg", width = 480, height = 480)
par(mfrow=c(2,2))
datetime<-strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
#first plot 
plot(datetime, globalActivePower, type="l",xlab="",ylab="Global Active Power", cex=0.2)
#second plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
#third plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime,subMetering2, type="l",col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"),bty="o")
#fourth plot
plot(datetime, globalReactivePower, type="l",xlab="datetime",ylab="Global_reactive_power",cex=0.2)
dev.off()