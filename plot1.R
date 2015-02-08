## assumed the working directory is set to "[1] R directory" which contails a folder called ## "data" in which the "household_power_consumption.txt" is found

## read the data, specifying some basic characteristics of the dataset, such as the symbol ## used for missing values

fulldata <- read.csv("data/household_power_consumption.txt", header=T, sep=';', na.strings="?",
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## specify which variable is the date and in which form

fulldata$Date <- as.Date(fulldata$Date, format="%d/%m/%Y")

## choose the subset of the data which we will be using

subdata <- subset(fulldata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

## convert the date format

datetime <- paste(as.Date(subdata$Date), subdata$Time)
subdata$Datetime <- as.POSIXct(datetime)

## produce the first plot, specifying a main title, axes labels and bars colour

hist(subdata$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## save "plot1.png" with specific dimensions

dev.copy(png, file="plot1.png", height=480, width=480)

## turn off the device used

dev.off()