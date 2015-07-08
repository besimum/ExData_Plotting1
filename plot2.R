plot2 <- function() {
  
  ## Getting full dataset
  dataPlot2 <- read.csv("exdata-data-household_power_consumption/household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
  dataPlot2$Date <- as.Date(dataPlot2$Date, format="%d/%m/%Y")
  
  
  ## Subset the data and retreive the data between the 2 days from the complete data set
  data <- subset(dataPlot2, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
  rm(dataPlot2)
  
  ## convert the Date and Time variables to Date/Time classes
  DateTime <- paste(as.Date(data$Date), data$Time)
  data$Datetime <- as.POSIXct(DateTime)
  
  ## Plot 2
  plot(data$Global_active_power~data$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
  cat("Plot2.png has been saved in", getwd())
  
}
plot2()