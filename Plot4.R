#this code reads data into R, using provided attributes of data set 
hpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=T, comment.char="", quote='\"')

#Now i will subset two distinct dates which all the work will be done 

hpc_filt<-subset(hpc,Date %in% c("1/2/2007","2/2/2007"))

#Now i am setting class of Date variable into Date format. But in plot2 i need to show time variable as well 
hpc_filt$Date<-as.Date(hpc_filt$Date,format="%d/%m/%Y")
datetime<-paste(as.Date(hpc_filt$Date),hpc_filt$Time)
hpc_filt$Datetime<-as.POSIXct(datetime)


#Now a quick check
head(hpc_filt)

#Arrangements for a multiple graph panel

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))


#Skecth plot 3, I will add two extra lines to plot2
with(hpc_filt, {
        plot(Global_active_power~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        plot(Voltage~Datetime, type="l", 
             ylab="Voltage (volt)", xlab="")
        plot(Sub_metering_1~Datetime, type="l", 
             ylab="Global Active Power (kilowatts)", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l", 
             ylab="Global Rective Power (kilowatts)",xlab="")
})
#Now export
png("plot4.png", width=480, height=480)
dev.off()