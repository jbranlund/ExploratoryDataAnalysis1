# Data are contained in the file: exdata_data_household_power_consumption.zip, which can be unzipped using the R command: unzip("exdata_data_household_power_consumption.zip")


# Data of Electric power consumption were downloaded from the URL: , but originally comes from the UCI web site. The 9 variables are date (dd/mm/yy), time (hh:mm:ss), global active power (minute-averaged active power used by households, in kw), global reactive power (minute-averaged reactive power used by households, in kw), voltage (minute-averaged voltage, in volts), global intensity (minute-averaged current density used by households, in ampere), and sub-metering data: 1 (kitchen use in watt-hour of active energy), 2 (laundry room use in watt-hour of active energy), and 3 (electric water heaters and air-conditioner use in watt-hour of active energy).

# Only data from 2007-02-01 and 2007-02-02 are used in this exploratory data analysis.

#Read the data

	colNames <- c("date", "time", "global_active_power", "global_reactive_power", 
		"voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
	
	data <- read.csv("household_power_consumption.txt", sep = ";" , skip = 66636, 
		nrows = 2880, col.names = colNames)

#create a datetime column which combines date and time variables

	data$datetime <- NULL
	data$datetime <- paste(data$date, data$time)
	data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S", tz = "GMT")
	
#Create plot 3

	library(datasets)
	png(file = "plot3.png", bg = "white", height = 480, width = 480)
	with(data, plot(datetime, sub_metering_1, type = "l", col= "black", 
		ylab = "Energy sub metering", xlab = ""))
	lines(data$datetime, data$sub_metering_2, col = "red")
	lines(data$datetime, data$sub_metering_3, col= "blue")
	legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
		col = c("black", "red", "blue"), lwd= 1 )
	dev.off()