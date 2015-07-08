plot1 <- function() {
  
  ## Set the working directory
  setwd("C:/Users/BenjaminM/datasciencecoursera/ExploratoryDataAnalysis/ExploratoryGraphs/ElectricPowerConsumption")
  
  ## Read in the data as a table
  electricPowerConsumptionData <- read.table("exdata-data-household_power_consumption/household_power_consumption.txt", header = T, sep = ";")
  
  ## What does the data look like
  str(electricPowerConsumptionData)
  
  ## Format the date
  electricPowerConsumptionData$Date <- as.Date(electricPowerConsumptionData$Date, format="%d/%m/%Y")
  
  ## Subset the data and retreive the data between the 2 days from the complete data set
  data <- electricPowerConsumptionData[(electricPowerConsumptionData$Date=="2007-02-01") 
                                       | (electricPowerConsumptionData$Date=="2007-02-02"),]
  
  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
  data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
  data$Voltage <- as.numeric(as.character(data$Voltage))
  data$Global_intensity <- as.numeric(as.character(data$Global_intensity))
  
  data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
  data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
  data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
  
  ## Plot 1  
  hist(data$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")
  dev.copy(png, file="plot1.png", width=480, height=480)
  dev.off()
  cat("Plot1.png has been saved in", getwd())
  
}
plot1()