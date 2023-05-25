install.packages("chron")
library(chron)

data=read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",)
data$Date=as.Date(data$Date,"%d/%m/%Y")
stuff=data[(data$Date=="2007-02-01"|data$Date=="2007-02-02"),]
stuff$Time=chron(times=stuff$Time)

for (i in (3:9)){
  stuff[,i]=as.numeric(stuff[,i])
  }

stuff$Day=weekdays(stuff$Date,abbreviate=TRUE)

png("plot4.png",width = 480, height = 480)  

par(mfcol=c(2,2))

#1
plot(stuff$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
axis(1,at=c(1,as.integer(table(stuff$Day)["Thu"]),length(stuff$Day)),labels=c("Thu","Fri","Sat"))

#2
plot(stuff$Sub_metering_1,type="l",ylab="Sub sub metering",xaxt="n",xlab="",col="black")
lines(stuff$Sub_metering_2,col="red")
lines(stuff$Sub_metering_3,col="blue")

axis(1,at=c(1,as.integer(table(stuff$Day)["Thu"]),length(stuff$Day)),labels=c("Thu","Fri","Sat"))
legend("topright",max(stuff$Sub_metering_1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","green","blue"))

#3
plot(stuff$Voltage,type="l",ylab="Voltage",xaxt="n",xlab="",sub="datetime")
axis(1,at=c(1,as.integer(table(stuff$Day)["Thu"]),length(stuff$Day)),labels=c("Thu","Fri","Sat"))


#4
plot(stuff$Global_reactive_power,type="l",ylab="Global Reactive Power",xaxt="n",xlab="",sub="datetime")
axis(1,at=c(1,as.integer(table(stuff$Day)["Thu"]),length(stuff$Day)),labels=c("Thu","Fri","Sat"))
dev.off()
