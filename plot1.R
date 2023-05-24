data=read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?",)
data$Date=as.Date(data$Date,"%d/%m/%Y")
stuff=data[(data$Date=="2007-02-01"|data$Date=="2007-02-02"),]
stuff$Time=chron(times=stuff$Time)

for (i in (3:9)){
  stuff[,i]=as.numeric(stuff[,i])
  }
png("plot1.png",width = 480, height = 480)  

hist(stuff$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()
