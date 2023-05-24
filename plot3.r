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

png("plot3.png",width = 480, height = 480)  

plot(stuff$Sub_metering_1,type="l",ylab="Sub sub metering",xaxt="n",xlab="",col="black")
lines(stuff$Sub_metering_2,col="red")
lines(stuff$Sub_metering_3,col="blue")

axis(1,at=c(1,as.integer(table(stuff$Day)["Thu"]),length(stuff$Day)),labels=c("Thu","Fri","Sat"))
legend(length(stuff$Day)*0.7,max(stuff$Sub_metering_1),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","green","blue"))

dev.off()
