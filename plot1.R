setwd("~/Cursos/Data Science/Exploratory Data Analysis/Assignment 1/ExData_Plotting1")
filename = "./data/household_power_consumption.txt"

## Getting the zip file, and unzipping it.
if (!file.exists(filename)) {
      
      fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
      zipfile <- "./data/household_power_consumption.zip"
      download.file(url=fileUrl, destfile=zipfile)
      unzip(zipfile, exdir = "./data")
}


## Read the household_power_consumption data, and set parameters
hpc_data <- read.table(filename, sep = ";", header = TRUE, na = "?",
                       colClasses = c("character", "character", rep("numeric",7)))



## Formatting the date
hpc_data$Date = as.Date(hpc_data$Date, format="%d/%m/%Y")

## Subseting data according to requirement 
## (We will only be using data from the dates 2007-02-01 and 2007-02-02)
startDate = as.Date("01/02/2007", format="%d/%m/%Y")
endDate = as.Date("02/02/2007", format="%d/%m/%Y")
hpc_subset = hpc_data[hpc_data$Date >= startDate & hpc_data$Date <= endDate, ]


## Creating the plot
hist(hpc_subset$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col="red") ##Creating it in the computer screen for evaluation purpose
dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off()
