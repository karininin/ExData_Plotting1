theurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
unzip("power_consumption.zip")
mydata<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

mydata$Date<-as.Date(mydata$Date,"%d/%m/%Y") #transform the dates into date obects in order to use them as dates
plotdata<-mydata[mydata$Date>as.Date("2007-01-31")& mydata$Date<as.Date("2007-02-03"),] #select only the two relevant days
rm(mydata)

datetime<-paste(plotdata$Date,plotdata$Time) #make a column of the date and time combined
plotdata$datetime<-strptime(plotdata$datetime,"%Y-%m-%d %H:%M:%S") #convert that column into POSIXlt objects

png(filename="plot1.png")
hist(plotdata$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)") #create histogram
dev.off()