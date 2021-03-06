setwd("C:/Users/C16Sara.Menke/Documents/Math378/ExploratoryData/Project1/ExData_Plotting1/exdata-data-household_power_consumption")
data=read.table("./household_power_consumption.txt",header=T,sep=";")
data$Date=as.character(data$Date)
u=(data$Date=="1/2/2007")|(data$Date=="2/2/2007")
subset=data[u,]
remove(data,u)
total.time = paste(subset$Date,subset$Time)
subset$Time=strptime(total.time,format="%d/%m/%Y %H:%M:%S")
subset$Sub_metering_1=as.character(subset$Sub_metering_1)
subset$Sub_metering_1=as.numeric(subset$Sub_metering_1)
subset$Sub_metering_2=as.character(subset$Sub_metering_2)
subset$Sub_metering_2=as.numeric(subset$Sub_metering_2)
subset$Sub_metering_3=as.character(subset$Sub_metering_3)
subset$Sub_metering_3=as.numeric(subset$Sub_metering_3)
png(filename = "plot3.png", width = 480, height = 480)
with(subset,plot(Time,Sub_metering_1,type="l",xlab="",ylab="Energy Sub Meeting",main="Energy Sub Meeting",col="black"))
with(subset,lines(Time,Sub_metering_2,type="l",col="red"))
with(subset,lines(Time,Sub_metering_3,type="l",col="blue"))
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
