## Reading in the data of the two relevant days.
        rows_to_skip <- ( unclass(as.POSIXct("2007-02-01 00:00:00")) - unclass(as.POSIXct("2006-12-16 17:24:00")))/60 + 1
        hpc_data <- read.table("household_power_consumption.txt", sep = ";", header = FALSE, nrows = 2*24*60, skip = rows_to_skip)
        ## Setting the column names
        colnames(hpc_data) <- colnames( read.table("household_power_consumption.txt", sep = ";", header = TRUE, nrows = 1))
        ## Overwriting "Date" column with time in POSIXlt format
        hpc_data$Date <- strptime( paste(hpc_data$Date, hpc_data$Time), "%d/%m/%Y %H:%M:%S")

        ## Creating the top left plot
        png(file = "plot4.png")
        par(mfrow = c(2,2))
        plot(hpc_data$Date, hpc_data$Global_active_power, type = "n", ylab = "Global Active Power", xlab = "")
        lines(hpc_data$Date, hpc_data$Global_active_power)

        ## Creating the top right plot
        plot(hpc_data$Date, hpc_data$Voltage, type = "n", ylab = "Voltage", xlab = "datetime")
        lines(hpc_data$Date, hpc_data$Voltage)

        ## Creating the bottom left plot
        plot(hpc_data$Date, hpc_data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
        lines(hpc_data$Date, hpc_data$Sub_metering_1)
        lines(hpc_data$Date, hpc_data$Sub_metering_2, col = "red")
        lines(hpc_data$Date, hpc_data$Sub_metering_3, col = "blue")
        legend("topright", col = c("black", "red", "blue"), legend = colnames(hpc_data)[7:9], lty = 1, box.lty = 0, inset = 0.01, cex = 0.9)

        ## Creating the bottom right plot
        plot(hpc_data$Date, hpc_data$Global_reactive_power, type = "n", ylab = "Global_reactive_power", xlab = "datetime")
        lines(hpc_data$Date, hpc_data$Global_reactive_power)

dev.off()





