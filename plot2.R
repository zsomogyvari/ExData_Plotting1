## Reading in the data of the two relevant days.
        rows_to_skip <- ( unclass(as.POSIXct("2007-02-01 00:00:00")) - unclass(as.POSIXct("2006-12-16 17:24:00")))/60 + 1
        hpc_data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, nrows = 2*24*60, skip = rows_to_skip)
        ## Setting the column names
        colnames(hpc_data) <- colnames( read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1))
        ## Overwriting "Date" column with time in POSIXlt format
        hpc_data$Date <- strptime( paste(hpc_data$Date, hpc_data$Time), "%d/%m/%Y %H:%M:%S")

## Creating the plot
        png(file = "plot2.png")
        plot(hpc_data$Date, hpc_data$Global_active_power, type = "n", ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(hpc_data$Date, hpc_data$Global_active_power)
        dev.off()



