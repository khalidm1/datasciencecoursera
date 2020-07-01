download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = './Data_Plotting.zip', method = 'curl', quiet = T)
unzip(zipfile = 'Data_Plotting.zip')


# Creating 4 Plots

par(mfrow = c(2, 2)) #mfrow from left to right, top to bottom (organize the plots)

# plot1
plot(x = D1$DateTime, y = D1$GlobalActivePower, 
     type = 'l', xlab = NA, ylab = 'Global Active Power')
#plot2
plot(x = D1$DateTime, y = D1$Voltage, 
     type = 'l', xlab = 'datetime', ylab = 'Voltage')
#plot3
plot(x = D1$DateTime, y = D1$SubMetering1, type = 'l', xlab = NA, ylab = 'Energy sub metering')
lines(x = D1$DateTime, y = D1$SubMetering2, col = 'red')
lines(x = D1$DateTime, y = D1$SubMetering3, col = 'blue')

legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lwd = 1, bty = 'n')

#plot4
plot(x = D1$DateTime, y = D1$GlobalReactivePower, type = 'l', xlab = 'datetime', ylab = 'Global_reactive_power')

