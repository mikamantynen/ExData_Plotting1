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


png("plot2.png",width = 480, height = 480)  

plot(stuff$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
axis(1,at=c(1,as.integer(table(stuff$Day)["Thu"]),length(stuff$Day)),labels=c("Thu","Fri","Sat"))

dev.off()
