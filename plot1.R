##read entire table - download zip and extract txt
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="hpc.zip")
unzip("hpc.zip")
hpc<-read.table("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")

##subset to 1/2 and 2/2 in 2007, remove big data table from memory
x<-hpc[hpc$Date=="1/2/2007"|hpc$Date=="2/2/2007",]
rm(hpc)

hist(x$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.copy(png,'plot1.png')
dev.off()
