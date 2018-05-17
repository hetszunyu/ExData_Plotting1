##read entire table - download zip and extract txt
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="hpc.zip")
unzip("hpc.zip")
hpc<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##subset to 1/2 and 2/2 in 2007, remove big data table from memory
x<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
rm(hpc)
y<-strptime(paste(x$Date,x$Time), format="%d/%m/%Y %H:%M:%S")
plot(y,x$Global_active_power, main="", xlab="", ylab="Global Active Power (kilowatts)", type="l")
dev.copy(png,'plot2.png')
dev.off()