plot3 <- function() {
  
  ## Getting full dataset
  dataPlot3 <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  dataPlot3$Date <- as.Date(dataPlot3$Date, format="%d/%m/%Y")
  
  ## Subset the data and retreive the data between the 2 days from the complete data set
  data <- subset(dataPlot3, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(dataPlot3)
  
  ## convert the Date and Time variables to Date/Time classes
  DateTime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(DateTime)
  
  ## Plot 3
  plot(data$Sub_metering_1~data$Datetime, type="l", xlab="", ylab="Energy sub metering")
  lines(data$Sub_metering_2~data$Datetime, col="red")
  lines(data$Sub_metering_3~data$Datetime, col="blue")
  legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
  dev.copy(png, file="plot3.png", width=480, height=480)
  dev.off()
  cat("plot3.png has been saved in", getwd())
  
}
plot3()