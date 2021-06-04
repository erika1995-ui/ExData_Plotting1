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

#plot 2
png("plot2.jpg", width = 480, height = 480)

par(mfrow=c(1,1))
datetime<-strptime(paste(subset_data$Date, subset_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(datetime, globalActivePower, type="l", xlab="",ylab="Global Active Power (kilowatts)")
dev.off()