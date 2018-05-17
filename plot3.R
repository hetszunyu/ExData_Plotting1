##read entire table - download zip and extract txt
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="hpc.zip")
unzip("hpc.zip")
hpc<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##subset to 1/2 and 2/2 in 2007, remove big data table from memory
x<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
rm(hpc)
y<-strptime(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S")

plot(y,x$Sub_metering_1, main="", xlab="", ylab="Energy sub metering", type="l")
points(y,x$Sub_metering_2, type="l", col="red")
points(y,x$Sub_metering_3, type="l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
dev.copy(png,'plot3.png')
dev.off()