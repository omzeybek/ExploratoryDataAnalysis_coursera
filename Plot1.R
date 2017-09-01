#this code reads data into R, using provided attributes of data set 
hpc <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=T, comment.char="", quote='\"')

#Now i will subset two distinct dates which all the work will be done 

hpc_filt<-subset(hpc,Date %in% c("1/2/2007","2/2/2007"))

#Now i am setting class of Date variable into Date format 
hpc_filt$Date<-as.Date(hpc_filt$Date,format="%d/%m/%Y")

#Now a quick check
head(hpc_filt)

#plot 1 
 hist(hpc_filt$Global_active_power,main="Global Active Power",xlab="Global Active Power (kilowatts",ylab="Frequency",col="Red")
 png("plot1.png", width=480, height=480)
 dev.off()
