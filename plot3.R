## assumed the working directory is set to "[1] R directory" which contails a folder called 
## "data" in which the "household_power_consumption.txt" is found

## read the data, specifying some basic characteristics of the dataset, such as the symbol 
## used for missing values

data <- "data/household_power_consumption.txt"
fulldata <- read.table(data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## specify which variable is the date and in which form

subData <- fulldata[fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

## specify which variables are to be read in numeric form

globalActivePower <- as.numeric(subData$Global_active_power)
subMetering1 <- as.numeric(subData$Sub_metering_1)
subMetering2 <- as.numeric(subData$Sub_metering_2)
subMetering3 <- as.numeric(subData$Sub_metering_3)

##specify the third "png" file name and dimensions

png("plot3.png", width=480, height=480)

## produce the third plot, including axes labels and point type

plot(datetime, subMetering1, type="l", ylab="Energy Sub metering", xlab="")

## choose colour for each variable so they can be easily distinguished and compared in the 
## plot

lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")

## add to legend which shows which colour is for which variable

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

## turn off the device used

dev.off()