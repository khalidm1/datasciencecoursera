download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
              destfile = './Data_Plotting.zip', method = 'curl', quiet = T)
unzip(zipfile = 'Data_Plotting.zip')


#legend
plot(x = D1$DateTime, y = D1$SubMetering1, type = 'l', xlab = NA, ylab = 'Energy sub metering')

lines(x = D1$DateTime, y = D1$SubMetering2, col = 'red')
lines(x = D1$DateTime, y = D1$SubMetering3, col = 'blue')

legend('topright', legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), col = c('black', 'red', 'blue'), lwd = 1)
