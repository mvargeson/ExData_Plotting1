# use source directory as current working directory
this.dir <- dirname(parent.frame(2)$ofile)
setwd(this.dir)

url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile<- "exdata-data-household_power_consumption.zip"

# if the file does not exist download and unzip to working directory
if(!file.exists(destfile))
  download.file(url=url, destfile=destfile)
  unzip(destfile)

# read dates 1/2/2007 through 2/2/2007
hpc <- read.csv("household_power_consumption.txt", header=FALSE, sep=";", na.strings="?", skip=66637, nrows=2880)
colnames(hpc) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity",
                   "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# using the PNG device driver because dev.copy results in strwidth issues
png(file="plot1.png", width=480, height=480)

# Global active power frequency plot
hist(hpc$Global_active_power, breaks=12, xlim=c(0, 6), ylim=c(0, 1200), col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency")

# turn off the PNG device driver
dev.off()