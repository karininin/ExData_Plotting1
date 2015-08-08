theurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
unzip("power_consumption.zip")
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y") #transform the dates into date obects in order to use them as dates
plotdata<-mydata[mydata$Date>as.Date("2007-01-31")& mydata$Date<as.Date("2007-02-03"),] #select only the two relevant days
rm(mydata)

datetime<-paste(plotdata$Date,plotdata$Time) #make a column of the date and time combined
plotdata$datetime<-strptime(plotdata$datetime,"%Y-%m-%d %H:%M:%S") #convert that column into POSIXlt objects

png(filename="plot4.png")
par("mfrow"=c(2,2))
plot(plotdata$datetime,plotdata$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(plotdata$datetime,plotdata$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(plotdata$datetime,plotdata$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(plotdata$datetime,plotdata$Sub_metering_2,col="red")
lines(plotdata$datetime,plotdata$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
plot(plotdata$datetime,plotdata$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()